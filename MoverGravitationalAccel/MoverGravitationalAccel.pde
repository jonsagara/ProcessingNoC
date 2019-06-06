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
  
  a.display();
  m.display();
}
