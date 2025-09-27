import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.fluid.DwFluid2D;
import processing.opengl.PGraphics2D;

DwFluid2D fluid;
PGraphics2D pg_fluid;

float velocity = 0.20;
float opacity  = 0.99;
float size = 10;

void setup() {
  size(400, 720, P2D);

  noCursor();
  DwPixelFlow context = new DwPixelFlow(this);
  fluid = new DwFluid2D(context, width, height, 0);

  fluid.param.dissipation_velocity = velocity;
  fluid.param.dissipation_density  = opacity;

  fluid.addCallback_FluiData(new  DwFluid2D.FluidData() {
    public void update(DwFluid2D fluid) {
      if (mousePressed) {
        float px     = mouseX;
        float py     = height-mouseY;
        float vx     = (mouseX - pmouseX) * +15;
        float vy     = (mouseY - pmouseY) * -15;
        fluid.addVelocity(px, py, 14, vx, vy);
        // x , y , r , R , G , B , brightness
        fluid.addDensity (px, py, size, 1, 1, 1, 1); 
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
