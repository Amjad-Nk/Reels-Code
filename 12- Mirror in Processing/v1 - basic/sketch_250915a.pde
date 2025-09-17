float x , y , r = 100  , t = 0;
float rotateShape , step = 0.02;
int MAX_POINT = 4;

void setup(){
  size(400, 720,P2D);
  stroke(200,50);
  strokeWeight(3);
  background(0);
}

void draw(){

  t+=0.01;
  noiseDetail(2);
  float x = r+700*(noise(t,1)-0.5);
  float y = r+700*(noise(t,2)-0.5);
  
  translate(width/2 , height/2);
  rotate(rotateShape+=step);
  
  for(int i=0; i<MAX_POINT; i++){
    rotate(TWO_PI/(MAX_POINT+0.0));
    point(x , y);
  }

}
