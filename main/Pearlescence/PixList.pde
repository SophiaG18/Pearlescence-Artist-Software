public class PixList{
  Pix first, last, current;
  
  public PixList(){
    first = new Pix();
    last = new Pix();
    current = last;
    first.next = last;
    last.prev = first;
  }
  
  void drew(Pix change){
    if (current != last){ //drew something after undo
      current.next = change; 
    }
    else{
      last.prev.next = current; 
    }
    last = change;
    last.prev = current;
    last.prev.next = change;
    current = last;
  }
  
  void undo(){
    if (current != first){
      current = current.prev;
      image(current.still, 0, 175);
    }
  }
  
  void redo(){
    if (current != last){
      System.out.println(current.next);
      current = current.next;
      
      image(current.still, 0, 175);
    }
  }
}
