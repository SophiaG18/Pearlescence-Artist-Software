public class Kernel {
  float[][][]kernels;
  
  //no need for constructor?
  
  /**If part of the kernel is off of the image, return black, Otherwise
  *Calculate the convolution of r/g/b separately, and return that color\
  *if the calculation for any of the r,g,b values is outside the range
  *     0-255, then clamp it to that range (< 0 becomes 0, >255 becomes 255)
  */
  color calcNewColor(PImage img, int x, int y) {
    //Hint: start by always returning black.
    //This will let you test your apply method right away!
    color c = 0;
    if (x > 0 && x < img.width - 1 && y > 0 && y < img.height - 1){
      int r = 0;
      int g = 0;
      int b = 0;
      for (int w = -1; w <= 1; w++){
        for (int h = -1; h <= 1; h++){
          color og = img.get(x + w, y + h);
          r += (red(og) * kernel[w+1][h+1]);
          g += (green(og) * kernel[w+1][h+1]);
          b += (blue(og) * kernel[w+1][h+1]);
        }
      }
      if (r < 0) r = 0;
      if (r > 255) r = 255;
      if (g < 0) g = 0;
      if (g > 255) g = 255;
      if (b < 0) b = 0;
      if (b > 255) b = 255;
      c = color(r, g, b);
    }
    return c;
  }

  /**You must write this method that applies the kernel to the source,
    *and saves the data to the destination.*/
  void apply(PImage source, PImage destination) {
    for (int r = 0; r < source.width; r++){
      for (int c = 0; c < source.height; c++){
        destination.set(r, c, calcNewColor(source, r, c));
      }
    }
  }

}
