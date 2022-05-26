import { ctx, game } from "../game.js";
import { Box } from "./Box.js";
import { clamp, getTextureByIndex, trasformTexture } from "./util.js";

export class Player extends Box {
  constructor(x, y, w, h) {
    super(x, y, w, h, { inertia: Infinity });
    this.size = { x: w, y: h };
    this.jumpSensor = Matter.Bodies.rectangle(x, y + this.size.x * 1.001, this.size.x * 0.8, this.size.y * 0.2, { sleepThreshold: 99999999999, isSensor: true, parentClass: this });
    this.main = Matter.Bodies.rectangle(x, y, this.size.x, this.size.y, { name: "player", parentClass: this });
    this.body = Matter.Body.create({
      parts: [this.main, this.jumpSensor],
      inertia: Infinity,
      friction: 0.03, //0.002,
      //frictionAir: 0.12,
      restitution: 0.1,
      sleepThreshold: Infinity,
      mass: 5,
      name: "player",
      //collisionFilter: {
      //   group: -2,
      //},
      frictionStatic: 0.1,
      frictionAir: 0,
    });

    console.log(this.body.name);
    //Matter.Composites
    //this.main.lightPower = 400;
    game.eventHandler.addClass(this);
    this.speed = 0.02; //0.01;
    this.jumpPower = 0.036;
    this.body.friction = 0.1; //0.012;
    this.grounded = false;
    this.maxSpeed = 5;
    this.startSpeed = this.maxSpeed;

    this.spawnPos = { x: x, y: y };

    this.maxPos = 10;

    this.lockMovement = false;
  }
  draw(ctx) {
    //super.draw(ctx, this.main);
    if (window.DebugMode) {
      this.drawCollider(ctx, this.jumpSensor, "rgba(0,255,0,0.3)");
      return;
    }
    let pos = this.main.position;
    ctx.save();
    ctx.translate(pos.x, pos.y);
    ctx.rotate(this.body.angle);
    ctx.translate(-pos.x, -pos.y);

    const ptrn = ctx.createPattern(getTextureByIndex(27, 64, 64, this.size.x, this.size.y), "repeat");

    ctx.fillStyle = ptrn;
    ctx.beginPath();

    let bodyDraw = this.main.vertices;
    ctx.moveTo(bodyDraw[0].x, bodyDraw[0].y);
    for (let j = 1; j < bodyDraw.length; j += 1) {
      ctx.lineTo(bodyDraw[j].x, bodyDraw[j].y);
    }
    ctx.lineTo(bodyDraw[0].x, bodyDraw[0].y);
    ctx.translate(bodyDraw[0].x, bodyDraw[0].y);
    ctx.fill();

    ctx.restore();
  }
  update() {
    Matter.Body.setVelocity(this.body, { x: this.body.velocity.x.toFixed(2), y: this.body.velocity.y });
    Matter.Body.setAngle(this.body, 0);
    this.main.lightPower = game.GUI.fuel * 4;
    if (this.main.position.x > this.maxPos + 30) {
      this.maxPos = this.main.position.x;
      game.GUI.points++;
      if (game.points > game.max) {
        max = game.points;
      }
    }
    if (/*this.main.position.x < ctx.canvas.width * (game.map.loop - 2) + ctx.canvas.width * 0.7 || */ this.main.position.y > ctx.canvas.height * 1.5) {
      console.log("DEAD");
      game.reset();
      //this.kill();
    }
    //let x = clamp(-10, 10, this.body.velocity.x + this.velocity.x);
    //let y = clamp(-10, 10, this.body.velocity.y + this.velocity.y);
    //let x = this.body.position.x + this.velocity.x;
    //let y = this.body.position.y + this.velocity.y;
    //Matter.Body.setVelocity(this.body, { x: x, y: y });

    //Matter.Body.applyForce(this.body, { x: x, y: y }, { x: this.velocity.x / 200, y: this.velocity.y / 200 });
    //if (!this.grounded) this.velocity.y = 0;
    if (!this.lockMovement) {
      if (game.eventHandler.keys["KeyD"]) {
        if (this.body.velocity.x < this.maxSpeed) {
          this.body.force.x = this.speed;
        }
      }
      if (game.eventHandler.keys["KeyA"]) {
        if (this.body.velocity.x > -this.maxSpeed) {
          this.body.force.x = -this.speed;
        }
      }
      if (game.eventHandler.keys["Space"]) {
        if (this.grounded) {
          this.body.force.y = -this.jumpPower;
          this.grounded = false;
        }
      }
    }
  }
  afterAdded() {
    //this.body.type = "player";
  }
  /**
   *
   * @param {Event} e
   */
  handleEvent(e) {
    let g = (event) => {
      let enter = () => {
        if (!this.grounded) {
          this.grounded = true;
          //this.body.friction = 0.002
          //this.body frictionAir = 0.12,
        }
      };
      const pairs = event.pairs;
      for (let i = 0, j = pairs.length; i != j; ++i) {
        let pair = pairs[i];
        if (pair.bodyA == this.body || this.body.parts.includes(pair.bodyA) || pair.bodyB == this.body || this.body.parts.includes(pair.bodyB)) {
          if (pair.bodyA === this.jumpSensor && !pair.bodyB.isSensor) {
            enter();
          } else if (pair.bodyB === this.jumpSensor && !pair.bodyA.isSensor) {
            enter();
          }
          if (pair.bodyA.name == "fuel") {
            pair.bodyA.Chunk.remove(pair.bodyA.parentClass, () => {
              game.GUI.addFuel(10);
              console.log("add Fuel A");
              //clamp(0, 100, game.GUI.fuel);
            });
          } else if (pair.bodyB.name == "fuel") {
            console.log(pair.bodyB.parentClass);
            pair.bodyB.Chunk.remove(pair.bodyB.parentClass, () => {
              game.GUI.addFuel(10);
              console.log("add Fuel B");
              //clamp(0, 100, game.GUI.fuel);
            });
          }
          //console.log(pair.bodyB.type);
        }
      }
    };
    if (e.name == "collisionStart") {
      g(e);
    }
    if (e.name == "collisionActive") {
      g(e);
    }
    if (e.name == "collisionEnd") {
      let enter = () => {
        if (this.grounded) {
          this.grounded = false;
        }
      };
      const pairs = e.pairs;
      for (let i = 0, j = pairs.length; i != j; ++i) {
        let pair = pairs[i];
        if (pair.bodyA === this.jumpSensor) {
          enter();
        } else if (pair.bodyB === this.jumpSensor) {
          enter();
        }
      }
    }
  }
  kill() {
    this.maxSpeed = this.startSpeed;
    this.maxPos = 10;
    Matter.Body.setPosition(this.body, this.spawnPos);
    Matter.Body.setVelocity(this.body, { x: 0, y: 0 });
  }
}
