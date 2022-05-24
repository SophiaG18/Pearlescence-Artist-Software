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
  fill(200);
  rect(0, 0, 1200, 100);
  fill(255);
  rect(0, 100, 1200, 800);
} 

void keyPressed(){
  // RGB VALS
    if(key == 'r'){
      if(R != 255){
        R+= 5; // value subject to change 
      }
      else{
        R = 0; // cycle back to default 
      } 
    } 
    if(key == 'g'){
      if(G != 255){
        G += 5; 
      }
      else{
        G = 0; 
      } 
    }
    if(key == 'b'){
      if(B != 255){
        B += 5; 
      }
      else{
        B = 0; 
      } 
    } 
    // SIZE : defaults at 4 
    if(key == UP){
      if(Size != 4){
        Size += 1; // does not cycle 
      } 
    } 
    if(key == DOWN){
      if(Size != 1){
        Size -= 1;
      }
    } 
    // brushMODE
    if(key == '1'){
      if(brushMode != 1){
        brushMode -= 1; // does not cycle
      } 
    } 
    if(key == '2'){
      if(brushMode != 3){
        brushMode += 1;
      } 
    } 
    // SAVE AS DRAWING.PNG
    if(key == ENTER){
      PImage screenshot; // could change this into an instance variable 
      screenshot = get(); // if no parameters are specified, the entire image is returned. -> have to establish the interface in order to set coordinates
      screenshot.save("drawing.png"); // saves the screen capture to the machine 
    } 
    // ?? - have to clarify this with Sophia && design interface first 
    if(key == DELETE){
      rect(0, 100, 1200, 800);
    } 
} 
