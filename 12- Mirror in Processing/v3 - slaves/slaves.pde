float x , y , r = 100;
float t = 0 , step = 0.005;
int MAX_POINT = 8;

wave waves[] = new wave[MAX_POINT];

void setup(){
  size(400 , 720 , P3D);
  strokeWeight(3);
  background(0);
  
  for(int i=0; i<waves.length; i++)
    waves[i] = new wave(i);
 
}

void draw(){

  t+=step;
  
  translate(width/2 , height/2);
  for(int i=0; i<waves.length; i++){
    waves[i].draw();
  }
  
}
