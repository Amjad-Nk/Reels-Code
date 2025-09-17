class wave {

  float angle;
  int SIZE_OF_FOG = 10; // change it
  
  wave(float Angle) {
    angle = Angle;
  }

  void draw() {

    stroke(200,10+t);
    
    push();
    rotate(angle*TWO_PI/(MAX_POINT+0.0));

    for(int i=0; i<SIZE_OF_FOG;i++){
      noiseDetail(2);
      float n1 = r+700*(noise(t, 1)-0.5)+10*(random(1)-0.5);
      float n2 = r+700*(noise(t, 2)-0.5)+10*(random(1)-0.5);
      float n3 = r+700*(noise(t-0.005, 1)-0.5)+10*(random(1)-0.5);
      float n4 = r+700*(noise(t-0.005, 2)-0.5)+10*(random(1)-0.5);
      line(n1,n2,n3,n4);
    }
    
    pop();
  }
}
