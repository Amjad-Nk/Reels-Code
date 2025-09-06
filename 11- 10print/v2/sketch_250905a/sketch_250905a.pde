float x, y;
float space = 4*4;

pointMove pm[] = new pointMove[50];

void setup() {
  size(400, 720 , P2D);
  background(0);
  stroke(255);
  init();
}


void draw() {
  for(pointMove p : pm)
    p.draw();
}
