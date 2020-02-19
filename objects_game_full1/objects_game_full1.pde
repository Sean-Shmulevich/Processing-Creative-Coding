int x= width/2;
float rainFall = 0, rainX;
int userSpeed = 1;
int points = 0;
float[] objectX =new float[]{500, 300};
float[] objectY = new float[]{500, 300} ;

void setup() {
  size(800, 450);
  frameRate(10000000);
  rainX= random(0, 500);
}

void draw() {

  background(0);
  rect(x, 400, 30, 48);
  falling();
  keyPressed();
  if (x <= 0) {
    x =1;
  } else if (x >= 770) {
    x= 769;
  }
}

void keyPressed() {
  if (keyPressed == true){///avoids player moving when key is not pressed when code is in draw
  if (key == CODED) { 
    if (keyCode == LEFT) {
      rect(x-=userSpeed, 400, 30, 48);
    }
    if (keyCode == RIGHT) {
      rect(x+=userSpeed , 400, 30, 48);
    }
    if (keyCode == UP) {
      userSpeed+=5;
    }
    if (keyCode == DOWN) {
      userSpeed-=5;
    }
  }
  rect(x, 400, 30, 48);
  }
}





void falling() {


  rainFall  += .5;
  rect(rainX, rainFall, 5, 90);

  if (rainFall >= 440) {
    rainFall= 0;
    rainX= random(50, 750);
    rect(rainX, rainFall, 5, 90);
  }
}