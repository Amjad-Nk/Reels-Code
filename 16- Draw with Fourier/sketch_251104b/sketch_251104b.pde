drawFourier d[]; 

// put your path here
String path = "data//5_geomatric//8";

// try change it
float size = 0.8; 
float speed = 0.5;

void setup() {
  size(400, 720 , P3D);

  d = new drawFourier[getFiles()];
  
  for (int i=0; i<d.length; i++) 
    d[i] = new drawFourier(path+"//path_"+(i+1)+".txt", size, speed);

  colorMode(HSB);
}

void draw() {
  background(0);
  
  for (drawFourier dd : d)
    dd.draw();
    
  for (drawFourier dd : d)
    dd.drawPath();
}
