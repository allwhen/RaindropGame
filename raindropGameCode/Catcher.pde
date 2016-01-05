class Catcher {
  float diam; //diameter
  PVector pos = new PVector(); //position
  color c; //color
  
  //catcher with diameter from parameter
  Catcher(float tDiam) {
    pos.set(mouseX,mouseY);
    diam = tDiam;
    c = color(random(255),random(255),random(255));
  }
  
  //circle at position with color and diameter desired.
  void display() {
    fill(c);
    ellipse(pos.x,pos.y,diam,diam);
  }
  
  //updates catcher's position
  void update() {
    pos.set(mouseX,mouseY);
  }
}