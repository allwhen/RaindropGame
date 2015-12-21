class Catcher {
  float diam;
  PVector pos = new PVector();
  color c;
  
  Catcher(float tDiam) {
    pos.set(mouseX,mouseY);
    diam = tDiam;
    c = color(random(255),random(255),random(255));
  }
  
  void display() {
    fill(c);
    ellipse(pos.x,pos.y,diam,diam);
  }
  
  void update() {
    pos.set(mouseX,mouseY);
  }
}