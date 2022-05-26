import { ctx, game } from "../game.js";
import { GameObject, getRGBvalues } from "./util.js";

export class ShadowMask extends GameObject {
  constructor() {
    super();
    this.pos = { x: 0, y: 0 };
    this.shadowCanvas = document.createElement("canvas");
    this.shadowCanvas.width = 900;
    this.shadowCanvas.height = 700;
    this.shadowCanvasCtx = this.shadowCanvas.getContext("2d");
    this.lightSources = [];
  }
  ligthen(x, y, radius, color, startAngle = 0, endAngle = 2 * Math.PI) {
    let colorRGB = getRGBvalues(color);
    if (radius < 0) radius = 0;
    //if(!colorRGB)return
    //console.log(`rgb(${colorRGB.r / 10},${colorRGB.g / 10},${colorRGB.b / 10})`);
    this.shadowCanvasCtx.save();
    this.shadowCanvasCtx.globalCompositeOperation = "lighter";
    var rnd = 0.05 * Math.sin((1.1 * game.tick) / 1000);
    radius = radius * (1 + rnd);
    var radialGradient = ctx.createRadialGradient(x, y, 0, x, y, radius);
    radialGradient.addColorStop(0.0, `rgb(${colorRGB.r},${colorRGB.g},${colorRGB.b})`);

    radialGradient.addColorStop(1, "#000");
    this.shadowCanvasCtx.fillStyle = radialGradient;
    this.shadowCanvasCtx.beginPath();
    this.shadowCanvasCtx.arc(x, y, radius, startAngle, endAngle);
    this.shadowCanvasCtx.fill();
    this.shadowCanvasCtx.restore();
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  draw(ctx) {
    if (game.isshaking) ctx.restore();
    if (window.DebugMode) return;
    //return;
    ctx.save();
    ctx.globalCompositeOperation = "multiply";
    this.shadowCanvasCtx.save();
    this.shadowCanvasCtx.fillStyle = "black";
    this.shadowCanvasCtx.fillRect(0, 0, ctx.canvas.width + 500, ctx.canvas.height + 500);
    this.shadowCanvasCtx.translate(-(game.Player.body.position.x - this.shadowCanvasCtx.canvas.width / 2), 0);
    for (let i = 0; i < this.lightSources.length; i++) {
      let lightPower = this.lightSources[i].lightPower;
      if (this.lightSources[i].name == "player" && lightPower < 300) {
        lightPower = 300;
      }
      this.ligthen(this.lightSources[i].position.x, this.lightSources[i].position.y, lightPower, this.lightSources[i].lightColor, this.lightSources[i].startAngle, this.lightSources[i].endAngle);
    }

    ctx.drawImage(this.shadowCanvas, game.Player.body.position.x - this.shadowCanvasCtx.canvas.width / 2, this.pos.y);
    this.shadowCanvasCtx.restore();
    ctx.restore();
  }
  update() {}
  /**
   *
   * @param {GameObject} c
   */
  addLightSource(c, power = 200, lightColor = "#ffffe0") {
    console.log(c.name, c.lightPower, !c.lightPower, lightColor);
    if (!c.lightPower) c.lightPower = power;
    if (!c.lightColor) {
      if (lightColor) {
        c.lightColor = lightColor;
      } else c.lightColor = "#ffffe0";
    }
    if (!c.startAngle) c.startAngle = 0;
    if (!c.endAngle) c.endAngle = 2 * Math.PI;
    this.lightSources.push(c);
  }
  /**
   *
   * @param {GameObject} c
   */
  removeLightSource(c) {
    console.log(c, this.lightSources, this.lightSources.indexOf(c));
    let index = this.lightSources.indexOf(c);
    if (index != -1) {
      this.lightSources.splice(index, 1);
    } else console.error(`Class ${c.constructor.name} not Found`);
  }
}
