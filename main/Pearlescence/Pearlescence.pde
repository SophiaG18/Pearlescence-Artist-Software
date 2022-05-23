int R;
int G;
int B;
int Size;
int brushMode;

void setup(){
  size(1200, 900);
  R = 0;
  G = 0;
  B = 0;
  Size = 4;
  brushMode = 1;
}

void draw(){
  fill(200);
  rect(0, 0, 1200, 100);
  fill(255);
  rect(0, 100, 1200, 800);
} 
