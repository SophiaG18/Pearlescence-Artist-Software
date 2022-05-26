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
  Bucket2(mouseX, mouseY, og, spill);
} 

void Bucket2( int X, int Y, color OG, color spill) {
  if (OG == get(X, Y)){
    set(X,Y, spill);
    Bucket2(X - 1, Y - 1, OG, spill); //nw
    Bucket2(X - 1, Y, OG, spill); //w
    Bucket2(X - 1, Y + 1, OG, spill); //sw
    Bucket2(X, Y - 1, OG, spill); //n
    Bucket2(X, Y + 1, OG, spill); //s
    Bucket2(X + 1, Y - 1, OG, spill); //ne
    Bucket2(X + 1, Y, OG, spill); //e
    Bucket2(X + 1, Y + 1, OG, spill); //se
  }
}
