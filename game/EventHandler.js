import { game } from "../game.js";
import { countdown, PauseContainer } from "./Game.js";
import { Player } from "./Player.js";
import { GameObject } from "./util.js";

export class eventHandler {
  /**
   *
   * @param {HTMLElement} element
   */
  constructor(element, engine) {
    this.element = element;
    console.log(element);

    this.engine = engine;

    this.keydownFun;
    this.mousemoveFun;
    this.mousedownFun;
    this.mouseupFun;
    this.handleEvent;
    this.listeners = [];
    this.mouseDown;
    this.lastMousePos;
    this.init();
    this.keys = [];
  }
  focus() {
    this.element.focus();
  }

  collision(e) {
    let pairs = [];
    for (let i = 0; i < e.pairs.length; i++) {
      if (e.pairs[i].bodyA?.parent != e.pairs[i].bodyA) {
        pairs.push(e.pairs[i].bodyA.parent);
      }
      if (e.pairs[i].bodyB?.parent != e.pairs[i].bodyB) {
        pairs.push(e.pairs[i].bodyB.parent);
      }
      pairs.push(e.pairs[i].bodyA);
      pairs.push(e.pairs[i].bodyB);
    }
    for (let i = 0; i < pairs.length; i++) {
      if (pairs[i].name == "player") {
        //console.log(pairs[i]);
      }
      if (pairs[i].parentClass) {
        pairs[i].parentClass.handleEvent(e);
      }
    }
  }

  init() {
    window.DebugMode = false;
    console.log("a");
    this.handleEvent = (e) => {
      if (!e.name && document.activeElement != this.element) return;
      if (e.type == "mousedown") {
        this.element.focus({ preventScroll: true });
        this.mouseDown = true;
      } else if (e.type == "mouseup") {
        this.mouseDown = false;
      }
      if (e.name == "collisionStart") {
        this.collision(e);
        return;
      }
      if (e.name == "collisionEnd") {
        this.collision(e);
      }
      if (e.name == "collisionActive") {
        this.collision(e);
        return;
      }
      for (let i = 0; i < this.listeners.length; i++) {
        this.listeners[i].handleEvent(e);
      }
      if (e.type == "mousemove") {
        this.lastMousePos = { x: e.x, y: e.y };
      }
    };
    this.element.addEventListener("mousemove", this.handleEvent);
    this.element.addEventListener("mousedown", this.handleEvent);
    this.element.addEventListener("mouseup", this.handleEvent);
    this.element.addEventListener("keydown", (e) => {
      if (e.code == "KeyP" && !this.keys[e.code] && game.state == "RUNNING") {
        this.keys[e.code] = true;
        if (game.fullPause) {
          //setTimeout(() => {
          //game.Pause = false;
          //PauseContainer.style = "display: none;";
          //}, 5000);
          countdown(3);
        } else {
          PauseContainer.style = "";
          const countDown = PauseContainer.querySelector("#countDown");
          countDown.textContent = "";
          game.fullPause = true;
          //this.element.blur();
        }
      }
      if (game.fullPause) return;
      if (e.code == "Space") e.preventDefault();
      if (game.state == "START" && e.code == "Space") {
        game.StartGame();
      }
      this.keys[e.code] = true;
      if (e.code == "KeyT") {
        window.DebugMode = !window.DebugMode;
      }
      if (e.code == "KeyY") {
        game.death.remove();
      }
      if (e.code == "KeyR" && game.state == "RUNNING") {
        game.reset();
      }
    });
    this.element.addEventListener("keyup", (e) => {
      this.keys[e.code] = false;
    });
    this.element.addEventListener("wheel", this.handleEvent);
    Matter.Events.on(this.engine, "collisionStart", this.handleEvent);
    Matter.Events.on(this.engine, "collisionEnd", this.handleEvent);
    Matter.Events.on(this.engine, "collisionActive", this.handleEvent);
  }
  /**
   *
   * @param {GameObject} c
   */
  addClass(c) {
    this.listeners.push(c);
  }
  /**
   *
   * @param {GameObject} c
   */
  removeClass(c) {
    if (this.listeners.indexOf(c) != -1) {
      this.listeners.splice(this.listeners.indexOf(c), 1);
    } else console.error(`Class ${c.constructor.name} not Found`);
  }
}
