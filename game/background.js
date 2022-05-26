import { game } from "../game.js";
import { GameObject, getTextureByIndex, lerp, lerpVector, trasformTexture } from "./util.js";

export class Background extends GameObject {
  constructor() {
    super();
    this.size = { x: 900, y: 700 };
    this.posX = 0;
  }
  update() {
    this.posX = lerp(this.posX, game.Player.body.position.x - this.size.x / 2, 1);
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  draw(ctx) {
    
    ctx.save();
    const ptrn = ctx.createPattern(getTextureByIndex(28), "repeat");
    ctx.fillStyle = ptrn;
    ctx.fillRect(this.posX, 0, this.size.x, this.size.y);
    ctx.restore();
  }
}
