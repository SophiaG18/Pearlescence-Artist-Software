 void Pen(){
    color penColor = color(R, G, B);
    if((mouseX >= 0 && mouseX <= 1500) && (mouseY > 100)){
      //noStroke(); -> this causes issues 
      stroke(penColor); 
      strokeWeight(Size);
      line(mouseX, mouseY, pmouseX, pmouseY); // experimenting with this 
    } 
  }
  
    void Eraser(){
    if((mouseX >= 0 && mouseX <= 1500) && (mouseY > 100)){
      //noStroke(); -> this causes issues
      stroke(255);
      strokeWeight(Size);
      line(mouseX, mouseY, pmouseX, pmouseY); // experimenting with this 
    }
   }
    
    void Bucket(){
      // implied that mousePressed is TRUE
      int xCoordinate = mouseX; 
      int yCoordinate = mouseY; 
      Bucket2(PImage img, xCoordinate, yCoordinate); // save the current screen(?) 
    } 
    
    void Bucket2(PImage img, int xCoord, int yCoord){
      // finding and setting color to fill with 
      color match = img.get(xCoord, yCoord); 
      color bucketFill = color(red(match), green(match), blue(match)); 
      for(int i = 0; i < 1500; i++){
        for(int j = 100; j < 900; j++){
          int x = i; 
          int y = j; 
        }     
      } 
   }
