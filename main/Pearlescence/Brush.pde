 void Pen(){
    fillColor = color(R, G, B);
    if((mouseX > 0 && mouseX <= 1200) && (mouseY > 100 && mouseY <= 900)){
      noStroke();
      fill(fillColor); 
      line(mouseX, mouseY, pmouseX, pmouseX); // experimenting with this 
    } 
  }
  
    void Eraser(){
    //color eraserOutput = #FFFFFF; 
    if((mouseX > 0 && mouseX <= 1200) && (mouseY > 100 && mouseY <= 900)){
      noStroke();
      fill(255);
      line(mouseX, mouseY, pmouseX, pmouseX); // experimenting with this 
    } 
  }
