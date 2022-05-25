 void Pen(){
    color penColor = color(R, G, B);
    if((mouseX >= 0 && mouseX <= 1500) && (mouseY > 100)){
      //noStroke(); -> this causes issues 
      stroke(penColor); 
      line(mouseX, mouseY, pmouseX, pmouseY); // experimenting with this 
    } 
  }
  
    void Eraser(){
    if((mouseX >= 0 && mouseX <= 1500) && (mouseY > 100)){
      //noStroke(); -> this causes issues
      stroke(255);
      line(mouseX, mouseY, pmouseX, pmouseY); // experimenting with this 
    } 
  }
