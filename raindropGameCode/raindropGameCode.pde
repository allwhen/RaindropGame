PVector mouse;   //declare a P
int num = 100; //#raindrops
int score = 0; //number of raindrops touched
Raindrop[] r = new Raindrop[num];
ArrayList drops = new ArrayList();

Catcher catcher = new Catcher(200);


// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test

void setup() {
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  for (int i=0; i<num; i++) {
    r[i] = new Raindrop(random(width), random(height));   //Initialize r. The parameters used are the initial x and y positions
  }
  noStroke();
  textSize(40);
  textAlign(CENTER);
}

void draw() {
  background(200, 200, 255);
  catcher.display();
  for (int j=0; j<num; j++) {
    r[j].fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r[j].display();      //display the raindrop
    if (r[j].touches(catcher)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r[j].reset();                         //if it is, reset the raindrop
      score +=1;
    }
    if (r[j].pos.y > height + r[j].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
       r[j].reset();                           //if it does, reset the raindrop
    }
  }
  catcher.update();
  text(score,width/2,40);
}