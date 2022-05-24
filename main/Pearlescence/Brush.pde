void Pen(){
  color penColor = color(R, G, B);
  if((mouseX > 0 && mouseX <= 1200) && (mouseY > 100 && mouseY <= 800)){
    fill(penColor); 
    circle(mouseX, mouseY, Size); 
  } 
}

void Eraser(){
  color eraserOutput = #FFFFFF; 
  if((mouseX > 0 && mouseX <= 1200) && (mouseY > 100 && mouseY <= 800)){
    fill(225); 
    circle(mouseX, mouseY, Size); 
  } 
}
