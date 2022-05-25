int R = 0;
int G = 0;
int B = 0;
int Size = 4;
int brushMode = 0;
String[] tools = {"Pen", "Eraser", "Bucket"};
PImage Prev;
PImage Next;
Boolean Filter = false;
int Index = 0;

void setup(){
  size(1500, 900);
  //drawing section
  // noStroke(); -> this is preventing ALL STROKES, but creates an unintended line to be drawn 
  fill(255);
  rect(0, 100, 1500, 800);
}

void draw(){
//toolbox section
 // noStroke(); -> runs into issues
  strokeWeight(1);
  fill(200);
  rect(0, 0, 1500, 100);
//text
  fill(0);
  textSize(15);
  text("R value: " + R + " (Press r to cycle up value)",10,15);
  text("G value: " + G + " (Press g to cycle up value)",10,30);
  text("B value: " + B + " (Press g to cycle up value)",10,45);
  text("Size value: " + Size + " (Press UP arrow to increment or DOWN arrow to decrement)",10,60);
  text("Drawing Tool: " + tools[brushMode], 10,75); 
  text("Filter: " + Filter + " (Press f to turn on/off)", 10,90); 
//color square to be clicked on
  stroke(0);
  square(323, 5, 18); //fill(0) black
  fill(255); //white
  square(323, 28, 18);
  fill(#7F7F7F); //gray 127
  square(346, 5, 18);
  fill(#C3C3C3); //light gray 195
  square(346, 28, 18);
  fill(#880015); //dark red 136 0 21
  square(369, 5, 18);
  fill(#B97A57); //brown 185 122 87
  square(369, 28, 18);
  fill(#ED1C24); //red 237 28 36
  square(392, 5, 18);
  fill(#FFAEC9); //rose 255 174 201
  square(392, 28, 18);
  fill(#FF7F27); //orange 255 127 39
  square(415, 5, 18);
  fill(#FFC90E); //gold 255 201 14
  square(415, 28, 18);
  fill(#FFF200); //yellow 255 242 0
  square(438, 5, 18);
  fill(#EFE4B0); //light yellow 239 228 176
  square(438, 28, 18);
  fill(#22B14C); //green 34 177 76
  square(461, 5, 18);
  fill(#B5E61D); //lime 181 230 29
  square(461, 28, 18);
  fill(#00A2E8); //turquoise 0 162 232
  square(484, 5, 18);
  fill(#99D9EA); //light turquoise 153 217 234
  square(484, 28, 18);
  fill(#3F48CC); //indigo 63 72 204
  square(507, 5, 18);
  fill(#7092BE); //blue-gray 112 146 190
  square(507, 28, 18);
  fill(#A349A4); //purple 163 73 164
  square(530, 5, 18);
  fill(#C8BFE7); //lavender 200 191 231
  square(530, 28, 18);
  // moving "mousepressed" into draw in order to change coordinates via pmouseX and pmouseY 
  if(mousePressed == true){  
    switch (brushMode){
      case 0:
        Pen();
        break;
      case 1:
        Eraser();
        break;
      }
    }
  }
  
  
void mouseClicked(){
  //black
  if (mouseX >= 323 && mouseX <= 341 && mouseY >= 5 && mouseY <= 23){
    R = 0;
    G = 0;
    B = 0;
  }
  //white
  if (mouseX >= 323 && mouseX <= 341 && mouseY >= 28 && mouseY <= 46){
    R = 255;
    G = 255;
    B = 255;
  }
  //gray 127
  if (mouseX >= 346 && mouseX <= 374 && mouseY >= 5 && mouseY <= 23){
    R = 127;
    G = 127;
    B = 127;
  }
  //light gray 195
  if (mouseX >= 346 && mouseX <= 376 && mouseY >= 28 && mouseY <= 46){
    R = 195;
    G = 195;
    B = 195;
  }
  //dark red 136 0 21
  if (mouseX >= 369 && mouseX <= 387 && mouseY >= 5 && mouseY <= 23){
    R = 136;
    G = 0;
    B = 21;
  }
  //brown 185 122 87
  if (mouseX >= 369 && mouseX <= 387 && mouseY >= 28 && mouseY <= 46){
    R = 185;
    G = 122;
    B = 87;
  }
  //red 237 28 36
  if (mouseX >= 392 && mouseX <= 410 && mouseY >= 5 && mouseY <= 23){
    R = 237;
    G = 28;
    B = 36;
  }
  //rose 255 174 201
  if (mouseX >= 392 && mouseX <= 410 && mouseY >= 28 && mouseY <= 46){
    R = 255;
    G = 174;
    B = 201;
  }
  //orange 255 127 39
  if (mouseX >= 415 && mouseX <= 433 && mouseY >= 5 && mouseY <= 23){
    R = 255;
    G = 127;
    B = 39;
  }
  //gold 255 201 14
  if (mouseX >= 415 && mouseX <= 433 && mouseY >= 28 && mouseY <= 46){
    R = 255;
    G = 201;
    B = 14;
  }
  //yellow 255 242 0
  if (mouseX >= 438 && mouseX <= 456 && mouseY >= 5 && mouseY <= 23){
    R = 255;
    G = 242;
    B = 0;
  }
  //light yellow 239 228 176
  if (mouseX >= 438 && mouseX <= 456 && mouseY >= 28 && mouseY <= 46){
    R = 239;
    G = 228;
    B = 176;
  }
  //green 34 177 76
  if (mouseX >= 461 && mouseX <= 479 && mouseY >= 5 && mouseY <= 23){
    R = 34;
    G = 177;
    B = 76;
  }
  //lime 181 230 29
  if (mouseX >= 461 && mouseX <= 479 && mouseY >= 28 && mouseY <= 46){
    R = 181;
    G = 230;
    B = 29;
  }
  //turquoise 0 162 232
  if (mouseX >= 484 && mouseX <= 502 && mouseY >= 5 && mouseY <= 23){
    R = 0;
    G = 162;
    B = 232;
  }
  //light turquoise 153 217 234
  if (mouseX >= 484 && mouseX <= 502 && mouseY >= 28 && mouseY <= 46){
    R = 153;
    G = 217;
    B = 234;
  }
  //indigo 63 72 204
  if (mouseX >= 507 && mouseX <= 525 && mouseY >= 5 && mouseY <= 23){
    R = 63;
    G = 72;
    B = 204;
  }
  //blue-gray 112 146 190
  if (mouseX >= 507 && mouseX <= 525 && mouseY >= 28 && mouseY <= 46){
    R = 112;
    G = 146;
    B = 190;
  }
  //purple 163 73 164
  if (mouseX >= 530 && mouseX <= 548 && mouseY >= 5 && mouseY <= 23){
    R = 163;
    G = 73;
    B = 164;
  }
  //lavender 200 191 231
  if (mouseX >= 530 && mouseX <= 548 && mouseY >= 28 && mouseY <= 46){
    R = 200;
    G = 191;
    B = 231;
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
        brushMode = 2; //# will be increased as more Brush methods are coded
      }
      break;
    case '2':
      if(brushMode < 3){ 
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
      screenshot = get(0,100, 1500, 800); 
      // if no parameters are specified, the entire image is returned. -> have to establish the interface in order to set coordinates
      // with 4 parameters, get saves rect of pixels: x cor, y cor, width of rect, height of rect
      screenshot.save("drawing.png"); // saves the screen capture to the machine 
      break;
    // Clear drawing area
    case BACKSPACE:
      noStroke();
      fill(255);
      rect(0, 100, 1500, 800);
      break;
    case 'f':
      Filter = !(Filter);
      break;
  }
} 
