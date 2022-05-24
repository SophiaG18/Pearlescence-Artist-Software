int R = 0;
int G = 0;
int B = 0;
int Size = 4;
int brushMode = 0;
String[] tools = {"Pen", "Eraser"};

void setup(){
  size(1500, 900);
  //drawing section
  noStroke();
  fill(255);
  rect(0, 100, 1500, 800);
}

void draw(){
//toolbox section
  fill(200);
  rect(0, 0, 1500, 100);
//text
  fill(0);
  textSize(15);
  text("Red value: " + R + " (Press r to cycle up value)",10,15);
  text("Green value: " + G + " (Press g to cycle up value)",460,15);
  text("Blue value: " + B + " (Press g to cycle up value)",910,15);
  text("Size value: " + Size + " (Press UP arrow to increment or DOWN arrow to decrement)",10,30);
  text("Drawing Tool: " + tools[brushMode], 10,45); 
} 

void mousePressed(){
  switch (brushMode){
    case 0:
      Pen();
      break;
    case 1:
      Eraser();
      break;
  }
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
      if(brushMode > 0){
        brushMode --;
      } 
      else{
        brushMode = 1; //# will be increased as more Brush methods are coded
      }
      break;
    case '2':
      if(brushMode < 1){ 
        //# will be increased as more Brush methods are coded
        brushMode ++;
      } 
      else{
        brushMode = 0;
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
