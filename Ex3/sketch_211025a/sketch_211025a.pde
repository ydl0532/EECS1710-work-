PImage bg;
PFont font;

int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
 
void setup() {
  size(360, 360);
  bg = loadImage("york.png");
  stroke(255);
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  cx = width / 2;
  cy = height / 2;
}
 
void draw() {
  background(#8FDBFC);
  image(bg, 0, 0, width, height);
  // Draw the clock background
  fill(255,255,255,160);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
   
  // Draw  clock
  stroke(0);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
   
  // Draw the minute ticks
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
  fill(#e85151);
  text("York U watch from Donglin Yu", 105, 50);
}
