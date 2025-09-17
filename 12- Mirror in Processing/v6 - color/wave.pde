class wave {

  float angle;
  float SIZE_OF_LINE = 29; // chaneg it

  wave(float Angle) {
    angle = Angle;
  }

  void draw() {

    stroke(t*30,200,200,30);
    
    push();
    rotate(angle*TWO_PI/(MAX_POINT+0.0));

    for(int i=0; i<SIZE_OF_LINE;i++){
      float n1 = r/2+700*(noise(t, 1)-0.5)+10*(random(1)-0.5);
      float n2 = r/2+700*(noise(t, 2)-0.5)+10*(random(1)-0.5);
      float n3 = r/2+700*(noise(t-0.005, 1)-0.5)+10*(random(1)-0.5);
      float n4 = r/2+700*(noise(t-0.005, 2)-0.5)+10*(random(1)-0.5);
      line(n1,n2,n3,n4);
    }
    
    pop();
  }
}
