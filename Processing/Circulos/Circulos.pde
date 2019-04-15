float x;
float y;
float Width;
float Height;
float red, green, blue, opacity;
int i = 0;

void setup() {
  
  size(720, 720);
}

void draw() {
  while (i < 500){
    
    noStroke();
    x = random(720);
    y = random(720);
    Width = random(360);
    Height = random(360);
    red = random(255);
    green = random(255);
    blue = random(255);
    opacity = random(255);
    fill(red, green, blue, opacity);
    ellipse(x,y,Width,Height);
    i = i + 1;
  }
}
