Mover[] movers = new Mover[10];
Attractor a;

void setup() {
  size(640, 360);

  for (int ixMover = 0; ixMover < movers.length; ixMover++) {
    movers[ixMover] = new Mover(random(0.1, 2), random(width), random(height));
  }

  a = new Attractor();
}

void draw() {
  background(255);

  for (int ixMover = 0; ixMover < movers.length; ixMover++) {
    PVector f = a.attract(movers[ixMover]);
    movers[ixMover].applyForce(f);
    movers[ixMover].update();
    movers[ixMover].display();
  }

  a.display();
  a.drag();
  a.hover(mouseX, mouseY);
}

void mousePressed() {
  a.clicked(mouseX, mouseY);
}

void mouseReleased() {
  a.stopDragging();
}
