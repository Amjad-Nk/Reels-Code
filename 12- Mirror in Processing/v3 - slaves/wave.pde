class wave {

  float angle;
  wave(float Angle) {
    angle = Angle; 
  }

  void draw() {
    stroke(200,50+t);
    
    push();
    rotate(angle*TWO_PI/(MAX_POINT+0.0));

    for(int i=0; i<5;i++){
      noiseDetail(2);
      float n1 = r/4+500*(noise(t, 1)-0.5)+10*cos(i*TWO_PI/5.0);
      float n2 = r/4+500*(noise(t, 2)-0.5)+10*sin(i*TWO_PI/5.0);
      float n3 = r/4+500*(noise(t-step, 1)-0.5)+10*cos(i*TWO_PI/5.0);
      float n4 = r/4+500*(noise(t-step, 2)-0.5)+10*sin(i*TWO_PI/5.0);
      line(n1,n2,n3,n4);
    }
    
    pop();
  }
}
