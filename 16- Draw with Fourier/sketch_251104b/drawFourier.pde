class drawFourier {
  
  ArrayList<PVector> path = new ArrayList<PVector>();
  ArrayList<PVector> drawing = new ArrayList<PVector>();
  ArrayList<FourierPoint> fourier;
  
  float time = 0 ;
  long start;
  float speed;
  
  drawFourier(String p, float amp, float Speed) {
    String[] st = loadStrings(p);

    for (String s : st) {
      String[] data = s.split(",");
      float x = float(data[0])*amp;
      float y = float(data[1])*amp;
      path.add(new PVector(x, y));
    }

    fourier = dft(path);
    speed = Speed;
  }

  void draw() {
    PVector v = epicycles(width/2, height/2, 0, fourier);

    if (millis() - start > 10) {
      drawing.add(0, v);
      start = millis();
    }
    float dt = TWO_PI / fourier.size();
    time += (dt*speed);

    if (time > TWO_PI) {
      time = 0;
      //drawing = new ArrayList<PVector>();
    }
  }

  PVector epicycles(float x, float y, float rotation, ArrayList<FourierPoint> fourier) {
    PVector current = new PVector(x, y);

    for (int i = 0; i < fourier.size(); i++) {
      FourierPoint fp = fourier.get(i);

      PVector prev = current.copy();

      float freq = fp.freq;
      float radius = fp.amp;
      float phase = fp.phase;

      current.x += radius * cos(freq * time + phase + rotation);
      current.y += radius * sin(freq * time + phase + rotation);

      stroke(#2245AA, 50);
      noFill();
      circle(prev.x, prev.y, radius * 2);

      stroke(255, 100);
      line(prev.x, prev.y, current.x, current.y);
    }

    return current;
  }

  void drawPath() {
    stroke(120, 200, 255);
    strokeWeight(3);
    noFill();
    
    beginShape();
    for (int i = 0; i < drawing.size(); i++) 
      vertex(drawing.get(i).x, drawing.get(i).y);    
    endShape();
    
    strokeWeight(2);
  }

}
