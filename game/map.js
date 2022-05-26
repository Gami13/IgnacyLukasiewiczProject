import { ctx, game } from "../game.js";
import { Box } from "./Box.js";
import { QuestionContainer } from "./Game.js";
import { BackgroundTile, Controls, FuelTile, GroundTile, stalactiteTile, Tile } from "./Tiles.js";
import { checkAnswer, clamp, findArray, GameObject, getQuestion, getTextureByIndex, pointAlongLine, randomInt, trasformTexture } from "./util.js";
export const MAP = { x: 32, y: 10, w: 64, h: 64 };
let obstaclesMap = [
    [{"x":10,"y":8,"w":1,"h":1,"textureID":1,"light":null,"type":"fuel","question":false},{"x":15,"y":8,"w":1,"h":1,"textureID":1,"light":null,"type":"fuel","question":true},{"x":31,"y":8,"w":1,"h":1,"textureID":26,"light":null,"lightColor":null,"type":"ground"},{"x":0,"y":9,"w":32,"h":1,"textureID":26,"light":null,"lightColor":null,"type":"ground"},{"x":1,"y":8,"w":1,"h":1,"textureID":2,"light":null,"lightColor":null,"type":"ground"},{"x":5,"y":6,"w":1,"h":1,"type":"controls"},{"x":5,"y":5,"w":1,"h":1,"light":600,"lightColor":"rgb(255,255,255)","textureID":0,"type":"background"},{"x":10,"y":4,"w":1,"h":1,"textureID":25,"type":"stalactite"},{"x":0,"y":0,"w":32,"h":4,"light":null,"textureID":26,"type":"ground"}],
  [
    { x: 0, y: 9, w: 5, h: 1, light: null, textureID: 26, type: "ground" },
    { x: 7, y: 8, w: 2, h: 1, light: null, textureID: 26, type: "ground" },
    { x: 11, y: 7, w: 2, h: 1, light: null, textureID: 26, type: "ground" },
    { x: 16, y: 6, w: 3, h: 1, light: null, textureID: 26, type: "ground" },
    { x: 16, y: 9, w: 3, h: 1, light: null, textureID: 26, type: "ground" },
    { x: 21, y: 8, w: 2, h: 1, light: null, textureID: 26, type: "ground" },
    { x: 24, y: 7, w: 2, h: 1, light: null, textureID: 26, type: "ground" },
    { x: 21, y: 5, w: 2, h: 1, light: null, textureID: 26, type: "ground" },
    { x: 27, y: 8, w: 2, h: 1, light: null, textureID: 26, type: "ground" },
    { x: 27, y: 5, w: 2, h: 1, light: null, textureID: 26, type: "ground" },
    { x: 24, y: 4, w: 2, h: 1, light: null, textureID: 26, type: "ground" },
    { x: 30, y: 9, w: 2, h: 1, light: null, textureID: 26, type: "ground" },
    { x: 30, y: 5, w: 2, h: 1, light: null, textureID: 26, type: "ground" },
    { x: 17, y: 8, w: 1, h: 1, light: null, textureID: 1, type: "fuel" },
    { x: 25, y: 3, w: 1, h: 1, light: null, textureID: 1, type: "fuel" },
    { x: 7, y: 7, w: 1, h: 1, light: null, textureID: 1, type: "fuel" },
    { x: 28, y: 7, w: 1, h: 1, light: null, textureID: 1, type: "fuel" },
  ],
  /*   [
    // { x: 0, y: 9, w: 5, h: 1, textureID: 2, light: null, lightColor: null, type: "ground" },
    { x: 8, y: 9, w: 4, h: 1, textureID: 2, light: null, lightColor: null, type: "ground" },
    { x: 9.5, y: 8, w: 1, h: 1, textureID: 1, light: null, lightColor: null, type: "fuel" },

    { x: 0, y: 9, w: 32, h: 1, textureID: 2, light: null, lightColor: null, type: "ground" },
  ],
  [
    //{ x: 0, y: 9, w: 3, h: 1, textureID: 2, light: null, lightColor: null, type: "ground" },
    { x: 4, y: 8, w: 2, h: 2, textureID: 2, light: null, lightColor: null, type: "ground" },
    { x: 7, y: 7, w: 2, h: 3, textureID: 2, light: null, lightColor: null, type: "ground" },
    { x: 14, y: 9, w: 2, h: 1, textureID: 2, light: null, lightColor: null, type: "ground" },
    { x: 10.5, y: 6, w: 1, h: 1, textureID: 1, light: null, lightColor: null, type: "fuel" },

    { x: 0, y: 9, w: 32, h: 1, textureID: 2, light: null, lightColor: null, type: "ground" },
  ], */
  [
    { x: 0, y: 9, w: 7, h: 1, textureID: 2, type: "ground" },
    { x: 5, y: 8, w: 2, h: 1, textureID: 2, type: "ground" },
    { x: 9, y: 7, w: 2, h: 3, textureID: 2, type: "ground" },
    { x: 19, y: 6, w: 13, h: 1, textureID: 2, type: "ground" },
    { x: 22, y: 5, w: 1, h: 1, textureID: 1, type: "fuel" },
    { x: 25, y: 5, w: 2, h: 1, textureID: 2, type: "ground" },
    { x: 19, y: 9, w: 13, h: 1, textureID: 2, type: "ground" },
    { x: 13, y: 6, w: 3, h: 4, textureID: 2, type: "ground" },
    { x: 21, y: 8, w: 1, h: 1, textureID: 1, type: "fuel" },
    { x: 26, y: 8, w: 1, h: 1, textureID: 1, type: "fuel" },
    { x: 29, y: 8, w: 1, h: 1, textureID: 1, type: "fuel" },
  ],
  [
    { x: 0, y: 9, w: 32, h: 1, light: null, textureID: 2, type: "ground" },
    { x: 4, y: 0, w: 28, h: 5, light: null, textureID: 2, type: "ground" },
    { x: 4, y: 5, w: 1, h: 1, light: null, textureID: 25, type: "stalactite" },
    { x: 8, y: 5, w: 1, h: 1, light: null, textureID: 25, type: "stalactite" },
    { x: 12, y: 5, w: 1, h: 1, light: null, textureID: 25, type: "stalactite" },
    { x: 16, y: 5, w: 1, h: 1, light: null, textureID: 25, type: "stalactite" },
    { x: 20, y: 5, w: 1, h: 1, light: null, textureID: 25, type: "stalactite" },
    { x: 24, y: 5, w: 1, h: 1, light: null, textureID: 25, type: "stalactite" },
    { x: 28, y: 5, w: 1, h: 1, light: null, textureID: 25, type: "stalactite" },
    { x: 18, y: 8, w: 1, h: 1, light: null, textureID: 1, type: "fuel" },
    { x: 26, y: 8, w: 1, h: 1, light: null, textureID: 1, type: "fuel" },
  ],
  [
    { x: 0, y: 9, w: 4, h: 1, light: null, textureID: 2, type: "ground" },
    { x: 1, y: 8, w: 3, h: 1, light: null, textureID: 2, type: "ground" },
    { x: 6, y: 7, w: 2, h: 3, light: null, textureID: 2, type: "ground" },
    { x: 11, y: 7, w: 2, h: 3, light: null, textureID: 2, type: "ground" },
    { x: 15, y: 7, w: 3, h: 3, light: null, textureID: 2, type: "ground" },
    { x: 20, y: 7, w: 12, h: 3, light: null, textureID: 2, type: "ground" },
    { x: 20, y: 0, w: 10, h: 3, light: null, textureID: 2, type: "ground" },
    { x: 20, y: 3, w: 1, h: 1, light: null, textureID: 25, type: "stalactite" },
    { x: 24, y: 3, w: 1, h: 1, light: null, textureID: 25, type: "stalactite" },
    { x: 27, y: 3, w: 1, h: 1, light: null, textureID: 25, type: "stalactite" },
    { x: 2, y: 7, w: 1, h: 1, light: null, textureID: 1, type: "fuel" },
    { x: 12, y: 4, w: 1, h: 1, light: null, textureID: 1, type: "fuel" },
    { x: 16, y: 5, w: 1, h: 1, light: null, textureID: 1, type: "fuel" },
    { x: 22, y: 5, w: 1, h: 1, light: null, textureID: 1, type: "fuel" },
    { x: 26, y: 6, w: 1, h: 1, light: null, textureID: 1, type: "fuel" },
    { x: 29, y: 6, w: 1, h: 1, light: null, textureID: 1, type: "fuel" },
  ],
  [{"x":0,"y":9,"w":32,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":3,"y":7,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":6,"y":6,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":8,"y":6,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":10,"y":6,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":12,"y":6,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":14,"y":6,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":16,"y":6,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":18,"y":6,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":20,"y":6,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":22,"y":6,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":24,"y":6,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":26,"y":6,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":28,"y":6,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":29,"y":7,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":29,"y":8,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":4,"y":0,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":4,"y":1,"w":1,"h":1,"light":null,"textureID":25,"type":"stalactite"},{"x":4,"y":2,"w":1,"h":1,"light":null,"textureID":25,"type":"stalactite"},{"x":8,"y":0,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":8,"y":1,"w":1,"h":1,"light":null,"textureID":25,"type":"stalactite"},{"x":14,"y":0,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":14,"y":2,"w":1,"h":1,"light":null,"textureID":25,"type":"stalactite"},{"x":14,"y":1,"w":1,"h":1,"light":null,"textureID":25,"type":"stalactite"},{"x":20,"y":0,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":20,"y":1,"w":1,"h":1,"light":null,"textureID":25,"type":"stalactite"},{"x":25,"y":0,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":26,"y":0,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":27,"y":0,"w":1,"h":1,"light":null,"textureID":2,"type":"ground"},{"x":25,"y":1,"w":1,"h":1,"light":null,"textureID":25,"type":"stalactite"},{"x":26,"y":1,"w":1,"h":1,"light":null,"textureID":25,"type":"stalactite"},{"x":27,"y":1,"w":1,"h":1,"light":null,"textureID":25,"type":"stalactite"},{"x":28,"y":8,"w":1,"h":1,"light":null,"textureID":1,"type":"fuel"},{"x":27,"y":8,"w":1,"h":1,"light":null,"textureID":1,"type":"fuel"},{"x":26,"y":8,"w":1,"h":1,"light":null,"textureID":1,"type":"fuel"},{"x":14,"y":5,"w":1,"h":1,"light":null,"textureID":1,"type":"fuel"},{"x":29,"y":6,"w":1,"h":1,"light":null,"textureID":1,"type":"fuel"},{"x":4,"y":6,"w":1,"h":1,"light":null,"textureID":1,"type":"fuel"},{"x":2,"y":8,"w":3,"h":1,"light":null,"textureID":2,"type":"ground"}]
];
class Chunk {
  constructor(map, world, loop = 0, id, parent) {
    this.canvas = document.createElement("canvas");
    this.canvas.width = MAP.x * MAP.w;
    this.canvas.height = MAP.y * MAP.h;
    this.ctx = this.canvas.getContext("2d");

    this.id = id;
    this.posX = loop * (MAP.x * MAP.w);
    this.init(map, world, loop, parent);
  }
  getTextureIndex(ix, iy, array) {
    let textureIndex = 0;
    let data = [];
    let directions = [
      { x: 0, y: -1 },
      { x: 0, y: 1 },
      { x: -1, y: 0 },
      { x: 1, y: 0 },
    ];
    for (let i = 0; i < 4; i++) {
      let a = findArray(directions[i].x + ix, directions[i].y + iy, array, (x, y, o) => {
        return x == o.gridX && y == o.gridY;
      });
      if (a) {
        data.push(true);
      } else {
        data.push(false);
      }
    }
    /*  1 
       802
        4
     */
    if (data[0]) textureIndex += 1;
    if (data[1]) textureIndex += 4;
    if (data[2]) textureIndex += 8;
    if (data[3]) textureIndex += 2;
    return textureIndex;
  }
  generateTileMap(o, map) {
    let tileMap = [];
    for (let j = 0; j < map.w; j++) {
      for (let jj = 0; jj < map.h; jj++) {
        let vertices = [];

        //console.log(o.body.vertices[0], o.body.vertices[1], o.body.vertices[2], o.body.vertices[3]);
        // console.log(MAP.h, map.h - jj, MAP.h * (map.h - jj), jj);
        vertices[0] = pointAlongLine({ x: o.body.vertices[0].x, y: o.body.vertices[0].y + MAP.h * jj }, { x: o.body.vertices[1].x, y: o.body.vertices[1].y + MAP.h * jj }, MAP.w * j);
        vertices[1] = pointAlongLine(vertices[0], { x: o.body.vertices[1].x, y: o.body.vertices[1].y + MAP.h * jj }, MAP.w);
        vertices[3] = pointAlongLine(
          { x: o.body.vertices[3].x, y: o.body.vertices[3].y - MAP.h * (map.h - jj) + MAP.h },
          { x: o.body.vertices[2].x, y: o.body.vertices[2].y - MAP.h * (map.h - jj) + MAP.h },
          MAP.w * j
        );
        vertices[2] = pointAlongLine(vertices[3], { x: o.body.vertices[2].x, y: o.body.vertices[2].y - MAP.h * (map.h - jj) + MAP.h }, MAP.w);

        tileMap.push({ gridX: map.x + j, gridY: map.y + jj, bodyVericies: vertices, textureIndex: 0 });
      }
    }
    return tileMap;
  }
  getTileMap() {
    let tileMap = [];
    for (let i = 0; i < this.obstacles.length; i++) {
      if (this.obstacles[i].type == "ground") {
        tileMap = tileMap.concat(this.obstacles[i].tileMap);
      }
    }
    return tileMap;
  }
  init(map, world, loop, parent) {
    this.obstacles = [];
    let fuelChance = 0.6;
    for (let i = 0; i < map.length; i++) {
      // if (map[i].type == "fuel" && Math.random() > 0.4) continue;
      //let w = (ctx.canvas.width / MAP.x) * map[i].w;
      //let h = (ctx.canvas.height / MAP.y) * map[i].h;
      //let x = (ctx.canvas.width / MAP.x) * map[i].x + loop * ctx.canvas.width + w / 2;
      //let y = (ctx.canvas.height / MAP.y) * map[i].y + h / 2;
      let w = MAP.w * map[i].w;
      let h = MAP.h * map[i].h;
      //let x = MAP.x * map[i].x + loop * (MAP.w * MAP.x) + w / 2;
      let x = map[i].x * MAP.w + MAP.x * MAP.w * loop + w / 2;
      //let y = map[i].y * MAP.h * MAP.y * +(h / 2);
      let y = ((MAP.h * MAP.y) / MAP.y) * map[i].y + h / 2 - MAP.h / 2;

      console.log(i, x, y, w, h, MAP, map[i]);
      let o = null;
      let textureIndex = map[i].textureID;
      switch (map[i].type) {
        case "ground":
          //x = map[i].x * MAP.w + w / 2;
          o = new GroundTile(x, y, w, h);
          o.tileMap = this.generateTileMap(o, map[i]);
          console.log(i, o.tileMap);
          break;
        case "fuel":
          if (Math.random() > 0.5) {
            fuelChance -= 0.3;
            continue;
          }
          fuelChance = 0.6;
          o = new FuelTile(x, y, w, h);
          // if (map[i].question == true) {
          //   o.question = true;
          //   textureIndex = 1;
          // } else if (map[i].question != false && Math.random() > 0.6) {
          //   o.question = true;
          //   textureIndex = 1;
          // }
          break;
        case "controls":
          o = new Controls(x, y, w, h);
          break;
        case "stalactite":
          o = new stalactiteTile(x, y, w, h);
          break;
        case "background":
          o = new BackgroundTile(x, y, w, h);
          break;
        default:
          o = new Tile(x, y, w, h, {}, map[i].type);
          break;
      }

      o.textureIndex = textureIndex;
      o.init({ world: world });
      if (o.body) {
        o.body.Chunk = this;
      }
      if (map[i].light) {
        game.shadowMask.addLightSource(o.body, map[i].light, map[i].lightColor);
        o.light = true;
      }
      this.obstacles.push(o);
    }
    let tileMap = this.getTileMap();
    let l = null;
    let last = null;
    if (parent.Chunks.length > 0) {
      last = parent.Chunks.find((x) => x.id == loop - 1);

      if (last) {
        l = last.getTileMap();
        let r = [];
        for (let i = 0; i < l.length; i++) {
          if (l[i].gridX == MAP.x - 1) {
            let e = Object.assign({}, l[i]);
            e.gridX -= MAP.x;
            e.index = i;
            r.push(e);
          }
        }
        tileMap = tileMap.concat(r);
      }
    }
    this.ctx.translate(-this.posX, 0);
    for (let j = 0; j < tileMap.length; j++) {
      //let a = this.obstacles[i].tileMap.indexOf(tileMap[j]);
      //if (a != -1) {
      //this.obstacles[i].tileMap[a].textureIndex =
      tileMap[j].textureIndex = this.getTextureIndex(tileMap[j].gridX, tileMap[j].gridY, tileMap);
      if (tileMap[j].gridX == 0 && l) {
        let a = last.getTileMap().find((x) => x.gridX == MAP.x - 1 && x.gridY == tileMap[j].gridY);
        if (a) {
          a.textureIndex += 2;
        }
      }
    }
    if (l) {
      last.drawMap();
    }
    this.drawMap();

    //console.log(this.obstacles);
  }
  drawMap() {
    this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
    //this.ctx.translate(this.posX, 0);
    //this.ctx.save();
    for (let i = 0; i < this.obstacles.length; i++) {
      if (this.obstacles[i].type == "ground") {
        this.obstacles[i].draw(this.ctx);
      }
    }
    //this.ctx.restore();
  }
  update() {
    for (let i = 0; i < this.obstacles.length; i++) {
      if (this.obstacles[i].type != "ground") {
        this.obstacles[i].update();
      }
    }
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  draw(ctx) {
    let toRemove = [];
    for (let i = 0; i < this.obstacles.length; i++) {
      if (!this.obstacles[i]) {
        toRemove.push(i);
        continue;
      }
      ctx.drawImage(this.canvas, this.posX, 0);
      if (this.obstacles[i].type != "ground") {
        this.obstacles[i].draw(ctx);
      }
    }
    //this.test(ctx);
    if (window.DebugMode) {
      ctx.fillStyle = "rgb(0,0,0)";
      ctx.textAlign = "center";
      ctx.textBaseline = "middle";
      ctx.fillText(this.id, MAP.w * 5 + this.id * (MAP.x * MAP.w), ctx.canvas.height / 2);
    }
    for (let i = 0; i < toRemove.length; i++) {
      this.obstacles.splice(toRemove[i], 1);
    }
  }
  remove(c = null, callback) {
    if (c) {
      let i = this.obstacles.indexOf(c);
      if (i != -1) {
        console.log("remove by index");
        c.body.parentClass = null;

        if (c.question) {
          game.GUI.fuelDrainSpeed = 0.008;
          game.Player.lockMovement = true;
          Matter.Body.setVelocity(game.Player.body, { x: 0, y: 0 });
          //console.log(c.body.position.x, game.Player.body.position.x, c.body.position.x - game.Player.body.position.x);
          Matter.Body.setPosition(game.Player.body, c.body.position);
          game.death.speed *= 0.3;
          game.death.pause = true;
          QuestionContainer.style = "";
          getQuestion().then((res) => {
            console.log(res);
            game.death.pause = false;
            if (res.status) {
              let json = res.payload;

              let answerButtons = QuestionContainer.querySelectorAll("#answer");
              console.log(answerButtons);
              console.log(json);
              let click = function (e) {
                for (let j = 0; j < answerButtons.length; j++) {
                  answerButtons[j].disabled = true;
                  answerButtons[j].removeEventListener("click", click);
                }
                console.log(this.answer);

                checkAnswer(this.answer, json.id)
                  .catch((err) => {
                    QuestionContainer.style = "display:none;";

                    game.Player.lockMovement = false;
                    game.GUI.fuelDrainSpeed = game.GUI.startDrainSpeed;
                    game.death.speed /= 0.3;
                    game.eventHandler.focus();
                    for (let i = 0; i < answerButtons.length; i++) {
                      answerButtons[i].value = "Ładowanie..";
                      answerButtons[i].classList.remove("corect");
                      answerButtons[i].classList.remove("incorect");
                    }
                  })
                  .then((r) => {
                    console.log(r);
                    if (r.status) {
                      let json = r.payload;
                      this.classList.add(json.isCorrect ? "corect" : "incorect");
                      if (json.isCorrect) {
                        game.GUI.addFuel(30);
                      } else {
                        //TODO
                      }
                    } else {
                      //TODO
                    }
                    setTimeout(() => {
                      QuestionContainer.style = "display:none;";

                      game.Player.lockMovement = false;
                      game.GUI.fuelDrainSpeed = game.GUI.startDrainSpeed;
                      game.death.speed /= 0.3;
                      game.eventHandler.focus();
                      for (let i = 0; i < answerButtons.length; i++) {
                        answerButtons[i].value = "Ładowanie..";
                        answerButtons[i].classList.remove("corect");
                        answerButtons[i].classList.remove("incorect");
                      }
                    }, 500);
                  });
              };
              document.getElementById("question").innerText = json.question;
              for (let i = 0; i < answerButtons.length; i++) {
                if (json.options.length - 1 < i) {
                  answerButtons[i].style = "display:none";
                  continue;
                } else {
                  answerButtons[i].style = "";
                  answerButtons[i].disabled = false;
                }
                console.log("?");
                answerButtons[i].addEventListener("click", click);
                answerButtons[i].value = json.options[i].answer;
                answerButtons[i].answer = i;
              }
              const title = QuestionContainer.querySelector("h1");
              for (let i = QuestionContainer.children.length; i >= 0; i--) {
                QuestionContainer.appendChild(QuestionContainer.children[(Math.random() * i) | 0]);
              }
              QuestionContainer.insertAdjacentElement("afterbegin", title);
              //QuestionContainer.style = "display:none;";
            } else {
              QuestionContainer.style = "display:none;";
            }
          });
        }
        //Matter.Body.setPosition(c.body, { x: 0, y: -400 });
        this.obstacles[i].remove();
        this.obstacles.splice(i, 1);
        callback();
      } else console.error("not Found");
    } else {
      console.log("remove", c, callback);
    }
  }
  removeAll() {
    for (let i = 0; i < this.obstacles.length; i++) {
      this.obstacles[i].remove();
    }
  }
}
export class Map extends GameObject {
  constructor(world) {
    super();
    this.world = world;
    this.Chunks = [];
    if (obstaclesMap.length < 3) {
      alert("Pętla");
      throw "źle";
    }
    this.Chunks.push(new Chunk(obstaclesMap[0], this.world, 0, 0, this));
    //this.Tiles.push(new ObstacleMapTile(obstaclesMap[0], this.world, -1));
    this.loop = 0;
    this.lastMapID = 0;
  }
  reset() {
    for (let i = 0; i < this.Chunks.length; i++) {
      this.Chunks[i].removeAll();
    }
    this.Chunks = [];
    this.Chunks.push(new Chunk(obstaclesMap[0], this.world, 0, 0, this));
    //this.Tiles.push(new ObstacleMapTile(obstaclesMap[0], this.world, -1));
    this.loop = 0;
    this.lastMapID = 0;
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  draw(ctx) {
    for (let i = 0; i < this.Chunks.length; i++) {
      this.Chunks[i].draw(ctx);
    }
  }
  update() {
    if (game.Player.body.position.x > MAP.x * MAP.w * this.loop + (MAP.x * MAP.w) / 4) {
      this.loop++;
      let i = randomInt(1, obstaclesMap.length - 1);
      while (this.lastMapID == i && obstaclesMap.length > 1) {
        i = randomInt(1, obstaclesMap.length - 1);
      }
      this.lastMapID = i;
      console.log("-----------------------------");
      this.Chunks.push(new Chunk(obstaclesMap[i], this.world, this.loop, this.loop, this));
      if (this.Chunks.length > 3) {
        console.log("len", this.Chunks.length);

        this.Chunks[0].removeAll();
        this.Chunks.splice(0, 1);
        console.log(this.Chunks);
      }
    }
    for (let i = 0; i < this.Chunks.length; i++) {
      this.Chunks[i].update();
    }
  }
}
