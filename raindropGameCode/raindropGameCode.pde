int score = 0; //number of raindrops touched
ArrayList<Raindrop> drops = new ArrayList<Raindrop>();
boolean pause = true;
boolean start = false;

Catcher bucket = new Catcher(50);

void setup() {
  size(1200, 800);
  noStroke();
  noCursor();
  textSize(40);
  textAlign(CENTER);
  background(0);
}

void draw() {
  if (bucket.diam/2<720) { //if victory conditions have not been satisfied
    if (!pause) { //if game hasn't been paused
      noCursor();
      background(200, 200, 255);
      bucket.display();

      drops.add(new Raindrop(random(width), 0));

      //goes through arraylist
      for (int j = drops.size()-1; j>=0; j--) {
        Raindrop rain = drops.get(j);
        rain.fall();
        rain.display();

        if (rain.touches(bucket)) {
          drops.remove(j);
          score++;
          bucket.diam+=rain.diam/100; //increase bucket's size, remove drop
        } else if (rain.pos.y > height + rain.diam/2) {
          drops.remove(j); //drops disappear when falling off screen
        }
      }

      bucket.update();

      fill(100, 150, 255);

      text(round(bucket.diam/2), width/2, 40); //shows size of bucket
    } else {
      cursor();
      if (start) {
        text("pause", width/2, height/2);
      }
    }

    if (!start) { //starting screen
      text("click to toggle pause", width/2, height/2);
      text("mouse to move", width/2, height/2-50);
      text("consume raindrops until you can swallow the screen", width/2, height/2-200);
    }
  }
  else { //victory screen
    background(255);
    fill(0);
    text("All will become one. Devour.",width/2,height/2);
  }
}

void mouseClicked() { //start game, pause game.
  pause = !pause;
  start = true;
}

