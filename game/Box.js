import { game } from "../game.js";
import { Game } from "./Game.js";
import { GameObject, getRGBvalues, getTextureByIndex, isColorLight, trasformTexture } from "./util.js";

export class Box extends GameObject {
  constructor(x, y, w, h, options = null) {
    super();
    this.size = { x: w, y: h };
    options.parentClass = this;
    this.body = Matter.Bodies.rectangle(x, y, this.size.x, this.size.y, options);
    this.textureIndex = 0;
    for (let i = 0; i < this.body.parts.length; i++) {
      this.body.parts[i].parentClass = this;
    }
  }
  /**
   * @description add object to physics engine
   * @param {Game} game
   */
  init(game) {
    Matter.Composite.add(game.world, this.body);
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   * @param {*} colider
   * @param {string} color
   */
  drawCollider(ctx, colider, color) {
    ctx.beginPath();
    let bodyDraw = colider.vertices;
    ctx.moveTo(bodyDraw[0].x, bodyDraw[0].y);
    for (let j = 1; j < bodyDraw.length; j += 1) {
      ctx.lineTo(bodyDraw[j].x, bodyDraw[j].y);
    }
    ctx.lineTo(bodyDraw[0].x, bodyDraw[0].y);
    ctx.save();
    ctx.fillStyle = color;
    ctx.globalAlpha = 0.7;
    ctx.fill();
    ctx.strokeStyle = "#000";
    ctx.stroke();
    ctx.fillStyle = isColorLight(getRGBvalues(color)) ? "rgb(0,0,0)" : "rgb(255,255,255)";
    ctx.textAlign = "center";
    ctx.textBaseline = "middle";
    ctx.fillText(colider.id, colider.position.x, colider.position.y);
    ctx.restore();
  }
  /**
   * @deprecated
   * @description runs After initialization
   */
  afterAdded() {}
  remove() {
    Matter.Composite.remove(game.world, this.body);
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  draw(ctx, colider) {
    let pos = this.body.position;
    let body = this.body;
    if (colider) {
      pos = colider.position;
      body = colider;
    }
    if (window.DebugMode) {
      this.drawCollider(ctx, this.body, this.color);
      return;
    }
    //pos.x = Math.floor(pos.x);
    //pos.y = Math.floor(pos.y);

    ctx.fillStyle = this.color;
    ctx.save();
    ctx.translate(pos.x, pos.y);
    ctx.rotate(this.body.angle);
    ctx.translate(-pos.x, -pos.y);

    //ctx.fillStyle = ptrn;
    ctx.beginPath();

    let bodyDraw = body.vertices;
    ctx.moveTo(bodyDraw[0].x, bodyDraw[0].y);
    for (let j = 1; j < bodyDraw.length; j += 1) {
      ctx.lineTo(bodyDraw[j].x, bodyDraw[j].y);
    }
    ctx.lineTo(bodyDraw[0].x, bodyDraw[0].y);
    ctx.translate(bodyDraw[0].x, bodyDraw[0].y);
    ctx.fill();

    ctx.restore();
    // ctx.translate(pos.x, pos.y);
    // ctx.rotate(this.body.angle);
    // ctx.translate(-pos.x, -pos.y);
    // ctx.fillRect(pos.x - this.size.x / 2, pos.y - this.size.y / 2, this.size.x, this.size.y);
    // ctx.strokeStyle = "#ff00cc";
  }
  /**
   * @deprecated
   * @param {*} e
   */
  onColision(e) {
    console.log(e);
  }
}
