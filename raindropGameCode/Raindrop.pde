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
    diam = random(20,45);
  }

  //initializes at a point
  Raindrop(float x, float y) {
    pos.set(x, y);
    vel.set(0, 0);
    acc.set(0, .2);
    diam = random(20,45);
  }
  
  //moves raindrop, accelerates
  void fall() {
    pos.add(vel);
    vel.add(acc);
  }
  
  //draws raindrop
  void display() {
    fill(0, 0, 255);
    ellipse(pos.x, pos.y, diam, diam);
  }
  
  //moves raindrop back to the top (not used)
  void reset() {
    vel.y = 0;
    pos.set(random(width),0);
  }
  
  //returns whether or not the raindrop touches some point
  boolean touches(PVector a) {
    return a.dist(pos)<=diam/2;
  }
  
  //returns whether or not raindrop touches a catcher
  boolean touches(Catcher a) {
    return a.pos.dist(pos)<=diam/2+a.diam/2;
  }
}