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
