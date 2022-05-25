float[][][]kernels = {
  {{0, 0, 0},{0, 1, 0},{0, 0, 0}},
  {{.111, .111, .111},{.111, .111, .111},{.111, .111, .111}},
  {{0, -1, 0},{-1, 5, -1},{0, -1, 0}},
  {{-1, -1, -1},{-1, 8, -1},{-1, -1, -1}},
  {{1, 0, -1},{2, 0, -2},{1, 0, -1}},
  {{-1, 0, 1},{-2, 0, 2},{-1, 0, 1}},
  {{1, 2,  1},{0, 0, 0},{-1, -2, -1}},
  {{-2, -1,  0},{-1, 1, 1},{0, 1, 2}},
 };


/**If part of the kernel is off of the image, duplicate edge values 
*Calculate the convolution of r/g/b separately, and return that color\
*if the calculation for any of the r,g,b values is outside the range
*     0-255, then clamp it to that range (< 0 becomes 0, >255 becomes 255)
*/
color calcNewColor(int x, int y) {
  color c = 0;
  if (x > 0 && x < img.width - 1 && y > 0 && y < img.height - 1){
    int r = 0;
    int g = 0;
    int b = 0;
    /*
    for (int w = -1; w <= 1; w++){
      for (int h = -1; h <= 1; h++){
        color og = img.get(x + w, y + h);
        r += (red(og) * kernel[w+1][h+1]);
        g += (green(og) * kernel[w+1][h+1]);
        b += (blue(og) * kernel[w+1][h+1]);
      }
    }
    */
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

//returns a PImage that will be set to Next
PImage apply() {
  PImage img = Next.copy();
  for (int r = 0; r < Next.width; r++){
    for (int c = 0; c < Next.height; c++){
      img.set(r, c, calcNewColor(r, c));
    }
  }
  return img;
}
