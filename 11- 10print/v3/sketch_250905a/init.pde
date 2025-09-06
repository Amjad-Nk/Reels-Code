PImage img;

void init() {

  img = createImage(width, height, RGB);
  int size = width * height;
  
  img.loadPixels();
  while (y<height) {
    int index;
    if (random(1) > 0.5) {
      for(int i=0; i<space; i++){
        index = int((x+i) + (y+i)*width);
        if(index <size)
          img.pixels[index] = color(255 , 255 , 255);        
      }
    } else {
      for(int i=0; i<space; i++){
        index = int((x+i) + (y+space-i)*width);
        if(index <size)
          img.pixels[index] = color(255 , 255 , 255);        
      }
    }

    x = (x+space)%width;
    if (x == 0)
      y +=space;
  }
  img.updatePixels();
  
  for(int i=0; i<pm.length; i++)
    pm[i] = new pointMove();
  
  
}
