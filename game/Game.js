import { ctx, game } from "../game.js";
import { Background } from "./background.js";
import { Death } from "./Death.js";
import { eventHandler } from "./EventHandler.js";
import { GUI } from "./GUI.js";
import { Map } from "./map.js";
import { Player } from "./Player.js";
import { ShadowMask } from "./ShadowMask.js";

export const QuestionContainer = document.body //document.getElementById("questionContainer");
export const PauseContainer =document.body //document.getElementById("pause");
export const GameOverContainer =document.body //document.querySelector(".game_over");

export let countdown = (s) => {
  if (!game.fullPause) return;
  const countDown = PauseContainer.querySelector("#countDown");
  let i = s;
  countDown.textContent = `${i}s`;
  let inter = setInterval(() => {
    if (i == 0) {
      clearInterval(inter);
      game.fullPause = false;
      PauseContainer.style = "display:none;";
    }
    countDown.textContent = `${i}s`;
    i--;
  }, 1000);
};
// PauseContainer.querySelector("#resume").addEventListener("click", function (e) {
//   countdown(3);
// });

const DebugInfo = document.getElementById("DebugInfo");
const { Engine } = Matter;

/**
 * @description Game Class
 */
export class Game {
  constructor() {
    this.loopData = { elepsed: 0, fpsInterval: 0, startTime: 0, then: 0 };
    this.engine;
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  init(ctx) {
    this.engine = Matter.Engine.create();
    this.world = this.engine.world;
    this.eventHandler = new eventHandler(ctx.canvas, this.engine);
    this.state = "START";
    this.shadowMask = new ShadowMask();

    this.Player = new Player(ctx.canvas.width / 2 - 10, 500, 50, 75);
    this.shadowMask.addLightSource(this.Player.main);
    this.Player.init(this);
    this.Player.lockMovement = true;

    this.map = new Map(this.world);

    this.background = new Background();

    this.GUI = new GUI();

    this.death = new Death();
    this.death.init(this);

    this.speed = 1;
    this.cameraPos = { x: 0, y: 0 };

    this.isshaking = false;
    this.fullPause = false;

    this.tick = 0;

    this.max = 0;
    //console.log(this.engine);
    this.stats = new Stats();
    this.stats.showPanel(0); // 0: fps, 1: ms, 2: mb, 3+: custom
    //ctx.canvas.parentNode.appendChild(this.stats.dom);
    this.initLoop(60);
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  start(ctx) {
    this.init(ctx);
    requestAnimationFrame(this.loop.bind(this));
  }
  StartGame() {
    this.Player.lockMovement = false;

    this.death.start();
    this.state = "RUNNING";
  }
  /**
   * @description Reset Game
   */
  reset() {
    GameOverContainer.classList.toggle("hide");
    this.Player.lockMovement = true;
    this.Player.kill();
    this.GUI.init();
    this.death.reset();
    this.map.reset();

    this.state = "START";
    //this.Pause = true;
    //this.Player.remove();
    //this.map.
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  initLoop(fps) {
    this.loopData.fpsInterval = 1000 / fps;
    this.loopData.then = window.performance.now();
    this.loopData.startTime = this.loopData.then;
  }
  shake() {
    ctx;
  }
  /**
   * @description Game Loop
   * @param {number} deltaTime time since start
   */
  loop(deltaTime) {
    requestAnimationFrame(this.loop.bind(this));

    let now = window.performance.now();
    let elapsed = now - this.loopData.then;

    if (elapsed > this.loopData.fpsInterval * this.speed) {
      this.loopData.then = now - (elapsed % (this.loopData.fpsInterval * this.speed));

      this.tick %= 60;
      if (this.fullPause) return;
      this.stats.begin();
      this.isshaking = false;
      ctx.save();
      ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);

      //Render/UPDATE
      Engine.update(this.engine);

      this.background.update();
      this.map.update();
      this.Player.update();
      this.shadowMask.update();
      this.GUI.update();
      this.background.update();

      //let pos = lerp(this.cameraPos.x, -(this.Player.body.position.x - ctx.canvas.width / 2), 0.125);
      ctx.translate(-(this.Player.body.position.x - ctx.canvas.width / 2), 0);
      this.death.update();
      this.background.draw(ctx);
      this.map.draw(ctx);
      this.Player.draw(ctx);
      this.death.draw(ctx);
      this.shadowMask.draw(ctx);
      ctx.restore();
      this.GUI.draw(ctx);

      // DebugInfo.innerHTML = `isOnGround: ${this.Player.grounded}<br>speed ${this.Player.body.velocity.x}<br> maxSpeed ${this.Player.maxSpeed} <br> maxSpedDeath ${
      //   this.death.speed
      // }<br>Position x:${this.Player.body.position.x.toFixed(2)} y: ${this.Player.body.position.y.toFixed(2)}<br>maxScore: ${this.max}`;
      this.stats.end();
      this.tick++;
    }
  }
}
