public class PixList {
  ArrayList<PImage> Prev, Next;
  ArrayList<Boolean> PP, NN; //to determine if on layers or not
  int current;

  public PixList() {
    Prev = new ArrayList<PImage>();
    PImage start = get(0, 175, 1500, 800);
    Prev.add(start);
    PP = new ArrayList<Boolean>();
    PP.add(false);
    Next = new ArrayList<PImage>();
    NN = new ArrayList<Boolean>();
    current = 0;
  }

  void drew(boolean LL) { //LL for PP and NN
    current++;
    Next = new ArrayList<PImage>();
    if (!LL) { //Layers turned off
      PImage rn = get(0, 175, 1500, 800);
      Prev.add(rn);
    } else {
      newLayer.beginDraw();
      PImage copy = newLayer.copy();
      newLayer.endDraw();
      Prev.add(copy);
    }
    PP.add(LL);
  }

  PImage undo() {
    Next.add(Prev.remove(current));
    NN.add(PP.remove(current));
    current --;
    return Prev.get(current); 
    //in Pearlescence, use PP.get(current) after getting the image
  }
  
  PImage redo(){
    //make sure to test if Next has anything inside before calling
    Prev.add(Next.remove(Next.size() - 1)); //first image in arraylist
    PP.add(NN.remove(NN.size() - 1));
    current ++;
    return Prev.get(current); 
    //in Pearlescence, use PP.get(current) after getting the image
  }
}
  /* add to undo & redo  in Pearlescence 
   background(#FFFFFF);
   clearLayer(newLayer);
   if (!Layer) {
   if (!current.l) {
   image(current.still, 0, 175);
   //currentCanvas = get(0, 175, 1500, 800);
   } else {
   Layer = true;
   currentCanvas.save("cc" + current.change + ".png");
   image(currentCanvas, 0, 175); //this is where we run into issues i think
   newLayer.beginDraw();
   newLayer.image(current.still, 0, 0);
   image(newLayer, 0, 0); 
   newLayer.endDraw();
   }
   } else {
   if (current.l) {
   image(currentCanvas, 0, 175);
   newLayer.beginDraw();
   newLayer.image(current.still, 0, 0);
   newLayer.endDraw();
   image(newLayer, 0, 0);
   } else {
   Layer = false;
   image(current.still, 0, 175);
   currentCanvas = get(0, 175, 1500, 800);
   currentCanvas.save("cc" + current.change + ".png");
   }
   }
   }
   }
   
   void redo() {
   if (current != last) {
   current = current.next; 
   background(#FFFFFF);
   clearLayer(newLayer);
   if (!Layer) {
   if (!current.l) {
   image(current.still, 0, 175);
   //currentCanvas = get(0, 175, 1500, 800);
   } else {
   Layer = true;
   currentCanvas.save("cc" + current.change + ".png");
   image(currentCanvas, 0, 175); //this is where we run into issues i think
   newLayer.beginDraw();
   newLayer.image(current.still, 0, 0);
   image(newLayer, 0, 0); 
   newLayer.endDraw();
   }
   } else {
   if (current.l) {
   image(currentCanvas, 0, 175);
   newLayer.beginDraw();
   newLayer.image(current.still, 0, 0);
   newLayer.endDraw();
   image(newLayer, 0, 0);
   } else {
   Layer = false;
   image(current.still, 0, 175);
   currentCanvas = get(0, 175, 1500, 800);
   currentCanvas.save("cc" + current.change + ".png");
   }
   }
   }
   }
   }
   
   */
