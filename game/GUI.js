import { game } from "../game.js";
import { clamp, GameObject, lerp } from "./util.js";

export class GUI extends GameObject {
  constructor() {
    super();
    this.init();
  }
  init() {
    this.fuel = 100;
    this.fuelDrainSpeed = 0.07;
    this.startDrainSpeed = this.fuelDrainSpeed;
    this.points = 0;
    this.next = 100;

    this.color = game.tick * 1.1;
  }
  addFuel(a) {
    this.fuel += a;
    this.fuel = clamp(0, 300, this.fuel);
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  draw(ctx) {
    if (window.DebugMode) {
      ctx.fillStyle = "rgb(150,150,150)";
      ctx.strokeStyle = "rgb(38,38,38)";
    } else {
      ctx.fillStyle = "rgb(38,38,38)";
      ctx.strokeStyle = "rgb(255,255,255)";
    }
    let a = clamp(0, 100, this.fuel);
    ctx.fillRect(10, 10, a, 20);
    ctx.beginPath();
    ctx.rect(10, 10, 100, 20);
    ctx.stroke();
    ctx.fillStyle = "rgb(255,255,255)";
    ctx.textAlign = "left";
    ctx.textBaseline = "middle";
    ctx.font = "20px sans-serif";
    ctx.fillText(`${this.fuel.toFixed()}left`, 115, 20);
    ctx.textAlign = "center";
    ctx.fillText(`${this.points.toFixed()}`, 400, 20);

    if (game.state == "START") {
      if (this.color > 230) {
        this.color = lerp(4, 0, game.tick);
      } else this.color = lerp(0, 4, game.tick);

      //}
      ctx.fillStyle = `rgb(${this.color},${this.color},${this.color})`;
      ctx.textAlign = "center";
      ctx.textBaseline = "middle";
      ctx.font = "40px sans-serif";
      ctx.fillText(`Press space to start`, 400, 500);
    }
  }
  update() {
    if (game.state == "RUNNING") {
      this.fuel -= this.fuelDrainSpeed;
      this.fuel = clamp(-2, 300, this.fuel);
      if (this.fuel == -2) game.reset();
      if (this.points > this.next) {
        this.next += 100;
        game.Player.maxSpeed += 0.5;
        game.death.speed += 0.7;
      }
    }
  }
}
