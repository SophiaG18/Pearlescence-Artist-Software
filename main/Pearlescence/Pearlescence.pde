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
  //drawing section
  fill(255);
  rect(0, 100, 1198, 799);
}

void draw(){
  noStroke();
//toolbox section
  fill(200);
  rect(0, 0, 1198, 100);
//text
  fill(0);
  textSize(18);
  text("Red value: " + R + " (Press r to cycle up value)",10,18);
  text("Green value: " + G + " (Press g to cycle up value)",10,36);
  text("Blue value: " + B + " (Press g to cycle up value)",10,54);
  text("Size value: " + Size + " (Press UP arrow to increment or DOWN arrow to decrement)",10,72);

} 

void mouseDragged(){
  Pen();
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
      break;
    case 'g':
      if(G < 255){
        G += 5; 
      }
      else{
        G = 0; 
      } 
      break;
    case 'b':
      if(B <255){
        B += 5; 
      }
      else{
        B = 0; 
      }  
      break;
    // SIZE 
    case CODED:
      if (keyCode == UP){
        Size++;
      }
      if (keyCode == DOWN){
        if(Size != 1){
          Size--;
        }
      } 
      break;
    // brushMODE
    case '1':
      if(brushMode != 1){
        brushMode --; // does not cycle
      } 
      break;
    case '2':
      if(brushMode != 2){ 
        //2 will be increased as more Brush methods are coded
        brushMode ++;
      } 
      break;
    // SAVE AS DRAWING.PNG
    case ENTER:
      PImage screenshot; // could change this into an instance variable 
      screenshot = get(); // if no parameters are specified, the entire image is returned. -> have to establish the interface in order to set coordinates
      screenshot.save("drawing.png"); // saves the screen capture to the machine 
      break;
    // Clear drawing area
    case BACKSPACE:
      fill(255);
      rect(0, 100, 1198, 799);
      break;
  }
} 
