import { Box } from "./Box.js";

export class Ground extends Box {
  constructor(x, y, w, h) {
    super(x, y, w, h, { isStatic: true, name: "floor" });
    //this.body.isStatic = true;
    this.color = "rgb(0,255,0)";
    //this.body.frictionStatic = 100;
  }
  afterAdded() {
    //this.body.type = "floor";
  }
}
