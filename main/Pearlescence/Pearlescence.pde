int R = 0;
int G = 0;
int B = 0;
int Size = 4;
int brushMode = 0;
String[] tools = {"Pen", "Eraser", "Bucket", "Circle", "Rectangle", "InkBrush"};
PixList reundo; 
PImage currentCanvas; // saving the screen as a means to prevent constant updating with layer clear 
Boolean Filter = false;
int Index = 0;
String [] Names = {"Identity", "Blur", "Sharpen", "Outline", "Left Sobel", "Right Sobel", "Top Sobel", "Emboss"};
int Transparency = 255;
boolean Layer = false; 
boolean Weight = false; 
PGraphics newLayer; // right now testing only one later - will update to multiple layers when the code works...
Integer[] coor;
boolean cleared; 

void setup() {
  size(1500, 900);
  //drawing section
  fill(255);
  rect(0, 175, 1500, 800);
  reundo = new PixList();
  // LAYER section -> instantiate 
  newLayer = createGraphics(1500, 900); // just creating the layer with the size of the entire program (will update when coordinates are edited)
  currentCanvas = get(0,175,1500,800); 
}

void draw() {
  //toolbox section
  strokeWeight(1);
  fill(200);
  rect(0, 0, 1500, 175);
  //text
  fill(0);
  textSize(15);
  text("R value: " + R + " (Press r to cycle up value)", 1205, 25);
  text("G value: " + G + " (Press g to cycle up value)", 1205, 40);
  text("B value: " + B + " (Press g to cycle up value)", 1205, 55);
  text("Press DELETE to clear the screen", 1205, 130);
  text("Press ENTER to take a screenshot", 1205, 85);
  text("Press LEFT to undo a stroke", 1205, 100); 
  text("Press RIGHT to redo a stroke", 1205, 115); 
  text("Size value: " + Size, 600, 25);
  text("Drawing Tool: " + tools[brushMode], 600, 40); 
  text("Filter: " + Filter, 600, 55);
  text("Filter mode: " + Names[Index], 600, 70); // either keep or combine with filter text
  text("Transparency: " + Transparency, 600, 85);
  text("Weight: " + Weight, 600, 115); 
  text("Layer: " + Layer, 600, 130);
  //color square to be clicked on
  stroke(0);
  square(950, 15, 18); //fill(0) black
  fill(255); //white
  square(950, 38, 18);
  fill(#7F7F7F); //gray 127
  square(973, 15, 18);
  fill(#C3C3C3); //light gray 195
  square(973, 38, 18);
  fill(#880015); //dark red 136 0 21
  square(996, 15, 18);
  fill(#B97A57); //brown 185 122 87
  square(996, 38, 18);
  fill(#ED1C24); //red 237 28 36
  square(1019, 15, 18);
  fill(#FFAEC9); //rose 255 174 201
  square(1019, 38, 18);
  fill(#FF7F27); //orange 255 127 39
  square(1042, 15, 18);
  fill(#FFC90E); //gold 255 201 14
  square(1042, 38, 18);
  fill(#FFF200); //yellow 255 242 0
  square(1065, 15, 18);
  fill(#EFE4B0); //light yellow 239 228 176
  square(1065, 38, 18);
  fill(#22B14C); //green 34 177 76
  square(1088, 15, 18);
  fill(#B5E61D); //lime 181 230 29
  square(1088, 38, 18);
  fill(#00A2E8); //turquoise 0 162 232
  square(1111, 15, 18);
  fill(#99D9EA); //light turquoise 153 217 234
  square(1111, 38, 18);
  fill(#3F48CC); //indigo 63 72 204
  square(1134, 15, 18);
  fill(#7092BE); //blue-gray 112 146 190
  square(1134, 38, 18);
  fill(#A349A4); //purple 163 73 164
  square(1157, 15, 18);
  fill(#C8BFE7); //lavender 200 191 231
  square(1157, 38, 18);
  // written instructions for keypress commands 
  fill(0);
  textSize(15);
   
  
  text("Press 1 or 2 to cycle through brushes", 30, 25); 
  text("Press 3 to decrement Transparency", 30, 40); 
  text("Press 4 to increment Transparency", 30, 55);
  text("Press 5 or 6 to cycle through filters", 30, 70);
  text("Click on a color to select it", 964, 75);
  text("Press w to turn Weight on and off", 30, 85); 
  text("Press l to turn layer on or off", 30, 100);
  text("Press f to turn filter on or off", 30, 115); 
  text("Press UP to increment size", 30, 130); 
  text("Press DOWN to decrement size", 30, 145);  
  // moving "mousepressed" into draw in order to change coordinates via pmouseX and pmouseY 
  if (mousePressed && (mouseX >= 0 && mouseX <= 1500) && (mouseY > 175)) { 
    switch (brushMode) {
    case 0: 
      Pen(); 
      break;
    case 1:
      Eraser(); 
      break;
    case 2: // have to update these 
      if (!Layer) {
        Bucket();
      } else {
        Bucket(); 
        image(newLayer, 0, 0);
      }
      break;
     case 5: 
       InkBrush(mouseX, mouseY, pmouseX, pmouseY); 
       break;
    }
  }
  // code for clearing the layer (inputting into draw) 
  if(keyPressed == true && Layer == true){
    if(key == BACKSPACE){
      background(#FFFFFF);
      clearLayer(newLayer); 
    }
    image(currentCanvas, 0, 175); 
  }
   image(newLayer, 0,0);    
}

void mouseReleased() {
  if (coor == null) {
    reundo.drew(new Pix());
  }
  if(Layer == false){ // update the canvas save
    currentCanvas = get(0,175,1500,800);
  }
}

void clearLayer(PGraphics layer){
  layer.beginDraw(); 
  layer.clear(); 
  layer.endDraw(); 
} 

void mouseClicked() {
  if ((mouseX >= 0 && mouseX <= 1500) && (mouseY > 175)) { 
    switch (brushMode) {
    case 3:
      if (!Layer) {
        Circle();
      } else {
        Circle();
        image(newLayer, 0, 0);
      }
      break;
    case 4:
      if (!Layer) {
        Rectangle();
      } else {
        Rectangle();
        image(newLayer, 0, 0);
      }
      break;
    }
  }
  //black
  if (mouseX >= 950 && mouseX <= 968 && mouseY >= 15 && mouseY <= 33) {
    R = 0;
    G = 0;
    B = 0;
  }
  //white
  if (mouseX >= 950 && mouseX <= 968 && mouseY >= 38 && mouseY <= 53) {
    R = 255;
    G = 255;
    B = 255;
  }
  //gray 127
  if (mouseX >= 973 && mouseX <= 991 && mouseY >= 15 && mouseY <= 33) {
    R = 127;
    G = 127;
    B = 127;
  }
  //light gray 195
  if (mouseX >= 973 && mouseX <= 991 && mouseY >= 38 && mouseY <= 53) {
    R = 195;
    G = 195;
    B = 195;
  }
  //dark red 136 0 21
  if (mouseX >= 996 && mouseX <= 1014 && mouseY >= 15 && mouseY <= 33) {
    R = 136;
    G = 0;
    B = 21;
  }
  //brown 185 122 87
  if (mouseX >= 996 && mouseX <= 1014 && mouseY >= 38 && mouseY <= 53) {
    R = 185;
    G = 122;
    B = 87;
  }
  //red 237 28 36
  if (mouseX >= 1019 && mouseX <= 1037 && mouseY >= 15 && mouseY <= 33) {
    R = 237;
    G = 28;
    B = 36;
  }
  //rose 255 174 201
  if (mouseX >= 1019 && mouseX <= 1037 && mouseY >= 38 && mouseY <= 53) {
    R = 255;
    G = 174;
    B = 201;
  }
  //orange 255 127 39
  if (mouseX >= 1042 && mouseX <= 1060 && mouseY >= 15 && mouseY <= 33) {
    R = 255;
    G = 127;
    B = 39;
  }
  //gold 255 201 14
  if (mouseX >= 1042 && mouseX <= 1060 && mouseY >= 38 && mouseY <= 53) {
    R = 255;
    G = 201;
    B = 14;
  }
  //yellow 255 242 0
  if (mouseX >= 1065 && mouseX <= 1083 && mouseY >= 15 && mouseY <= 33) {
    R = 255;
    G = 242;
    B = 0;
  }
  //light yellow 239 228 176
  if (mouseX >= 1065 && mouseX <= 1083 && mouseY >= 38 && mouseY <= 53) {
    R = 239;
    G = 228;
    B = 176;
  }
  //green 34 177 76
  if (mouseX >= 1088 && mouseX <= 1106 && mouseY >= 15 && mouseY <= 33) {
    R = 34;
    G = 177;
    B = 76;
  }
  //lime 181 230 29
  if (mouseX >= 1088 && mouseX <= 1106 && mouseY >= 38 && mouseY <= 53) {
    R = 181;
    G = 230;
    B = 29;
  }
  //turquoise 0 162 232
  if (mouseX >= 1111 && mouseX <= 1129 && mouseY >= 15 && mouseY <= 33) {
    R = 0;
    G = 162;
    B = 232;
  }
  //light turquoise 153 217 234
  if (mouseX >= 1111 && mouseX <= 1129 && mouseY >= 38 && mouseY <= 53) {
    R = 153;
    G = 217;
    B = 234;
  }
  //indigo 63 72 204
  if (mouseX >= 1134 && mouseX <= 1152 && mouseY >= 15 && mouseY <= 33) {
    R = 63;
    G = 72;
    B = 204;
  }
  //blue-gray 112 146 190
  if (mouseX >= 1134 && mouseX <= 1152 && mouseY >= 38 && mouseY <= 53) {
    R = 112;
    G = 146;
    B = 190;
  }
  //purple 163 73 164
  if (mouseX >= 1157 && mouseX <= 1175 && mouseY >= 15 && mouseY <= 33) {
    R = 163;
    G = 73;
    B = 164;
  }
  //lavender 200 191 231
  if (mouseX >= 1157 && mouseX <= 1175 && mouseY >= 38 && mouseY <= 53) {
    R = 200;
    G = 191;
    B = 231;
  }
}

void keyPressed() {
  switch (key) {
    // RGB VALS
  case 'r':
    if (R < 255) {
      R+= 5; // value subject to change
    } else {
      R = 0; // cycle back to default
    } 
    break;
  case 'g':
    if (G < 255) {
      G += 5;
    } else {
      G = 0;
    } 
    break;
  case 'b':
    if (B <255) {
      B += 5;
    } else {
      B = 0;
    }  
    break;
    // SIZE 
  case CODED:
    if (keyCode == UP) {
      Size++;
    }
    if (keyCode == DOWN) {
      if (Size != 1) {
        Size--;
      }
    } 
    if (keyCode == LEFT) {
      reundo.undo();
    }
    if (keyCode == RIGHT) {
      reundo.redo();
    }
    break;
    // brushMODE
  case '1':
    if (brushMode > 0) {
      brushMode --;
    } else {
      brushMode = 5; //# will be increased as more Brush methods are coded
    }
    break;
  case '2':
    if (brushMode < 5) { 
      //# will be increased as more Brush methods are coded
      brushMode ++;
    } else {
      brushMode = 0;
    }
    break;
    // SAVE AS DRAWING.PNG
  case ENTER:
    PImage screenshot; // could change this into an instance variable 
    screenshot = get(0, 175, 1500, 800); 
    // if no parameters are specified, the entire image is returned. -> have to establish the interface in order to set coordinates
    // with 4 parameters, get saves rect of pixels: x cor, y cor, width of rect, height of rect
    screenshot.save("drawing.png"); // saves the screen capture to the machine 
    break;
    // Clear drawing area
  case BACKSPACE:
    if (Layer == false) {
      noStroke();
      fill(255);
      rect(0, 175, 1500, 800);
      image(newLayer, 0, 0);
      reundo.drew(new Pix());
      cleared = true; 
      //currentCanvas = get(0,175,1500,800); 
    }
    break;
    //Kernel stuff
  case 'f':
    Filter = !(Filter);
    if (Filter) {
      image(apply(), 0, 175);
      reundo.drew(new Pix());
    }
    break;
  case '5':
    if (Index == 0) {
      Index = 7;
    } else {
      Index --;
    }
    break;
  case '6': 
    if (Index == 7) {
      Index = 0;
    } else {
      Index ++;
    }
    break;
  case 'w': 
    if (Weight == false) {
      Weight = true;
    } else {
      Weight = false;
    } 
    break;
  case '3': 
    if (Transparency > 0) {
      Transparency -= 5;
    }
    break;
  case '4': 
    if (Transparency < 255) {
      Transparency += 5;
    } 
    break;
  case 'l': 
    if (Layer == false) {
      Layer = true;
    } else {
      Layer = false;
    }
    break;
  }
} 
