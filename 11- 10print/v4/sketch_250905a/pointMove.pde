class pointMove{

  int x , y , z;
  int dir;
  color c;
  int brightness; 
  
  int arr[][] = {{1,-1} , {-1,-1},{-1,1},{1,1}};
  
  pointMove(){
    update();
    brightness = int(random(50 , 250));
    c = color(100 , 255 , brightness);
  }
  
  void draw(){

    stroke(c);
    point(x , y , z);
    move();
  }
  
  void move(){
    
    boolean keepDir = check(arr[dir][0] , arr[dir][1]);
    if(keepDir){
        x = x+arr[dir][0];
        y = y+arr[dir][1];
    }
    else{
      if(dir%2 == 0){
        if(check(-1 , -1))
          dir = 1;
        else if(check(1 , 1))
          dir = 3;
        else
          update();
      }
      else{
        if(check(1 , -1))
          dir = 0;
        else if(check(-1 , 1))
          dir = 2;      
        else
          update();
      } 
    }

  }
  
  boolean check(int xd , int yd){
    return(img.get(x+xd,y+yd) == color(255 ,255 ,255));
  }
  
  void update(){
    boolean flag = false;
    while(!flag){
      x = int(random(0 , width));
      y = int(random(0 , height));
      
      flag = (img.get(x,y) == color(255 , 255 , 255));
    }
    dir = floor(random(0,4));
  }
}
