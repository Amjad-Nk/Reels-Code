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
  fluid.param.dissipation_density  = 0.95f; // opacity

  colorMode(HSB, 255, 255, 255);
  fluid.addCallback_FluiData(new  DwFluid2D.FluidData() {
    public void update(DwFluid2D fluid) {

      a+=0.1;
      noiseDetail(5);
      for (int i=0; i<4; i++) {
        color c = color(a%20+60*i, 200, 200);
        float red   = red(c)/255.0;
        float green = green(c)/255.0;
        float blue  = blue(c)/255.0;

        float px     = width/4+width*0.5*(i%2);
        float py     = height*0.3+height*0.4*(i/2);
        float vx     = map(noise(a, i*2), 0, 1, -1, 1)*150;
        float vy     = map(noise(a, i*2+1), 0, 1, 1, -1)*150;
        fluid.addVelocity(px, py, 14, vx, vy);
        fluid.addDensity (px, py, 20, red, green, blue, 1); // x , y , r , R , G , B . brightness
        fluid.addDensity (px, py, 8, 1.0f, 0.3f, 0.5f, 1);
      }
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
