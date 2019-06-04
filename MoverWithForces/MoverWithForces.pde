Liquid liquid;
Mover[] movers = new Mover[10];

void setup() {
  size(640, 360);
  
  // Note the coefficient of drag is low (0.1), otherwise the object would come to a halt fairly quickly.
  liquid = new Liquid(0, height / 2, width, height / 2, 0.1);

  for (int ixMover = 0; ixMover < movers.length; ixMover++) {
    movers[ixMover] = new Mover(random(0.1, 5), (ixMover+1) * movers.length * 2, 0);//new Mover(random(0.1, 5), random(width), random(height));
  }
  background(255);
}

void draw() {
  background(255);
  
  liquid.display();
  
  for (int i = 0; i < movers.length; i++) {
    if (movers[i].isInsideLiquid(liquid)) {
      movers[i].drag(liquid);
    }
    
    // Scale gravity according to mass.
    float m = 0.1 * movers[i].mass;
    PVector gravity = new PVector(0, m);
    movers[i].applyForce(gravity);
    
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }

  //PVector wind = new PVector(0.001, 0);
  
  //// We could scale gravity by mass to be more accurate.
  //PVector gravity = new PVector(0, 0.1);

  //for (int ixMover = 0; ixMover < movers.length; ixMover++) {
    
  //  // Apply a simplified version of friction: make up mu, and assume N is 1.
  //  float mu = 0.01;
  //  PVector friction = movers[ixMover].velocity.copy();
  //  friction.mult(-1); // Reverse the direction of velocity (equal and opposite force).
  //  friction.normalize(); // Convert to a unit vector; friction's magnitude only determined by coefficient of friction.
  //  friction.mult(mu);
    
  //  movers[ixMover].applyForce(friction);
    
  //  movers[ixMover].applyForce(wind);
    
  //  // Mimic gravity by multiplying our made up gravitational force by the object's mass so that
  //  //   when we compute acceleration due to gravity (i.e., F / m), the mass cancels out, and 
  //  //   every object ends up having the same acceleration due to gravity.
  //  //PVector gravity = new PVector(0, 0.1 * movers[ixMover].mass);
  //  movers[ixMover].applyForce(gravity);
    
  //  movers[ixMover].update();
  //  movers[ixMover].display();
  //  movers[ixMover].checkEdges();
  //}
}
