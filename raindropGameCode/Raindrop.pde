class Raindrop {
  PVector pos = new PVector();
  PVector vel = new PVector();
  PVector acc = new PVector();
  float diam;
  Raindrop() {
    pos.x = random(width); pos.y = random(height);
    vel.x = 0; vel.y = 0;
    acc.x = 0; acc.y = .2;
    diam = 30;
  }
  
  Raindrop(float x, float y) {
    pos.x = x; pos.y = y;
    vel.x = 0; vel.y = 0;
    acc.x = 0; acc.y = .2;
    diam = 30;
  }
  
  void fall() {
    pos.add(vel);
    vel.add(acc);
  }
  void display() {
    ellipse(pos.x,pos.y,diam,diam);
  }
  void reset() {
    vel.y = 0;
    pos.y = 0;
  }
  
  boolean touches(PVector a) {
    a.sub(pos);
    return a.mag()<=diam;
  }
}