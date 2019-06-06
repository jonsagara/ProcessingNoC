class Attractor {
  float mass; // Mass, tied to size
  float G; // Gravitational constant
  PVector location; // Location of the attractor
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  PVector dragOffset; // Holds the offset for when the object is clicked.

  Attractor() {
    location = new PVector(width / 2, height / 2);
    mass = 20;
    G = 1;
    dragOffset = new PVector(0.0, 0.0);
  }

  void display() {
    ellipseMode(CENTER);
    strokeWeight(4);
    stroke(0);

    if (dragging) {
      fill(50);
    } else if (rollover) {
      fill(100);
    } else {
      fill(175, 200);
    }
    
    ellipse(location.x, location.y, mass * 2, mass * 2);
  }

  PVector attract(Mover m) {

    // Get the directional vector between the two objects (subtract the mover's
    //   location from this attractor's location).
    PVector force = PVector.sub(location, m.location);

    // Get the actual distance.
    float distance = force.mag();

    // When distance is small, it would make the force too large, so constrain it. Similarly,
    //   constrain the max distance, else the force might get so weak that the mover would
    //   cease... moving.
    distance = constrain(distance, 5, 25);

    // With the force vector, we're only concerned with its direction, so normalize it.
    force.normalize();

    // Calculate the gravitational force exerted on the mover by this attractor.
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);

    return force;
  }
  
  //
  // The methods below are for mouse interaction.
  //

  void clicked(int mx, int my) {
    float distance = dist(mx, my, location.x, location.y);
    if (distance < mass) {
      dragging = true;
      dragOffset.x = location.x - mx;
      dragOffset.y = location.y - my;
    }
  }

  void hover(int mx, int my) {
    float distance = dist(mx, my, location.x, location.y);
    if (distance < mass) {
      rollover = true;
    } else {
      rollover = false;
    }
  }
  
  void stopDragging() {
    dragging = false;
  }
  
  void drag() {
    if (dragging) {
      location.x = mouseX + dragOffset.x;
      location.y = mouseY + dragOffset.y;
    }
  }
}
