void Pen() {
  if(Layer == false){
    color penColor = color(R, G, B);
      if ((mouseX >= 0 && mouseX <= 1500) && (mouseY > 155)) {
        //noStroke(); -> this causes issues 
        stroke(penColor); 
        strokeWeight(Size);
        line(mouseX, mouseY, pmouseX, pmouseY); // experimenting with this
      }
    }
  else{
    newLayer.beginDraw(); 
    color penColor = color(#FF0000);
      if ((mouseX >= 0 && mouseX <= 1500) && (mouseY > 155)) {
        //noStroke(); -> this causes issues 
        newLayer.stroke(penColor); 
        newLayer.strokeWeight(Size);
        newLayer.line(mouseX, mouseY, pmouseX, pmouseY); // experimenting with this 
      }
    newLayer.endDraw();
  }
}

void Eraser() {
  if(Layer == false){
      if ((mouseX >= 0 && mouseX <= 1500) && (mouseY > 155)) {
        //noStroke(); -> this causes issues 
        stroke(#FFFFFF); 
        strokeWeight(Size);
        line(mouseX, mouseY, pmouseX, pmouseY); // experimenting with this
      }
    }
  else{
    newLayer.beginDraw(); 
      if ((mouseX >= 0 && mouseX <= 1500) && (mouseY > 155)) {
        //noStroke(); -> this causes issues 
        newLayer.stroke(#FFFFFF); 
        newLayer.strokeWeight(Size);
        newLayer.line(mouseX, mouseY, pmouseX, pmouseY); // experimenting with this 
      }
    newLayer.endDraw();
  }
}

void Bucket() {
  if(Layer == false){
    color og = get(mouseX, mouseY);
    color spill = color(R, G, B); 
    if (og != spill) {
      Bucket2(mouseX, mouseY, og, spill);
    }
  }
  else{
    color og = newLayer.get(mouseX, mouseY); // references the layer 
    color spill = color(R,G,B); 
    if(og != spill){
      Bucket2(mouseX, mouseY, og,spill); 
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

void Marker(){
}

void Inkbrush(){
}

void Circle(){
  /*
  noFill();
  color penColor = color(R, G, B);
  float x1 = mouseX;
  float y1 = mouseY;
  if(mousePressed == true){ 
    float dia = abs(dist(x1, y1, mouseX, mouseY));
    circle((abs((x1 + mouseX)/2)), (abs((y1 + mouseY)/2)), dia);
  }
  */
}
