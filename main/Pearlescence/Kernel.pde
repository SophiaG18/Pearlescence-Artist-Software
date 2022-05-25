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
*0-255, then clamp it to that range (< 0 becomes 0, >255 becomes 255)
*/
color calcNewColor(int x, int y) {
  int r = 0;
  int g = 0;
  int b = 0;
  for (int w = -1; w <= 1; w++){ //x
    for (int h = -1; h <= 1; h++){ //y
      int corx = x + w;
      int cory = y + h;
      if (corx < 0){
        corx = 0;
      }
      if (corx > Next.width - 1){
        corx = corx - 1;
      }
      if (cory < 0){
        cory = 0;
      }
      if (cory > Next.height - 1){
        cory = cory - 1;
      }
      color og = Next.get(corx, cory);
      r += (red(og) * kernels[Index][w+1][h+1]);
      g += (green(og) * kernels[Index][w+1][h+1]);
      b += (blue(og) * kernels[Index][w+1][h+1]);
    }
  }
  if (r < 0) r = 0;
  if (r > 255) r = 255;
  if (g < 0) g = 0;
  if (g > 255) g = 255;
  if (b < 0) b = 0;
  if (b > 255) b = 255;
  return color(r, g, b);
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
