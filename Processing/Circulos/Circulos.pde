float x, y;

float Width, Height;

float huef, satf, brightf, opacityf;  //Variavels do fill

int i = 0;  //Variavel de contagem

void setup() {
  
  colorMode(HSB, 360, 100, 100, 100);
  size(720, 720);
  background(random(360), random(100), random(100), random(100));
}

void draw() {
  while (i < 200){
    
    noStroke();
    //Gerar forma e posicao
    x = random(720);
    y = random(720);
    Width = random(360);
    Height = random(360);
    
    //Gerar cor e opacidade do fill
    huef = random(360);
    satf = random(100);
    brightf = random(100);
    opacityf = random(100);
    if (opacityf < 50) opacityf = 0;
    
    //Desenha a elipse
    fill(huef, satf, brightf, opacityf);
    ellipse(x,y,Width,Height);
    
    i = i + 1;
  }
}
