public class PixList {
  Pix first, last, current;

  public PixList() {
    first = new Pix();
    last = new Pix();
    current = last;
    first.next = last;
    last.prev = first;
  }

  void drew(Pix change) {
    if (current != last) { //drew something after undo
      current.next = change;
    } else {
      last.prev.next = current;
    }
    last = change;
    last.prev = current;
    last.prev.next = change;
    current = last;
  }

  void undo() {
    if (current != first) {
      current = current.prev;
      if (!Layer) {
        image(current.still, 0, 175);
      } else {
        if (current.l) {
          background(#FFFFFF);
          clearLayer(newLayer);
          image(currentCanvas, 0, 175);
          newLayer.beginDraw();
          newLayer.image(current.still, 0, 0);
          newLayer.endDraw();
        }
      }
    }
  }

  void redo() {
    if (current != last) {
      current = current.next;    
      if (!Layer) {
        image(current.still, 0, 175);
      } else {
        if (current.l) {
          background(#FFFFFF);
          clearLayer(newLayer);
          image(currentCanvas, 0, 175);
          newLayer.beginDraw();
          newLayer.image(current.still, 0, 0);
          newLayer.endDraw();
        }
      }
    }
  }
}
