public class Pix {
  Pix next, prev;
  PImage still;

  public Pix() {
    if (!Layer) {
      still = get(0, 175, 1500, 800);
    } else {
      newLayer.beginDraw();
      PImage copy = newLayer.copy();
      still = copy;
    }
  }
}
