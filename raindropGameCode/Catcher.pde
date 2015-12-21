class Catcher {
  float diam;
  PVector pos = new PVector();
  
  Catcher(float tDiam) {
    pos.set(mouseX,mouseY);
    diam = tDiam;
  }
  
  void display() {
    ellipse(pos.x,pos.y,diam,diam);
  }
  
  void update() {
    pos.set(mouseX,mouseY);
  }
}