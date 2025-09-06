float x, y;
float space = 4*4;

pointMove pm[] = new pointMove[300];

void setup() {

  size(400, 720 , P3D);
  background(0);
  stroke(255);
  strokeWeight(2);
  init();
}

void draw() {
  for(pointMove p : pm)
    p.draw();
}
