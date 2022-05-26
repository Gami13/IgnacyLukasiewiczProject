import { game } from "../game.js";
import { Box } from "./Box.js";
import { Game } from "./Game.js";
import { Map, MAP } from "./map.js";
import { forAllcoliders, GameObject, getTextureByIndex, getTextureXY, randomFloat, randomInt, trasformTexture } from "./util.js";

export class Tile extends Box {
  /**
   *
   * @param {number} x
   * @param {number} y
   * @param {number} w
   * @param {number} h
   * @param {object} options
   * @param {string} type
   */
  constructor(x, y, w, h, options = {}, type = "null") {
    super(x, y, w, h, { isStatic: true, name: type, ...options });
    this.light = false;
    this.textureIndex = 0;
    this.type = type;
  }
  remove() {
    if (this.light) game.shadowMask.removeLightSource(this.body);
    super.remove();
  }
  /**
   * @description add object to physics engine
   * @param {Game} game
   */
  init(game) {
    Matter.World.add(game.world, this.body);
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  draw(ctx, colider) {
    if (window.DebugMode) {
      this.drawCollider(ctx, this.body);
      return;
    }
    let pos = this.body.position;
    if (colider) {
      pos = colider.position;
    }
    ctx.save();
    ctx.translate(pos.x, pos.y);
    ctx.rotate(this.body.angle);
    ctx.translate(-pos.x, -pos.y);

    const ptrn = ctx.createPattern(trasformTexture(getTextureByIndex(this.textureIndex), this.size.x, this.size.y, this.size.x / MAP.w, this.size.y / MAP.h), "repeat");

    ctx.fillStyle = ptrn;
    ctx.beginPath();

    let bodyDraw = this.body.vertices;
    ctx.moveTo(bodyDraw[0].x, bodyDraw[0].y);
    for (let j = 1; j < bodyDraw.length; j += 1) {
      ctx.lineTo(bodyDraw[j].x, bodyDraw[j].y);
    }
    ctx.lineTo(bodyDraw[0].x, bodyDraw[0].y);
    ctx.translate(bodyDraw[0].x, bodyDraw[0].y);
    ctx.fill();

    ctx.restore();
  }
}

export class GroundTile extends Tile {
  /**
   *
   * @param {number} x
   * @param {number} y
   * @param {number} w
   * @param {number} h
   * @param {Array} tileMap
   */
  constructor(x, y, w, h) {
    super(x, y, w, h, {}, "ground");
    this.tileMap = [];
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  draw(ctx) {
    for (let i = 0; i < this.tileMap.length; i++) {
      ctx.save();
      //console.log(this.tileMap[i].textureIndex, this.tileMap[].textureIndex + 2);
      //console.log(this.tileMap[i].textureIndex + 2);

      const ptrn = ctx.createPattern(trasformTexture(getTextureByIndex(this.tileMap[i].textureIndex + 2), MAP.w, MAP.h, 128, 128), "repeat");
      ctx.strokeStyle = i % 2 ? "rgb(255,255,255)" : "rgb(0,0,0)";
      ctx.fillStyle = ptrn;
      ctx.beginPath();

      let bodyDraw = this.tileMap[i].bodyVericies;
      ctx.moveTo(bodyDraw[0].x, bodyDraw[0].y);
      for (let j = 1; j < bodyDraw.length; j += 1) {
        ctx.lineTo(bodyDraw[j].x, bodyDraw[j].y);
      }
      ctx.lineTo(bodyDraw[0].x, bodyDraw[0].y);
      ctx.translate(bodyDraw[0].x, bodyDraw[0].y);

      //ctx.stroke();

      ctx.fill();

      /*       ctx.font = "12px Arial";
      ctx.fillStyle = "rgb(255,255,255)";
      ctx.textAlign = "center";
      ctx.textBaseline = "middle";
      let a = getTextureXY(this.tileMap[i].textureIndex + 2);
      ctx.fillText(`${this.tileMap[i].textureIndex},x:${a.x},y:${a.y}`, 32, 32); */
      ctx.restore();
    }
  }
}
export class FuelTile extends Tile {
  constructor(x, y, w, h) {
    super(x, y, w, h, { isSensor: true }, "fuel");
    this.question = false;
  }
}
export class BackgroundTile extends GameObject {
  constructor(x, y, w, h) {
    super();
    this.pos = { x: x, y: y };
    this.size = { w: w, h: h };
    this.light = false;
    this.body = { position: this.pos };
    this.textureIndex = 0;
  }
  remove() {}
  init(world) {}
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  draw(ctx) {
    ctx.save();
    ctx.translate(this.pos.x - this.size.w / 2, this.pos.y - this.size.h / 2);
    const ptrn = ctx.createPattern(trasformTexture(getTextureByIndex(this.textureIndex), this.size.w, this.size.h, 128, 128), "repeat");
    ctx.fillStyle = ptrn;
    ctx.fillRect(0, 0, this.size.w, this.size.h);
    ctx.restore();
  }
}
export class Controls extends BackgroundTile {
  constructor(x, y, w, h) {
    super(x, y, w, h);
    this.cos = [
      { x: 0, y: 0, w: 1, h: 1, textureIndex: 18 }, //A
      { x: 1, y: 0, w: 1, h: 1, textureIndex: 19 }, //D
     /*  { x: 0, y: 2, w: 1, h: 1, textureIndex: 20 }, */ //→
     /*  { x: 1, y: 2, w: 1, h: 1, textureIndex: 21 }, */ //←
      { x: 3, y: 0, w: 2, h: 1, textureIndex: 22 }, //space
    ];
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  draw(ctx) {
    for (let i = 0; i < this.cos.length; i++) {
      ctx.save();
      ctx.translate(this.pos.x + MAP.w * this.cos[i].x - MAP.w / 2, this.pos.y + MAP.h * this.cos[i].y - MAP.h / 2);
      const ptrn = ctx.createPattern(getTextureByIndex(this.cos[i].textureIndex, MAP.w, MAP.h, this.cos[i].w * MAP.w, this.cos[i].h * MAP.h), "repeat"); //trasformTexture(getTextureByIndex(this.cos[0].textureIndex, MAP.w, MAP.h, this.cos[i].w * MAP.w, this.cos[i].h * MAP.h), MAP.w, MAP.h, 128, 128), "repeat");
      ctx.fillStyle = ptrn;
      ctx.fillRect(0, 0, MAP.w * this.cos[i].w, MAP.h * this.cos[i].h);
      ctx.restore();
    }
  }
}
class Droplet extends Box {
  constructor(x, y, w, h, parent) {
    super(x, y, w, h, { isSensor: true, isStatic: false, mass: 2 }, "droplet");
    this.parent = parent;
    game.eventHandler.addClass(this);
    this.textureIndex = 24;
    this.live = setTimeout(() => {
      this.remove();
    }, 20000);
  }
  remove() {
    super.remove();
    clearTimeout(this.live);
    game.eventHandler.removeClass(this);
    this.parent.removeDroplet(this.parent.droplets.indexOf(this));
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  draw(ctx, colider) {
    if (window.DebugMode) {
      this.drawCollider(ctx, this.body);
      return;
    }
    let pos = this.body.position;
    if (colider) {
      pos = colider.position;
    }
    ctx.save();
    ctx.translate(pos.x, pos.y);
    ctx.rotate(this.body.angle);
    ctx.translate(-pos.x, -pos.y);

    const ptrn = ctx.createPattern(trasformTexture(getTextureByIndex(this.textureIndex), this.size.x, this.size.y, this.size.x / MAP.w, this.size.y / MAP.h), "repeat");

    ctx.fillStyle = ptrn;
    ctx.beginPath();

    let bodyDraw = this.body.vertices;
    ctx.moveTo(bodyDraw[0].x, bodyDraw[0].y);
    for (let j = 1; j < bodyDraw.length; j += 1) {
      ctx.lineTo(bodyDraw[j].x, bodyDraw[j].y);
    }
    ctx.lineTo(bodyDraw[0].x, bodyDraw[0].y);
    ctx.translate(bodyDraw[0].x, bodyDraw[0].y);
    ctx.fill();

    ctx.restore();
  }
  handleEvent(e) {
    if (e.name == "collisionStart") {
      forAllcoliders(e, (pair) => {
        if (pair.bodyA == this.body || pair.bodyB == this.body) {
          if (pair.bodyA.name && pair.bodyA.name != "stalactite") {
            if (pair.bodyA.name == "player") {
              game.GUI.addFuel(-10);
            }
            this.remove();
          }
          if (pair.bodyB.name && pair.bodyB.name != "stalactite") {
            if (pair.bodyB.name == "player") {
              game.GUI.addFuel(-10);
            }
            this.remove();
          }
        }
      });
    }
    if (e.name == "collisionActive") {
      forAllcoliders(e, (pair) => {
        if (pair.bodyA == this.body || pair.bodyB == this.body) {
          if (pair.bodyA.name && pair.bodyA.name != "stalactite") {
            this.remove();
          }
          if (pair.bodyB.name && pair.bodyB.name != "stalactite") {
            this.remove();
          }
        }
      });
    }
    if (e.name == "collisionEnd") {
      //this.remove();
      //this.remove();
    }
  }
}
export class stalactiteTile extends Tile {
  constructor(x, y, w, h) {
    super(x, y, w, h, {}, "stalactite");
    this.sec = 0;
    this.droplets = [];
    this.time = randomFloat(2, 4);
  }
  removeDroplet(i) {
    this.droplets.splice(i, 1);
  }
  remove() {
    super.remove();
    for (let i = 0; i < this.droplets.length; i++) {
      this.droplets[i].remove();
    }
    //game.eventHandler.removeClass(this);
  }
  update() {
    if (game.tick % 30 == 0) {
      this.sec++;
    }
    if (this.sec > this.time) {
      this.sec = 0;
      this.droplets.push(new Droplet(this.body.position.x, this.body.position.y, this.size.x / 2, this.size.y / 2, this));
      this.droplets[this.droplets.length - 1].init(game);
    }
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  draw(ctx) {
    super.draw(ctx);
    for (let i = 0; i < this.droplets.length; i++) {
      this.droplets[i].draw(ctx);
    }
  }
}
