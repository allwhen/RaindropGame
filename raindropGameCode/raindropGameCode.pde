int score = 0; //number of raindrops touched
ArrayList<Raindrop> drops = new ArrayList<Raindrop>();
boolean flag = false;

Catcher bucket = new Catcher(50);

void setup() {
  size(1200, 800);
  noStroke();
  noCursor();
  textSize(40);
  textAlign(CENTER);
}

void draw() {
  background(200, 200, 255);
  bucket.display();
  
  drops.add(new Raindrop(random(width),0));
  
  //goes through arraylist
  for(int j = drops.size()-1; j>=0; j--) {
    Raindrop rain = drops.get(j);
    rain.fall();
    rain.display();

    if (rain.touches(bucket)) {
      drops.remove(j);
      score++;
      bucket.diam+=rain.diam/100; //increase bucket's size, remove drop
    }
    else if (rain.pos.y > height + rain.diam/2) {
      drops.remove(j); //drops disappear when falling off screen
    }
  }

  bucket.update();
  
  fill(100,150,255);
  
  text(round(bucket.diam/2),width/2,40); //shows size of bucket
}