void Pen() {
  color penColor = color(R, G, B);
  if ((mouseX >= 0 && mouseX <= 1500) && (mouseY > 100)) {
    //noStroke(); -> this causes issues 
    stroke(penColor); 
    strokeWeight(Size);
    line(mouseX, mouseY, pmouseX, pmouseY); // experimenting with this
  }
}

void Eraser() {
  if ((mouseX >= 0 && mouseX <= 1500) && (mouseY > 100)) {
    //noStroke(); -> this causes issues
    stroke(255);
    strokeWeight(Size);
    line(mouseX, mouseY, pmouseX, pmouseY); // experimenting with this
  }
}

void Bucket() {
  // implied that mousePressed is TRUE 
  color og = get(mouseX, mouseY);
  color spill = color(R, G, B); 
  if (og != spill) {
    Bucket2(mouseX, mouseY, og, spill);
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
      if (!spanup && ycor > 100 && (get(xcor, ycor - 1) == OG)) {
        spread.add(xcor);
        spread.add(ycor-1);
        spanup = true;
      } else if (spanup && ycor > 100 && (get(xcor, ycor - 1) != OG)) {
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
