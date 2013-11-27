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

  drawNewFace2(width/2, height/2);
//  drawNewFace2(width-distX, distY);
//  drawNewFace2(distX, distY);
//  drawNewFace2(width-distX, height-distY);
//  drawNewFace2(distY, height-distY);
}

void draw() {  
  fill(255, 10);
  rect(0, 0, width, height);
  background(255);
  drawNewFace2(width/2, height/2);
//  drawNewFace2(width-distX, distY);
//  drawNewFace2(distX, distY);
//  drawNewFace2(width-distX, height-distY);
//  drawNewFace2(distY, height-distY);
}
void mousePressed() {
  
}

void keyPressed() {
  if (key == 's') {
    saveFrame("data/frame#####" + ".png");
    println("image saved");
  } 
  else {
    println("key " + key + " pressed.");
  }
}

// drawing more complex face with bezier curves
void drawNewFace2(float x, float y) {
  Face thisFace2 = new Face(x, y);
  thisFace2.draw_new_head(x, y);
  thisFace2.draw_eyes();
  thisFace2.draw_nose2(x, y);
  thisFace2.draw_mouth(x, y);
  thisFace2.draw_ears();
}

// drawing ellipse face
void drawNewFace3(float x, float y) {
  Face thisFace3 = new Face(x, y);
  thisFace3.draw_head(x, y);
  thisFace3.draw_eyes();
  thisFace3.draw_nose2(x, y);
  thisFace3.draw_mouth(x, y);
  thisFace3.draw_ears();
}


