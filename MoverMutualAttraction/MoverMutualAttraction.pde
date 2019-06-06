Mover[] movers = new Mover[20];

float g = 0.4;

void setup() {
  size(640, 360);

  for (int ixMover = 0; ixMover < movers.length; ixMover++) {
    movers[ixMover] = new Mover(random(0.1, 2), random(width), random(height));
  }
}

void draw() {
  background(255);

  for (int ixMover = 0; ixMover < movers.length; ixMover++) {
    for (int jxMover = 0; jxMover < movers.length; jxMover++) {
      if (ixMover != jxMover) {
        PVector f = movers[jxMover].attract(movers[ixMover]);
        movers[ixMover].applyForce(f);
      }
    }

    movers[ixMover].update();
    movers[ixMover].display();
  }
}
