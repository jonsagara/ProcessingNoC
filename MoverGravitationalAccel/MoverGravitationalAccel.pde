Mover m;
Attractor a;

void setup() {
  size(640, 360);
  
  m = new Mover(random(0.1, 2), 400, 50);
  a = new Attractor();
}

void draw() {
  background(255);
  
  PVector f = a.attract(m);
  m.applyForce(f);
  m.update();
  
  a.drag();
  a.hover(mouseX, mouseY);
  
  a.display();
  m.display();
}

void mousePressed() {
  a.clicked(mouseX, mouseY);
}

void mouseReleased() {
  a.stopDragging();
}
