class wave {

  float angle , rot;
  float mxPoint = 5; // test 5 & 10 & 20
  
  wave(float Angle) {
    angle = Angle; 
  }

  void draw() {
    stroke(200,50+t);
    
    push();
    rotate(angle*TWO_PI/(MAX_POINT+0.0));

    rot+=0.1;
    for(int i=0; i<mxPoint;i++){
      noiseDetail(2);
      float n1 = r/4+500*(noise(t, 1)-0.5)+10*cos(i*TWO_PI/mxPoint+rot);
      float n2 = r/4+500*(noise(t, 2)-0.5)+10*sin(i*TWO_PI/mxPoint+rot);
      float n3 = r/4+500*(noise(t-step, 1)-0.5)+10*cos(i*TWO_PI/mxPoint+rot);
      float n4 = r/4+500*(noise(t-step, 2)-0.5)+10*sin(i*TWO_PI/mxPoint+rot);
      line(n1,n2,n3,n4);
    }
    
    pop();
  }
}
