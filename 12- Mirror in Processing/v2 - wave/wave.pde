class wave {

  float angle;

  wave(float Angle) {
    angle = Angle;
  }

  void draw() {
    stroke(200,50+t*10);
    
    push();
    rotate(angle*TWO_PI/(MAX_POINT+0.0));

    for(int i=0; i<2;i++){
      noiseSeed(seed[i]);
      noiseDetail(2);
      float n1 = r/2+700*(noise(t, 1)-0.5);
      float n2 = r/2+700*(noise(t, 2)-0.5);
      float n3 = r/2+700*(noise(t-step, 1)-0.5);
      float n4 = r/2+700*(noise(t-step, 2)-0.5);
      line(n1,n2,n3,n4);
    }
    
    pop();
  }
}
