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
      color og = get(mouseX, mouseY);
      Bucket2(mouseX, mouseY, og); 
    } 
    
    void Bucket2( int X, int Y, color OG){
      color bucketFill = color(R,G,B); 
      for(int i = 0; i < 1500; i++){
        for(int j = 100; j < 900; j++){
          int x = i; 
          int y = j; 
        }     
      } 
   }
