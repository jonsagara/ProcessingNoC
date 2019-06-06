class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
 
  Mover(float mass, float initialX, float initialY) {
    this.mass = mass;
    location = new PVector(initialX, initialY);
    velocity = new PVector(1, 0);
    acceleration = new PVector(0, 0);
  }
  
  void applyForce(PVector force) {
    // Since we no longer assume mass is 1, F no longer equals A. Divide the applied force 
    //   by mass to get the acceleration.
    PVector computedAccel = PVector.div(force, mass);
    
    // Add to acceleration, but we must remember to 0 it out in update after computing
    //   velocity and location, else it will rapidly grow unbounded.
    acceleration.add(computedAccel);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    
    // Clear acceleration so that we're not continually adding it in each frame in the
    //   applyForce function.
    acceleration.mult(0);
  }
  
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(location.x, location.y, mass*25, mass*25);
  }
  
  void checkEdges() {
    if (location.x < 0) {
       location.x = width;
    } else if (location.x > width) {
       location.x = 0;
    }
    
    if (location.y > height) {
       location.y = height;
       velocity.y *= -1;
    }
  }
}
