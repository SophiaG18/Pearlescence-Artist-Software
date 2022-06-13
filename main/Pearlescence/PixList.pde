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
    return take(); 
    //in Pearlescence, use PP.get(current) after getting the image
  }
  
  PImage redo(){
    //make sure to test if Next has anything inside before calling
    Prev.add(Next.remove(Next.size() - 1)); //first image in arraylist
    PP.add(NN.remove(NN.size() - 1));
    current ++;
    return take(); 
    //in Pearlescence, use PP.get(current) after getting the image
  }
  
  PImage take(){
    return Prev.get(current);
  }
}
  
