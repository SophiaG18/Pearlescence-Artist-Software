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
    newLayer.line(mouseX, mouseY, pmouseX, pmouseY); // experimenting with this
    newLayer.endDraw();
  }
}

void Eraser() {
  if (Layer == false) {
    stroke(#FFFFFF, Transparency); 
    strokeWeight(Size);
    line(mouseX, mouseY, pmouseX, pmouseY); // experimenting with this
  } else {
    newLayer.beginDraw(); 
    newLayer.stroke(#FFFFFF, Transparency); 
    newLayer.strokeWeight(Size);
    newLayer.line(mouseX, mouseY, pmouseX, pmouseY); // experimenting with this 
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

// have to update all of these to work on layer 
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

void Marker() {
}

void Inkbrush() {
}

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
      color penColor = color(#FF0000);
      newLayer.stroke(penColor, Transparency); 
      newLayer.strokeWeight(Size);
      float dia = abs(dist(coor[0], coor[1], mouseX, mouseY));
      circle((abs((coor[0] + mouseX)/2)), (abs((coor[1] + mouseY)/2)), dia);
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
      color penColor = color(#FF0000);
      newLayer.stroke(penColor, Transparency); 
      newLayer.strokeWeight(Size);
      float w = coor[0] - mouseX;
      float l = coor[1] - mouseY;
      rect(mouseX, mouseY, w, l);
      coor = null;
      newLayer.endDraw();
    }
  }
}
