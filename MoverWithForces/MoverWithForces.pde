Mover[] movers = new Mover[100];

void setup() {
  size(640, 200);

  for (int ixMover = 0; ixMover < movers.length; ixMover++) {
    movers[ixMover] = new Mover(random(0.1, 5), 30, 30);//new Mover(random(0.1, 5), random(width), random(height));
  }
  background(255);
}

void draw() {
  background(255);

  PVector wind = new PVector(0.01, 0);

  for (int ixMover = 0; ixMover < movers.length; ixMover++) {
    movers[ixMover].applyForce(wind);
    
    // Mimic gravity by multiplying our made up gravitational force by the object's mass so that
    //   when we compute acceleration due to gravity (i.e., F / m), the mass cancels out, and 
    //   every object ends up having the same acceleration due to gravity.
    PVector gravity = new PVector(0, 0.1 * movers[ixMover].mass);
    movers[ixMover].applyForce(gravity);
    
    movers[ixMover].update();
    movers[ixMover].display();
    movers[ixMover].checkEdges();
  }
}
