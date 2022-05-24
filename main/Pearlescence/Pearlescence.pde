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
    // SIZE
    if(key == UP){
      
    } 
    if(key == DOWN){
    } 
    // brushMODE
    if(key == '1'){
    } 
    if(key == '2'){
    } 
    // SAVE AS DRAWING.PNG
    if(key == ENTER){
    } 
    // ?? 
    if(key == DELETE){
    } 
} 
