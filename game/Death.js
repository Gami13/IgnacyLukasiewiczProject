import { ctx, game } from "../game.js";
import { Ground } from "./ground.js";
import { distanceVector2, GameObject, lerp } from "./util.js";

export class Death extends Ground {
  constructor() {
    super(-405, 300, 800, 600);
    this.speed = 0;
    this.startSpeed = 3;

    this.spawnPos = { x: -405, y: 300 };

    this.pause = false;
  }
  reset() {
    this.speed = 0;
    Matter.Body.setPosition(this.body, this.spawnPos);
    Matter.Body.setVelocity(this.body, { x: 0, y: 0 });
  }
  start() {
    this.speed = this.startSpeed;
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  draw(ctx) {
    ctx.save();
    var dy = Math.random() * 2;
    ctx.translate(0, dy);
    super.draw(ctx);
    ctx.restore();
  }
  update() {
    return;
    //console.log(this.body.position.x + this.size.x - game.Player.main.position.x);
    if (this.body.position.x + this.size.x + 200 > game.Player.body.position.x) {
      game.isshaking = true;
      //TODO
      //console.log(distanceVector(this.body.position.x + this.size.x / 2, this.body.position.y + this.size.y / 2, game.Player.main.position.x, game.Player.main.position.y));
      ctx.save();
      let dx = Math.random() * 10; //lerp(this.body.position.x + this.size.x - game.Player.main.position.x, 10, 1);
      let dy = Math.random() * 10; //lerp(this.body.position.x + this.size.x - game.Player.main.position.x, 10, 1);
      ctx.translate(dx, dy);
      //console.log("???????");
    }
    if (!this.pause) Matter.Body.setPosition(this.body, { x: this.body.position.x + this.speed, y: this.body.position.y });
  }
}
