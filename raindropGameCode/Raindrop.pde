class Raindrop {
  PVector pos = new PVector();
  PVector vel = new PVector();
  PVector acc = new PVector();
  float diam;
  
  //initializer (empty)
  Raindrop() {
    pos.set(random(width), random(height));
    vel.set(0, 0);
    acc.set(0, .2);
    diam = 30;
  }

  //initializes at a point
  Raindrop(float x, float y) {
    pos.set(x, y);
    vel.set(0, 0);
    acc.set(0, .2);
    diam = 30;
  }
  
  //moves raindrop, accelerates
  void fall() {
    pos.add(vel);
    vel.add(acc);
  }
  
  //draws raindrop
  void display() {
    ellipse(pos.x, pos.y, diam, diam);
  }
  
  //moves raindrop back to the top
  void reset() {
    vel.y = 0;
    pos.set(random(width),0);
  }
  
  boolean touches(PVector a) {
    return a.dist(pos)<=diam/2;
  }
  
  boolean touches(Catcher a) {
    return a.pos.dist(pos)<=diam/2+a.diam/2;
  }
}