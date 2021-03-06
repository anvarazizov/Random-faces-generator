// beginning of class Face 

class Face {

  float head_x, head_y, head_height, headIndexY, hairX, moustacheX;
  float beardIndex, beard_left, beard_right;
  float new_head_x, new_head_y;
  float l_eye_x, r_eye_x, eye_y;
  float nose_x, nose_y;
  float mouth_x, mouth_y, mouthIndex;

  //ears position
  float l_ear_x, r_ear_x, ears_y;

  // right ear
    // 1st control
    float x2, y2;
    // 2nd control 
    float x3, y3;
    // anchor point
    float x4, y4;

  // left ear
    // 1st control
    float x5, y5;
    // 2nd control 
    float x6, y6;
    // anchor point
    float x7, y7;

  // sizes

  float rad, left_eye_rad, right_eye_rad, left_pupil_rad, right_pupil_rad, nose_rad, ear_rad, mouth_rad;

  Face (float head_x, float head_y) {  
    stroke(0);

    head_height = random(90, 120);
    //connection point between head and hair
    headIndexY = random(80, 85);
    hairX = random(10, 20);
    moustacheX = random(5, 15);
    
    beardIndex = 50;
    beard_left = new_head_x - beardIndex;
    beard_right = new_head_x + beardIndex;

    // position
    l_eye_x = (head_x)-random(20, 30);
    r_eye_x = (head_x)+random(20, 30);
    eye_y = head_y - random(0, 20);

    nose_x = head_x + random(-10, 10);
    nose_y = eye_y + random(30, 40);

    mouth_x = new_head_x + random(-10, 0);
    mouth_y = new_head_y + random(56, 65);
   
    mouthIndex = random(40, 50); 
    
     println(mouth_x, mouth_y, mouthIndex);
    
    // ears
    l_ear_x = head_x - random(45, 47);
    r_ear_x = head_x + random(45, 47);
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
    left_pupil_rad = left_eye_rad/random(1.5, 3);
    right_pupil_rad = right_eye_rad/random(1.5, 3);
    nose_rad = random(10, 15);
    ear_rad = random(30, 50);
    mouth_rad = random(20, 30);
  }

  //draw circle head
  void draw_head(float trX, float trY) {
    translate(trX, trY);
    noFill();
    ellipse(head_x, head_y, rad * random(0.9, 1.1), rad*random(0.8, 1.2));
    resetMatrix();
  }

  // draw head with bezier curves
  void draw_new_head(float trX, float trY, float headIndexY) {
    noFill();
    translate(trX, trY);

    // left 
    beginShape();
    vertex(new_head_x - 30, new_head_y - headIndexY);
    bezierVertex(new_head_x, new_head_y, new_head_x - random(90, 110), new_head_y + head_height, new_head_x - 50, new_head_y + head_height);
    endShape();

    // right
    beginShape();
    vertex(new_head_x + 30, new_head_y - headIndexY);
    bezierVertex(new_head_x, new_head_y, new_head_x + random(90, 110), new_head_y + head_height, new_head_x + 50, new_head_y + head_height);
    endShape();
    
    // beard
    beginShape();
    vertex(beard_left, new_head_y + head_height);
    bezierVertex(new_head_x, new_head_y + head_height, new_head_x + random(-20, 20), new_head_y + head_height*random(1.1, 1.5), beard_right, new_head_y + head_height);
    endShape();
    
    //hair
    translate(-30, -headIndexY);
    beginShape();
    for(float i = 0; i < 50; i++){
      vertex(new_head_x, new_head_y);
      bezierVertex(i + hairX, new_head_y - random(30, 50), i, new_head_y, i + hairX, new_head_y);
      stroke(i); 
  }
    endShape();
    resetMatrix(); 
 
    stroke(0);
    resetMatrix();
  }

  void draw_eyes() {
    // білки
    fill(255);
    ellipse(l_eye_x, eye_y, left_eye_rad, left_eye_rad);
    ellipse(r_eye_x, eye_y, right_eye_rad, right_eye_rad);
    // зіниці
    noFill();
    stroke(random(50, 60));
    strokeWeight(random(1, 10));
    ellipse(l_eye_x, eye_y, left_pupil_rad, left_pupil_rad);
    ellipse(r_eye_x, eye_y, right_pupil_rad, right_pupil_rad);
    fill(255);
    stroke(0);
    strokeWeight(1);
  }

  // very simple nose
  void draw_nose() {
    noFill();
    //    ellipse(nose_x, nose_y, nose_rad, nose_rad);
    stroke(0);
    strokeWeight(random(2, 4));
    line(nose_x, nose_y, nose_x + random(-20, 20), nose_y + random(-5, 5));
    stroke(0);
    strokeWeight(1);
  }
  // nose with curves  
  void draw_nose2(float trX, float trY) {
    translate(trX, trY);
    beginShape();
    vertex(new_head_x, new_head_y + head_height*random(0.25, 0.35));
    bezierVertex(new_head_x + random(-20, 20), new_head_y + head_height*0.2, new_head_x - 10, new_head_y + head_height*0.3, new_head_x + random(-5, 5), new_head_y);
    endShape();  
    resetMatrix();
  }
  // draw mouth with one bezier curve
  void draw_mouth(float trX, float trY) {

    translate(trX, trY);
    beginShape();
    vertex(mouth_x, mouth_y);
    bezierVertex(mouth_x + random(-50, 50), mouth_y*random(0.8, 1.5), mouth_x + random(20, 50), mouth_y*random(0.9, 1.2), mouth_x, mouth_y);
    endShape();  
    resetMatrix();
  }

  void draw_mouth2(float trX, float trY) {
    translate(trX, trY);
    fill(255);
    ellipse(mouth_x, mouth_y, mouth_rad * random(0.9, 2.0), mouth_rad);
    fill(0);
    ellipse(mouth_x, mouth_y, mouth_rad/random(2, 2.5), mouth_rad/random(2, 5));
    resetMatrix();
  }
  
// draw ears
  void draw_ears(){    
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
  
  void draw_moustaches(float trX, float trY, float headIndexY){
    noFill();
    translate(trX, trY);
   
    translate(-20, random(50, 55));
    beginShape();
    for(float i = 0; i < random(25, 60); i+=1.5)
    {
      vertex(0, 0);
      bezierVertex(i + moustacheX, 0 - random(5, 20), i, 0, i + moustacheX, 0);
      stroke(i);  
    }
    endShape();
    
    translate(0, beardIndex);
    beginShape();
    for(float i = 0; i < random(30, 40); i += 3)
    {
      vertex(0, 0);
      bezierVertex(i + moustacheX/2, 0 - random(10, 20), i, 0, i + moustacheX, random(0, 20));
      stroke(i);  
    }
    endShape();
  }
}
// ending of class Face 
