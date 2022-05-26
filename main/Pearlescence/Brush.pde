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
  ArrayList<Integer> spread = new ArrayList<Integer>();
  spread.add(X);
  spread.add(Y);
  while (spread.size() > 1) {
    int xcor = spread.remove(spread.size() - 2);
    int ycor = spread.remove(spread.size() - 1);
    if ((xcor > 0 && xcor < 1500) && (ycor > 100 && ycor < 900) && (get(xcor, ycor) == OG)) {
      set(X, Y, spill);
    }
    //up
    if ((xcor > 0 && xcor < 1500) && (ycor - 1 > 100 && ycor - 1 < 900) && (get(xcor, ycor -1) == OG)) {
      spread.add(X);
      spread.add(Y-1);
    } 
    //left
    if ((xcor - 1 > 0 && xcor - 1 < 1500) && (ycor > 100 && ycor < 900) && (get(xcor-1, ycor) == OG)) {
      spread.add(X-1);
      spread.add(Y);
    }
    //right
    if ((xcor + 1 > 0 && xcor + 1 < 1500) && (ycor > 100 && ycor < 900) && (get(xcor+1, ycor) == OG)) {
      spread.add(X+1);
      spread.add(Y);
    } 
    //down
    if ((xcor > 0 && xcor < 1500) && (ycor + 1 > 100 && ycor + 1 < 900) && (get(xcor, ycor +1) == OG)) {
      spread.add(X);
      spread.add(Y+1);
    } 
  }
}
