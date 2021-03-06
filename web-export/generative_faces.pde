int _num = 5;
int distX = 125;
int distY = 150;
Face[] _faceArr = {
};



void setup() {
  size(612, 612);
  background(255);
  smooth();
  frameRate(10);
  drawNewFace2(width/2, height/2);
}

void draw() {
//  fill(255, 10);
//  rect(0, 0, width, height);
//  background(255);
  fill(255, 10);
  rect(0, 0, width, height);
  background(255);
  drawNewFace3(width/2, height/2);
  drawNewFace2(width-distX, distY);
  drawNewFace2(distX, distY);
  drawNewFace2(width-distX, height-distY);
  drawNewFace2(distX, height-distY);

  //  for (int i = 100; i<width; i += 200) {
  //    //    Face thisFace = _faceArr[i];
  //    drawNewFace2(dist, i);
  //    for (int i2 = 100; i2<width; i2 += 200) {
  //      drawNewFace2(i, dist);
  //    }
  //  }
  //    drawNewFace2(width-dist, dist);
  //    drawNewFace2(dist, dist);
  //    drawNewFace2(width-dist, height-dist);
  //    drawNewFace2(dist, height-dist);
  //  saveFrame("data/frames#####" + ".png");
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

void drawNewFace2(float x, float y) {
  Face thisFace2 = new Face(x, y);
  thisFace2.draw_new_head(x, y);
  thisFace2.draw_eyes();
  thisFace2.draw_nose2(x, y);
  thisFace2.draw_mouth(x, y);
  thisFace2.draw_ears();
}
void drawNewFace3(float x, float y) {
  Face thisFace3 = new Face(x, y);
  thisFace3.draw_head(x, y);
  thisFace3.draw_eyes();
  thisFace3.draw_nose2(x, y);
  thisFace3.draw_mouth(x, y);
  thisFace3.draw_ears();
}

class Face {
  float head_x;
  float head_y;
  float head_height;

  float new_head_x;
  float new_head_y;

  float l_eye_x;
  float r_eye_x;
  float eye_y;

  float nose_x;
  float nose_y;

  float mouth_x;
  float mouth_y;

  //ears position
  float l_ear_x;
  float r_ear_x;
  float ears_y;


  // right ear
  // 1st control
  float x2;
  float y2;
  // 2nd control 
  float x3;
  float y3;
  // anchor point
  float x4;
  float y4;

  // left ear
  // 1st control
  float x5;
  float y5;
  // 2nd control 
  float x6;
  float y6;
  // anchor point
  float x7;
  float y7;

  // sizes

  float rad;
  float left_eye_rad;
  float right_eye_rad;
  float left_zin_rad;
  float right_zin_rad;
  float nose_rad;
  float ear_rad;
  float mouth_rad;


  Face (float head_x, float head_y) {  
    stroke(0);
    //    head_x = width/2;
    //    head_y = height/2;

    head_height = random(90, 140);

    // position
    l_eye_x = (head_x)-random(20, 30);
    r_eye_x = (head_x)+random(20, 30);
    eye_y = head_y - random(0, 20);

    nose_x = head_x + random(-10, 10);
    nose_y = eye_y + random(30, 40);

    mouth_x = new_head_x + random(-30, 5);
    mouth_y = new_head_y + random(30, 80);

    // ears
    l_ear_x = head_x - 50;
    r_ear_x = head_x + 50;
    ears_y = head_y - random(0, 30);

    // right ear
    // 1st control
    x2 = r_ear_x + random(10, 20);
    y2 = ears_y + random(-10, 10);
    // 2nd control 
    x3 = r_ear_x + 20;
    y3 = ears_y + 10;
    // anchor point
    x4 = r_ear_x;
    y4 = ears_y + 10;

    // left ear    
    // 1st control
    x5 = l_ear_x - random(10, 20);
    y5 = ears_y + random(-10, 10);
    // 2nd control 
    x6 = l_ear_x - 20;
    y6 = ears_y + 10;
    // anchor point
    x7 = l_ear_x;
    y7 = ears_y + 10;

    // sizes

    rad = random(190, 210);
    left_eye_rad = random(25, 35);
    right_eye_rad = random(25, 35);
    left_zin_rad = left_eye_rad/random(1.5, 3);
    right_zin_rad = right_eye_rad/random(1.5, 3);
    nose_rad = random(10, 15);
    ear_rad = random(30, 50);
    mouth_rad = random(20, 30);
  }

  void draw_head(float trX, float trY) {
    translate(trX, trY);
    noFill();
    ellipse(head_x, head_y, rad * random(0.9, 1.1), rad);
    resetMatrix();
  }

  void draw_new_head(float trX, float trY) {
    noFill();
    translate(trX, trY);

    // left 
    beginShape();
    vertex(new_head_x - random(40, 60), new_head_y - random(80, 100));
    bezierVertex(new_head_x, new_head_y, new_head_x - 100, new_head_y + 100, new_head_x + 30, new_head_y + head_height);
    endShape();

    // right
    beginShape();
    vertex(new_head_x + random(40, 60), new_head_y - random(80, 100));
    bezierVertex(new_head_x, new_head_y, new_head_x + 100, new_head_y + 50, new_head_x + 30, new_head_y + head_height);
    endShape();

    // middle top, hair
    beginShape();
    vertex(new_head_x - random(40, 60), new_head_y - 100);
    bezierVertex(new_head_x - random(40, 60), new_head_y - 50, new_head_x + 60, new_head_y - 50, new_head_x + 50, new_head_y - random(50, 100));
    bezierVertex(new_head_x - 60, new_head_y - 60, new_head_x + 50, new_head_y - 50, new_head_x + 50, new_head_y - random(50, 100));
    bezierVertex(new_head_x - random(50), new_head_y - 50, new_head_x + 50, new_head_y - 50, new_head_x + 50, new_head_y - random(50, 100));
    endShape();
    //    
    //    // beard
    //    beginShape();
    //    vertex(new_head_x, new_head_y + head_height);
    //    bezierVertex(new_head_x + 10, new_head_y + head_height*0.9, new_head_x - 10, new_head_y + head_height*1.2, new_head_x, new_head_y + head_height);
    //    endShape();

    resetMatrix();
  }

  void draw_eyes() {
    // білки
    fill(255);
    ellipse(l_eye_x, eye_y, left_eye_rad, left_eye_rad);
    ellipse(r_eye_x, eye_y, right_eye_rad, right_eye_rad);
    // зіниці
    noFill();
    stroke(50);
    strokeWeight(random(1, 10));
    ellipse(l_eye_x, eye_y, left_zin_rad, left_zin_rad);
    ellipse(r_eye_x, eye_y, right_zin_rad, right_zin_rad);
    fill(255);
    stroke(0);
    strokeWeight(1);
  }

  void draw_nose() {
    noFill();
    //    ellipse(nose_x, nose_y, nose_rad, nose_rad);
    stroke(0);
    strokeWeight(random(2, 4));
    line(nose_x, nose_y, nose_x + random(-20, 20), nose_y + random(-5, 5));
    stroke(0);
    strokeWeight(1);
  }
  
  void draw_nose2(float trX, float trY) {
   translate(trX, trY);
    beginShape();
    vertex(new_head_x, new_head_y + head_height*random(0.2, 0.35));
    bezierVertex(new_head_x + 30, new_head_y + head_height*0.2, new_head_x - 10, new_head_y + head_height*0.3, new_head_x + random(-5, 5), new_head_y);
    endShape();  
    resetMatrix(); 
  }

  void draw_mouth(float trX, float trY) {
    //    fill(255);
    //    ellipse(mouth_x, mouth_y, mouth_rad * random(0.9, 2.0), mouth_rad);
    //    fill(0);
    //    ellipse(mouth_x, mouth_y, mouth_rad/random(2, 2.5), mouth_rad/random(2, 5));
    //     
    translate(trX, trY);
    beginShape();
    vertex(mouth_x, mouth_y);
    bezierVertex(new_head_x + 100, mouth_y*random(0.5, 1.5) , new_head_x + 10, mouth_y*random(0.9, 1.5), mouth_x, mouth_y);
    endShape();  
    resetMatrix();
  }

  void draw_ears() {
    noFill();
    //    ellipse(l_ear_x, ears_y, ear_rad, ear_rad);
    //    ellipse(r_ear_x, ears_y, ear_rad, ear_rad);
    //    fill(0);
    //    println(l_ear_x);
    beginShape();
    vertex(r_ear_x, ears_y);
    bezierVertex(x2, y2, x3, y3, x4, y4);
    endShape();

    beginShape();
    vertex(l_ear_x, ears_y);
    bezierVertex(x5, y5, x6, y6, x7, y7);
    endShape();
  }
}


