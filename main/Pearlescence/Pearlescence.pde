int R;
int G;
int B;
int Size;
int brushMode;

void setup(){
  size(1200, 900);
  R = 0;
  G = 0;
  B = 0;
  Size = 4;
  brushMode = 1;
}

void draw(){
//toolbox section
  fill(200);
  rect(0, 0, 1198, 100);
//drawing section
  fill(255);
  rect(0, 100, 1198, 799);
} 

void keyPressed(){
  switch (key){
  // RGB VALS
    case 'r':
      if(R < 255){
        R+= 5; // value subject to change 
      }
      else{
        R = 0; // cycle back to default 
      } 
    case 'g':
      if(G < 255){
        G += 5; 
      }
      else{
        G = 0; 
      } 
    case 'b':
      if(B <255){
        B += 5; 
      }
      else{
        B = 0; 
      }  
    // SIZE 
    case UP:
      Size ++;
    case DOWN:
      if(Size != 1){
        Size --;
      } 
    // brushMODE
    case '1':
      if(brushMode != 1){
        brushMode --; // does not cycle
      } 
    case '2':
      if(brushMode != 2){ 
        //2 will be increased as more Brush methods are coded
        brushMode ++;
      } 
    // SAVE AS DRAWING.PNG
    case ENTER:
      PImage screenshot; // could change this into an instance variable 
      screenshot = get(); // if no parameters are specified, the entire image is returned. -> have to establish the interface in order to set coordinates
      screenshot.save("drawing.png"); // saves the screen capture to the machine 
    // Clear drawing area
    case DELETE:
      fill(255);
      rect(0, 100, 1198, 799);
  }
} 
