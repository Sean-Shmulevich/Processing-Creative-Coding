//index variable for timing
// used to index the draw() method
int count = 0;
//@pjs preload="data/arch.jpg";
//images for slideshow
PImage img;
PImage img1;
boolean once = true;
File folder = dataFile("data");
int fade = 150;
int pointillize = 10;
int fade1 = 150;
float circleSize, y1 = 1;

char[] text = {' ', 'ם', 'ו', 'ק', 'י', ' '};
PFont myFont;
int move = 0;
int loc=width;
int line = 0;
//saves state of screen before poem to prevent text from overlapping
//this variable is set as the background every time a new line of text is displayed
//this is done in order to not change the screen before the poem
boolean doneShofar = false;

//how is this a thing?

/* @pjs preload="shofar.jpg"; */
/* @pjs preload="mystical-tzfat.jpg"; */
/* @pjs preload="IMG_1022.jpg"; */
/* @pjs preload="Tree-of-Life.jpg"; */
/* @pjs font="Georgia.ttf"; */
int x = 0;
int y = -900;

int index = 0;
//stores the different lines of the poem in an array for indexing with count
boolean left = true;
public void setup()
{
  img = loadImage("shofar.jpg");
  size(900, 600);
  background(0);
  strokeWeight(1);
  frameRate(30);
}

public void draw()
{
  count++;
  if (count < 350 )
  {
    image(img, x, 0);
    image(img, y, 0);
    int mouseSpeed = mouseX/100;
    if (mouseX >= width/2)
    {
      x = (x +1)+mouseSpeed;
      y = (y + 1)+mouseSpeed;
      if (x >= 900)
      {
        x = -820;
      }
      if (y >= 900)
      {
        y = -820;
      }
    } else if (mouseX < width/2)
    {
      x = (x - 2)-(8-mouseSpeed);
      y = (y - 2)-(8-mouseSpeed);

      if (x <= -900)
      {
        x = 820;
      }
      if (y <= -900)
      {
        y = 820;
      }
    }
  }
  if (count >= 200 )
  {
    doneShofar = true;
    frameRate(20);
    tint(255, fade);
    fade--;
  }
  if (count >= 350 && count < 3000)
  {
    frameRate(10000000);
    img = loadImage("IMG_1022.jpg");
    smooth();
    if (once)
    {
      background(255);
      once = false;
    }
    int x = int(random(img.width));
    int y = int(random(img.height));
    int a = int(random(img.width));
    int B = int(random(img.height));
    int c = int(random(img.width));
    int d = int(random(img.height));


    int e = int(random(img.width));
    int f = int(random(img.height));
    int G = int(random(img.width));
    int h = int(random(img.height));
    int i = int(random(img.width));
    int j = int(random(img.height));
    int k = int(random(img.width));
    int l = int(random(img.height));


    int picture = x + y*img.width;
    int picture1 = a + B*img.width;
    int picture2 = c + d*img.width;

    int picture3 = e + f*img.width;
    int picture4 = G + h*img.width;
    int picture5 = i + j*img.width;
    int picture6 = k + l*img.width;

    // finds color
    loadPixels();
    float r = red(img.pixels[picture]);
    float g = green(img.pixels[picture]);
    float b = blue(img.pixels[picture]);

    float r1 = red(img.pixels[picture1]);
    float g1 = green(img.pixels[picture1]);
    float b1 = blue(img.pixels[picture1]);

    float r2 = red(img.pixels[picture2]);
    float g2 = green(img.pixels[picture2]);
    float b2 = blue(img.pixels[picture2]);

    float r3 = red(img.pixels[picture3]);
    float g3 = green(img.pixels[picture3]);
    float b3 = blue(img.pixels[picture3]);

    float r4 = red(img.pixels[picture4]);
    float g4 = green(img.pixels[picture4]);
    float b4 = blue(img.pixels[picture4]);

    float r5 = red(img.pixels[picture5]);
    float g5 = green(img.pixels[picture5]);
    float b5 = blue(img.pixels[picture5]);

    float r6 = red(img.pixels[picture6]);
    float g6 = green(img.pixels[picture6]);
    float b6 = blue(img.pixels[picture6]);

    noStroke();

    // takes pizel color and draws a circle at the random point
    fill(r, g, b, 100);
    ellipse(x, y, pointillize, pointillize); 

    fill(r1, g1, b1, 100);
    ellipse(a, B, pointillize, pointillize); 

    fill(r2, g2, b2, 100);
    ellipse(c, d, pointillize, pointillize); 

    fill(r3, g3, b3, 100);
    ellipse(e, f, pointillize, pointillize);

    fill(r4, g4, b4, 100);
    ellipse(G, h, pointillize, pointillize); 

    fill(r5, g5, b5, 100);
    ellipse(i, j, pointillize, pointillize); 

    fill(r6, g6, b6, 100);
    ellipse(k, l, pointillize, pointillize);
  }
  if (count >= 3000 && count <= 3020)
  {
    if (!once)
    {
      background(img);
      once = true;
    }
    frameRate(5);
  }
  if (count == 3020)
  {
    img = loadImage("mystical-tzfat.jpg");
    background(img);
  }
  if (count == 3100)
  {
    img = loadImage("Safed.jpg");
    background(img);
  }
  if (count > 3150 && count < 4000)
  {
    img = loadImage("Tree-of-Life.jpg");
    background(img);
    frameRate(10000000);
    noFill();
    strokeWeight(2);
    smooth();
    stroke((0));

    circleSize += y1;
    for (int i =1000; i>0; i -= 10) {
      ellipse(0+i, 0+i, circleSize, circleSize);
    }
    if (circleSize > width || circleSize < 0) {
      y1 *= -1;
    }
  }
  if (count >= 4000 && count < 4050)
  {
    noStroke();
    frameRate(100);
    rectMode(CENTER);
    float i = 900;
    float ii = 600;

    for (int ix = 0; ix >= 0; ix = ix + 150) {

      for (ii = width-ix; ii > 0; ii = ii - 10) {
        rect(width/2, height/2, ii, ii);
        fill(random(100, 255), random(100, 255), random(100, 255));
      }

      for (i = width - ix; i > 0; i = i - 10) {
        ellipse(width/2, height/2, i, i);
        fill(random(100, 255), random(100, 255), random(100, 255));
      }
    }
  }
  if (count >= 4050 && count < 4500)
  {
    if (once)
    {
      background(255);
      once = false;
    }
    myFont = createFont("Georgia", 32);
    textFont(myFont);
    fill(random(255), random(255), random(255));
    frameRate(50);
    loc+=32;
    if (loc >= width)
    {
      loc =0;
      line+= 32;
    }
    move++;
    if ( move >= text.length) 
    {
      move = 0;
    }
    text(text[move], loc, line);
  }
  if (count >= 4500)
  {
    if(!once)
    {
     background(255);
     once = true; 
     myFont = createFont("Georgia", 32);
     textAlign(CENTER);
     textFont(myFont);
     text("Draw with mouse, the end", width/2, height/2);
    }
    if (mousePressed == true) 
    {
      strokeWeight(random(20, 205));
      stroke(random(0, 255), random(0, 255), random(0, 255));
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    System.out.println(count);
  }
}
