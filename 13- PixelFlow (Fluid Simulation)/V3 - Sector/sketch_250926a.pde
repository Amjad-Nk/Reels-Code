// static , animation , color , opacity , multi , random

import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.fluid.DwFluid2D;
import processing.opengl.PGraphics2D;

DwFluid2D fluid;
PGraphics2D pg_fluid;

float a;

//float vectX[][] = {
//  {-0.5 , 0.5} , {-0.5 , 0.5} , {-0.5 , 0.5} , {-0.5 , 0.5}
//};
float vectX[][] = {
  {-0.5 , 0.5} , {-1 , 0} , {-0.5 , 0.5} , {0, 1}
};
float vectY[][] = {
  {0 , 1} , {-0.5 , 0.5} , {-1 , 0} , {-0.5 , 0.5}
};
//float vectY[][] = {
//  {0 , 1} , {-1 , 0} , {-1 , 0} , {-1 , 0}
//};

void setup() {
  size(400, 720, P2D);
  noCursor();
  DwPixelFlow context = new DwPixelFlow(this);
  fluid = new DwFluid2D(context, width, height, 0);
  
  fluid.param.dissipation_velocity = 0.9f; // animated
  fluid.param.dissipation_density  = 0.95f; // opacity

  colorMode(HSB,255,255,255);
  fluid.addCallback_FluiData(new  DwFluid2D.FluidData() {
    public void update(DwFluid2D fluid) {
        a+=0.1;
        
        noiseDetail(5);
        for(int i=0; i<4; i++){
          color c = color(a%20+50*i , 200 ,200);
          float red   = red(c)/255.0;
          float green = green(c)/255.0;
          float blue  = blue(c)/255.0;

          float reduce = constrain(a , 0 , 35);
          
          float px     = width/2+(40-reduce)*cos(PI/2*(i+1));
          float py     = height/2+(40-reduce)*sin(PI/2*(i+1));
          float vx     = map(noise(a,i*2) , 0,1 ,vectX[i][0],vectX[i][1])*150;
          float vy     = map(noise(a,i*2+1) , 0,1 ,vectY[i][0],vectY[i][1])*150;
          fluid.addVelocity(px, py, 14, vx, vy);
          fluid.addDensity (px, py, 20, red, green, blue, 1); // x , y , r , R , G , B . brightness
          fluid.addDensity (px, py, 8, 1.0f, 0.3f, 0.5f, 1);
        }
        
        
        
        //for(int i=0; i<10; i++){
        //  color c = color(10 , 255 ,255);
        //  float red   = red(c)/255.0;
        //  float green = green(c)/255.0;
        //  float blue  = blue(c)/255.0;
        //  fluid.addDensity (px, py, 30+i, red, green, blue, 1); // x , y , r , R , G , B . brightness
        //}
        
        //float px     = mouseX;
        //float py     = height-mouseY;
        //float vx     = (mouseX - pmouseX) * +15;
        //float vy     = (mouseY - pmouseY) * -15;
        
        //fluid.addVelocity(px, py, 14, vx, vy);
        //fluid.addDensity (px, py, 20, red, green, blue, 1); // x , y , r , R , G , B . brightness
        //fluid.addDensity (px, py, 8, 1.0f, 0.3f, 0.5f, 1);
        
        //20+a*2
      }
    }
  );

  // render-target
  pg_fluid = (PGraphics2D) createGraphics(width, height, P2D);

  //frameRate(60);
}


public void draw() {
  // update simulation
  fluid.update();
  
  // clear render target
  pg_fluid.beginDraw();
  pg_fluid.background(0);
  pg_fluid.endDraw();

  // render fluid stuff
  fluid.renderFluidTextures(pg_fluid, 0);
  
  // display
  image(pg_fluid, 0, 0);
}
