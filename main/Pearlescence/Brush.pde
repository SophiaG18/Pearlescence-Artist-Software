void Pen() {
  color penColor = color(R, G, B);
  if (Layer == false) {
    stroke(penColor, Transparency); 
    strokeWeight(Size);
    line(mouseX, mouseY, pmouseX, pmouseY); // experimenting with this
  } else {
    newLayer.beginDraw(); 
    newLayer.stroke(penColor, Transparency); 
    newLayer.strokeWeight(Size);
    newLayer.line(mouseX, mouseY, pmouseX, pmouseY); 
    newLayer.endDraw();
  }
}

void Eraser() {
  if (Layer == false) {
    stroke(#FFFFFF, Transparency); 
    strokeWeight(Size);
    line(mouseX, mouseY, pmouseX, pmouseY); 
  } else {
    newLayer.beginDraw(); 
    newLayer.stroke(#FFFFFF, Transparency); 
    newLayer.strokeWeight(Size);
    newLayer.line(mouseX, mouseY, pmouseX, pmouseY); 
    newLayer.endDraw();
  }
}

void Bucket() {
  if (Layer == false) {
    color og = get(mouseX, mouseY);
    color spill = color(R, G, B); 
    if (og != spill) {
      Bucket2(mouseX, mouseY, og, spill);
    }
  } else {
    color og = newLayer.get(mouseX, mouseY); // references the layer 
    color spill = color(R, G, B); 
    if (og != spill) {
      Bucket2(mouseX, mouseY, og, spill);
    }
  }
} 

void Bucket2(int X, int Y, color OG, color spill) {
  int xcor;
  boolean spanup;
  boolean spandown;

  ArrayList<Integer> spread = new ArrayList<Integer>();
  spread.add(X);
  spread.add(Y);
  while (spread.size() > 1) {
    xcor = spread.remove(spread.size() - 2);
    int ycor = spread.remove(spread.size() - 1);
    while (xcor >= 0 && (get(xcor, ycor) == OG)) {
      xcor--;
    }
    xcor ++;
    spanup = false;
    spandown = false;
    while (xcor < width && (get(xcor, ycor) == OG)) {
      set(xcor, ycor, spill);
      if (!spanup && ycor > 155 && (get(xcor, ycor - 1) == OG)) {
        spread.add(xcor);
        spread.add(ycor-1);
        spanup = true;
      } else if (spanup && ycor > 155 && (get(xcor, ycor - 1) != OG)) {
        spanup = false;
      }
      if (!spandown && ycor < height && (get(xcor, ycor +1) == OG)) {
        spread.add(xcor);
        spread.add(ycor+1);
        spandown = true;
      } else if (spandown && ycor < height && (get(xcor, ycor +1) == OG)) {
        spandown = false;
      }
      xcor++;
    }
  }
}

void Airbrush() {
  color penColor = color(R, G, B);
  if (Layer == false) {
    stroke(penColor, Transparency);
    int startx = -Size / 2;
    int endx = Size - (Size/2); //to accomadate odd values for Size
    if (mouseX >= pmouseX) {
      startx += pmouseX;
      endx += mouseX;
    } else {
      startx += mouseX;
      endx += pmouseX;
    }  
    int starty, endy;
    if (mouseY >= pmouseY) {
      starty = pmouseY;
      endy = mouseY;
    } else {
      starty = mouseY;
      endy = pmouseY;
    } 
    float mm = abs(dist(startx, starty, endx, endy));
    while (startx <= endx) {
      for (int yy = starty; yy <= endy; yy++) {
        float chance = abs(dist(startx, starty, (mouseX + pmouseX)/2, (mouseY + pmouseY)/2)) / mm;
        float p = random(1);
        if (p > chance) {
          point(startx, yy);
        }
      }
      startx++;
    }
  }
}

void InkBrush(int x,int y, int x2, int y2) {
  if(Layer == false){
    color penColor = color(R,G,B);
      if ((mouseX >= 0 && mouseX <= 1500) && (mouseY > 100)) {
        //noStroke(); -> this causes issues 
        // speed = squareroot of (square of x-x2) + (square of y-y2) 
        float speed = (sqrt((sq(abs(x-x2)) + sq(abs(y-y2))))) / 10 ; 
        stroke(penColor); 
        strokeWeight(Size + speed);
        line(mouseX, mouseY, pmouseX, pmouseY); 
      }
    }
  else{
    newLayer.beginDraw(); 
    color penColor = color(R,G,B);
      if ((mouseX >= 0 && mouseX <= 1500) && (mouseY > 100)) {
        //noStroke(); -> this causes issues 
        float speed = (sqrt((sq(abs(x-x2)) + sq(abs(y-y2))))) / 10 ; 
        newLayer.stroke(penColor); 
        newLayer.strokeWeight(Size + speed); // sets size as basis and factors in mouse speed
        newLayer.line(mouseX, mouseY, pmouseX, pmouseY); 
      }
    newLayer.endDraw();
  }
}

// circle and rectangle are having issues with filling in on layer 
void Circle() {
  if (coor == null) { 
    Integer[] in = {mouseX, mouseY};
    coor = in;
  } else {
    if (Layer == false) {
      noFill();
      color penColor = color(R, G, B);
      stroke(penColor, Transparency); 
      strokeWeight(Size);
      float dia = abs(dist(coor[0], coor[1], mouseX, mouseY));
      circle((abs((coor[0] + mouseX)/2)), (abs((coor[1] + mouseY)/2)), dia);
      coor = null;
    } else {
      newLayer.beginDraw();
      newLayer.noFill();
      color penColor = color(R, G, B);
      newLayer.stroke(penColor, Transparency); 
      newLayer.strokeWeight(Size);
      float dia = abs(dist(coor[0], coor[1], mouseX, mouseY));
      newLayer.circle((abs((coor[0] + mouseX)/2)), (abs((coor[1] + mouseY)/2)), dia);
      coor = null;
      newLayer.endDraw();
    }
  }
}

void Rectangle() {
  if (coor == null) { 
    Integer[] in = {mouseX, mouseY};
    coor = in;
  } else {
    if (Layer == false) {
      noFill();
      color penColor = color(R, G, B);
      stroke(penColor, Transparency); 
      strokeWeight(Size);
      float w = coor[0] - mouseX;
      float l = coor[1] - mouseY;
      rect(mouseX, mouseY, w, l);
      coor = null;
    } else {
      newLayer.beginDraw(); 
      newLayer.noFill();
      color penColor = color(R, G, B);
      newLayer.stroke(penColor, Transparency); 
      newLayer.strokeWeight(Size);
      float w = coor[0] - mouseX;
      float l = coor[1] - mouseY;
      newLayer.rect(mouseX, mouseY, w, l);
      coor = null;
      newLayer.endDraw();
    }
  }
}
