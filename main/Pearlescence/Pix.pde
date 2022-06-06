public class Pix {
  Pix next, prev;
  PImage still;
  boolean l;

  public Pix() {
    if (!Layer) {
      still = get(0, 175, 1500, 800);
      l = false;
    } else {
      l = true;
      newLayer.beginDraw();
      PImage copy = newLayer.copy();
      still = copy;
      newLayer.endDraw();
    }
  }
}
