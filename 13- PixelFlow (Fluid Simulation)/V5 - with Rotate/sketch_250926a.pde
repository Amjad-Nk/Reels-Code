import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.fluid.DwFluid2D;
import processing.opengl.PGraphics2D;

DwFluid2D fluid;
PGraphics2D pg_fluid;

float a;

void setup() {
  size(400, 720, P2D);
  noCursor();

  DwPixelFlow context = new DwPixelFlow(this);
  fluid = new DwFluid2D(context, width, height, 0);

  fluid.param.dissipation_velocity = 0.9f; // animated
  fluid.param.dissipation_density  = 0.99f; // opacity

  colorMode(HSB, 255, 255, 255);
  fluid.addCallback_FluiData(new  DwFluid2D.FluidData() {
    public void update(DwFluid2D fluid) {
      a+=0.04;

      noiseDetail(5);
      color c = color((a*5)%20+190, 250, 250);
      float red   = red(c)/255.0;
      float green = green(c)/255.0;
      float blue  = blue(c)/255.0;

      float r = width*0.05;
      float size = 20;

      float px     = width/2+r*cos(a);
      float py     = height/2+r*sin(a);
      float vx     = cos(a)*150;
      float vy     = sin(a)*150;
      fluid.addVelocity(px, py, 14, vx, vy);
      // x , y , r , R , G , B . brightness
      fluid.addDensity (px, py, size, red, green, blue, 0.8); 
      
      px     = width/2+r*cos(a+PI);
      py     = height/2+r*sin(a+PI);
      vx     = cos(a+PI)*150;
      vy     = sin(a+PI)*150;
      fluid.addVelocity(px, py, 14, vx, vy);
      fluid.addDensity (px, py, size, red+0.2, green+0.2, blue+0.2, 0.8);
    }
  }
  );

  pg_fluid = (PGraphics2D) createGraphics(width, height, P2D);
}


public void draw() {
  fluid.update();

  pg_fluid.beginDraw();
  pg_fluid.background(0);
  pg_fluid.endDraw();

  fluid.renderFluidTextures(pg_fluid, 0);

  image(pg_fluid, 0, 0);
}
