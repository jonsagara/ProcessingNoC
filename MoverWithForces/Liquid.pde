class Liquid {
  float x;
  float y;
  float width;
  float height;
  float dragCoefficient;
  
  Liquid(float x, float y, float width, float height, float dragCoefficient) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.dragCoefficient = dragCoefficient;
  }
  
  void display() {
    noStroke();
    fill(175);
    rect(x, y, width, height);
  }
}
