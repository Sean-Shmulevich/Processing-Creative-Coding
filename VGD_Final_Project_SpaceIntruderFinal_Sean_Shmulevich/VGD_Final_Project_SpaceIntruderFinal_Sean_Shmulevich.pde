PImage invader, shooter, space, start;
// spaceship position variables
int xs=250;
int ys=540;
PFont font;
// bullet position variables
int bx;
int by=-50;
int score=0;
int level=1;
boolean started=false;
boolean ended=false;
boolean landed=false;
// arrays representing x and y coordinates of invaders
float[] invX = new float[]{100, 200, 300, 400, 50, 150, 250, 350, 100, 200, 300, 400, }; 
float[] invY = new float[]{75, 75, 75, 75, 150, 150, 150, 150, 225, 225, 225, 225}; 
int winScore = 36;
float invSpd=0.18;

color instructions;
int randomX;
int randomY;


int move;
int loc=width;
int line;
char[] starting ={'S', 'p', 'a', 'c', 'e', ' ', 'I', 'n', 't', 'r', 'u', 'd', 'e', 'r', 's', ' '};
// resets state of game by setting variable values

//allows speed cheat
int cheat =2;
int cheatX =6;
void reset()
{
  xs=250;
  ys=540;
  score=0;
  ended=false;
  landed=false;
  invX = new float[]{100, 200, 300, 400, 50, 150, 250, 350, 100, 200, 300, 400, };
  invY = new float[]{75, 75, 75, 75, 150, 150, 150, 150, 225, 225, 225, 225};
  by=-50;
}
// iterate over all invader positions and handle collisions
void handleCollisions()
{
  for (int i=0; i<12; i++)
  {
    // if bullet is on screen and distance is less than radius of an invader detect collision
    // dist function calculates distance between two points. Its parameters are x1,x2 and x2,y2
    if (by>0 && dist(bx, by, invX[i], invY[i])<20)
    {
      // if there is collision take bullet and invader y positions outside screen
      invY[i]=-50;
      by=-100;
      // if all 12 invaders in current layers are shot i.e new score 
      // is going to be a non zero multiple of 16 then reset arrays and increase speed of invaders
      if ((score+1)%12==0 && score!=0)
      {
        invX = new float[]{100, 200, 300, 400, 50, 150, 250, 350, 100, 200, 300, 400, };
        invY = new float[]{75, 75, 75, 75, 150, 150, 150, 150, 225, 225, 225, 225};
        invSpd += 0.1;
        level++;
        by=-100;
      }
      score++;
    }   
    // if y position of an invader is low then setting landed boolean to true
    if (invY[i]>540) {
      landed=true;
      ended=true;
    }
    // if score equals winning score then end game
    if (score==winScore) {
      ended=true;
    }
  }
}
// Move and Display invaders, spaceship and bullet
void displayMoveObjects()
{
  ///increses difficulty for level of shaking
  if (level ==1) {
    randomX = int(random(-2, 3));
    randomY= int(random(-2, 3));
  } else if (level ==2) {
    randomX = int(random(-10, 10));
    randomY= int(random(-10, 10));
  } else if (level ==3) {
    randomX = int(random(-25, 25));
    randomY= int(random(-25, 25));
  } else {
    randomX = int(random(-40, 40));
    randomY= int(random(-40, 40));
  }

  // draw spaceship
  fill(255);
  image(shooter, xs, ys, 58, 63);
  // move bullet upwards and display it by ellipse
  by-=cheatX;
  ellipse(bx, by, 6, 6);
  // display score by converting int to String
  text("Score: "+Integer.toString(score), 84, 620);
  text("Level: "+Integer.toString(level), 410, 621);
  // iterate over invaders, display them as ellipse and if invader is on screen then move it downwards
  for (int i=0; i<12; i++)
  {
    fill(100, 0, 0);
    imageMode(CENTER);
    image(invader, invX[i]+randomX, invY[i]+randomY, 60, 60);
    if (invY[i]>0) {
      invY[i]+=invSpd;
    }
  }
}
void setup()
{
  size(500, 650);
  invader = loadImage("invader.png");
  shooter = loadImage("shooter.png");
  space = loadImage("space.png");
  start = loadImage("start.png");
  font  = createFont("Pokemon GB.ttf", 16);
  textFont(font);
  textAlign(CENTER, CENTER);

  if (!started) {
    font  = createFont("Pokemon GB.ttf", 15);
    textFont(font);
    background(start);
    text("Space Intruders\n\n\n  Press any key\n\n to start..", 250, 250);
  }
}
void draw()
{
  // if game started
  if (started)
  {
    background(space); 
    displayMoveObjects();
    //allows smooth movement
    if (keyPressed==true) {
      keyPressed();
    }
    handleCollisions();
    // if score is 12 by shooting all invaders or a lander has landed then display corresponding game over message
    if (score==winScore) {
      background(0);
      fill(0, 255, 0);
      text("     You Won ! \n\n Press Enter to Continue", 246, 250);
    } else if (landed) {
      background(0);
      fill(255, 0, 0);
      text("You Lost ! \n\n Press Enter to Continue", 246, 250);
    }
  } // if game not started show splash screen text
  else {
    //draws text to screen
    fill(random(255), random(255), random(255), 100);
    frameRate(20);
    loc+=20;
    if (loc >= width) {
      loc =0;
      line+= 32;
    }
    move++;
    if ( move >= starting.length) {
      move = 0;
    }
    text(starting[move], loc, line);
    //re=sets framerate
    frameRate(60);
    instructions = color(255, 0, 0);
    fill(instructions);
    text("instructions", 250, 500);
  }
}
// event function that is called when a key is pressed


void mousePressed() {
  if (mouseX >=152 && mouseX<=348 && mouseY>=492 && mouseY<=511) {
    instructions = color(255, 0, 255);
    background(0);
    fill(255);
    move=0;
    loc=0;
    line=0;
    text("use Left and right arrow keys\n\n to move use up arrow to shoot\n\n\n\npress any button to begin", 250, 250);
  }
}
void keyPressed()
{
  // on left and right arrow key press increment or decrement spaceship position if spaceship stays in bounds
  if (!landed || !(score==winScore)) {
    if (keyCode==LEFT && xs>30) {
      xs-=cheat;
    } else if (keyCode==RIGHT && xs<470) {
      xs+=cheat;
    } else if (keyCode== UP)
    {
      // if Up is pressed and bullet not already on screen then set it's start position same as spaceship  
      if (by<-10) {
        bx=xs;
        by=ys;
      }
    }
  }
  started=true;
  // if game ended restart
  if (keyCode == ENTER && ended)
  {
    reset();
    level=1;
  }
  //cheat for debugging game
  if (key == 'a') {
    cheat=5;
    cheatX=25;
  }
}