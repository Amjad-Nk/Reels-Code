float x, y;
float space = 4*4;

void setup() {
  size(400, 720,P3D);
  background(0);
  stroke(255);
  strokeWeight(2);
  frameRate(120);
}

void draw() {

  if (random(1) > 0.5)
    line(x, y, x +space, y + space);
  else 
    line(x, y+space, x +space, y);
    
  x = (x+space)%width;
  if (x ==0){
    y +=space;
  }
}
