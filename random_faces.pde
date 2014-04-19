/* 
With this sketch you can create two types of random faces based on ellipse or bezier curves heads. 
To save a frame press "s" on your keyboard. Image will be saved in "data" folder. Image size is 612x612px. It's like an Instagram photo size. 
Then just post it to Instagram :) 
*/

int distX = 125;
int distY = 150;

void setup() {
  size(612, 612);
  background(255);
  smooth();
  frameRate(10);
  fill(255, 10);
  rect(0, 0, width, height);
}

void draw() {  
 
}
void mousePressed() {
   fill(255, 10);
  rect(0, 0, width, height);
  background(255);
  jonny(width/2, height/2, random(50, 70));
}

void keyPressed() {
  if (key == 's') {
    saveFrame("data/frame-#####.png");
    println("image saved");
  } 
  else {
    println("key " + key + " pressed.");
  }
}

// drawing complex face with bezier curves
void jonny(float x, float y, float headIndexY) {
  Face jonny = new Face(x, y);
  jonny.draw_new_head(x, y, headIndexY);
  jonny.draw_eyes();
  jonny.draw_nose2(x, y);
  jonny.draw_mouth(x, y);
  jonny.draw_ears();
  jonny.draw_moustaches(x, y, headIndexY);
}


