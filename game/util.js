export class GameObject {
  constructor() {
    this.color = "rgb(255,0,0)";
  }
  /**
   *
   * @param {CanvasRenderingContext2D} ctx
   */
  draw(ctx) {
    ctx.fillStyle = "rgb(255,0,0)";
    ctx.fillRect(this.pos.x, this.pos.y, 20, 20);
  }
  update() {}
  /**
   *
   * @param {Event} e
   */
  handleEvent(e) {}
}
function hexToRgb(hex) {
  var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
  return result
    ? {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16),
      }
    : null;
}
export function getRGBvalues(color) {
  let regex =
    /^(#?([a-f\d]{3,4}|[a-f\d]{6}|[a-f\d]{8})|rgb\((0|255|25[0-4]|2[0-4]\d|1\d\d|0?\d?\d),(0|255|25[0-4]|2[0-4]\d|1\d\d|0?\d?\d),(0|255|25[0-4]|2[0-4]\d|1\d\d|0?\d?\d)\)|rgba\((0|255|25[0-4]|2[0-4]\d|1\d\d|0?\d?\d),(0|255|25[0-4]|2[0-4]\d|1\d\d|0?\d?\d),(0|255|25[0-4]|2[0-4]\d|1\d\d|0?\d?\d),(0|0?\.\d|1(\.0)?)\)|hsl\((0|360|35\d|3[0-4]\d|[12]\d\d|0?\d?\d),(0|100|\d{1,2})%,(0|100|\d{1,2})%\)|hsla\((0|360|35\d|3[0-4]\d|[12]\d\d|0?\d?\d),(0|100|\d{1,2})%,(0|100|\d{1,2})%,(0?\.\d|1(\.0)?)\))$/;
  let r = regex.exec(color);
  if (r !== null) {
    if (r[2]) {
      return hexToRgb(color);
    } else if (r[3] && r[4] && r[5]) {
      return { r: r[3], g: r[4], b: r[5] };
    } else if (r[6] && r[7] && r[8]) {
      return { r: r[6], g: r[7], b: r[8] };
    }
  }
  return null;
}
export function isColorLight(r, g, b) {
  let hsp = Math.sqrt(0.299 * (r * r) + 0.587 * (g * g) + 0.114 * (b * b));
  if (hsp > 127.5) {
    return true;
  }
  return false;
}
export function randomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}
export function randomFloat(min, max) {
  return Math.random() * (max - min + 1) + min;
}
export function clamp(min, max, val) {
  return val > max ? max : val < min ? min : val;
}
function divideEqualy(num, f) {
  let val = Math.floor(num / f);
  let arr = [];
  for (let i = 0; i < f; i++) {
    arr[i] = val;
  }

  arr[0] +=
    num -
    arr.reduce(function (previousValue, currentValue, index, array) {
      return previousValue + currentValue;
    });
  return arr[0];
}
export let lastID = -1;
let img = new Image();
img.src = "./images/TexureAtlas.png";
let textureBuffer = document.createElement("canvas");
let textureBuffer2 = document.createElement("canvas");
// document.body.appendChild(te);
// document.body.appendChild(textureBuffer);
// document.body.appendChild(img);

export function trasformTexture(img, w = 64, h = 64, dw, dh) {
  let ctx = textureBuffer.getContext("2d");
  ctx.clearRect(0, 0, textureBuffer.width, textureBuffer.height);

  w = divideEqualy(w, dw);
  h = divideEqualy(h, dh);
  textureBuffer.width = w;
  textureBuffer.height = h;

  ctx.drawImage(img, 0, 0, img.width, img.height, 0, 0, w, h);
  return textureBuffer;
}
/**
 *
 * @param {number} index TexureIndex
 * @param {number} gw grid Width
 * @param {number} gh grid Height
 * @param {number} h Width
 * @param {number} w Height
 * @returns
 */
export function getTextureByIndex(index = 1, gw = 64, gh = 64, w = 64, h = 64) {
  if (lastID == index) return textureBuffer2;
  lastID = index;
  let posX = Math.floor(index % (512 / gh));
  let posY = Math.floor(index / (512 / gw));
  //console.log(index, posX, posY);
  //tx * tw;
  let ctx = textureBuffer2.getContext("2d");
  ctx.clearRect(0, 0, textureBuffer2.width, textureBuffer2.height);
  textureBuffer2.width = w;
  textureBuffer2.height = h;
  ctx.drawImage(img, 64 * posX, 64 * posY, w, h, 0, 0, textureBuffer2.width, textureBuffer2.height);
  return textureBuffer2;
}
export function getTextureXY(index = 1, w = 64, h = 64) {
  return { x: Math.floor(index % (512 / h)), y: Math.floor(index / (512 / w)) };
}
/**
 *
 * @todo
 * @param {*} x
 * @param {*} y
 * @param {*} w
 * @param {*} h
 */
export function getTextureByXY(x, y, w = 1, h = 1) {
  //TODO
}
export function lerp(start, end, amt) {
  return (1 - amt) * start + amt * end;
}
export function lerpVector(start, end, amt) {
  return { x: lerp(start.x, end.x, amt), y: lerp(start.y, end.y, amt) };
}
export function distanceVector2(x1, y1, x2, y2) {
  return Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
}
export function pointAlongLine(start, end, distance) {
  let t = distance / distanceVector2(start.x, start.y, end.x, end.y);
  return { x: (1 - t) * start.x + t * end.x, y: (1 - t) * start.y + t * end.y };
}
export function findArray(x, y, array, compare) {
  for (let i = 0; i < array.length; i++) {
    if (compare(x, y, array[i])) {
      return array[i];
    }
  }
  return null;
}
export function getQuestion() {
  return new Promise((resolve, reject) => {
    fetch("quiz/api.php/getRandomQuestion")
      .catch((err) => {
        reject(err);
      })
      .then((r) => r.json())
      .catch((err) => {
        reject(err);
      })
      .then((res) => {
        resolve(res);
      });
  });
}
export function checkAnswer(answer, id) {
  return new Promise((resolve, reject) => {
    fetch("quiz/api.php/checkAnswer", { method: "POST", body: JSON.stringify({ answer: answer, id: parseInt(id) }) })
      .catch((err) => {
        reject(err);
      })
      .then((r) => r.json())
      .catch((err) => {
        reject(err);
      })
      .then((res) => {
        resolve(res);
      });
  });
}

export function forAllcoliders(event, f) {
  const pairs = event.pairs;
  for (let i = 0, j = pairs.length; i != j; ++i) {
    let pair = pairs[i];
    f(pair);
  }
}
