class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
 
  Mover(float mass, float initialX, float initialY) {
    this.mass = mass;
    location = new PVector(initialX, initialY);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void applyForce(PVector force) {
    // Naive implementation:
    //acceleration = force;
    
    // Since we no longer assume mass is 1, F no longer equals A. Divide the applied force 
    //   by mass to get the acceleration.
    // Naive implementation: This modifies the instance. Use the static API to return a copy,
    //   leaving the original instance intact.
    //force.div(mass);
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
    fill(175);
    ellipse(location.x, location.y, mass * 16, mass * 16);
  }
  
  void checkEdges() {
    if (location.x < 0) {
       location.x = 0;
       velocity.x *= -1;
    } else if (location.x > width) {
       location.x = width;
       velocity.x *= -1;
    }
    
    if (location.y < 0) {
       location.y = 0;
       velocity.y *= -1;
    } else if (location.y > height) {
       location.y = height;
       velocity.y *= -1;
    }
  }
}
