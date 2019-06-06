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
    fill(0, 100);
    ellipse(location.x, location.y, mass*24, mass*24);
  }
  
  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 5.0, 25.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

    float strength = (g * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
  }
}
