float circleSize, y = 1;
void setup() {
  frameRate(10000000);
  size(1000, 1000);
  noFill();
  strokeWeight(2);
  smooth();
  stroke((255));
}
void draw() {
  background(0);
  circleSize += y;
  for (int i =1000; i>0; i -= 20) {
    ellipse(0+i, 0+i, circleSize, circleSize);
  }
  if (circleSize > width || circleSize < 0) {
    y *= -1;
  }
}