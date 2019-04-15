float x, y;

float Width, Height;

float redf, greenf, bluef, opacityf;  //Variavels do fill

int i = 0;  //Variavel de contagem

void setup() {
  
  size(720, 720);
}

void draw() {
  while (i < 250){
    
    noStroke();
    //Gerar forma e posicao
    x = random(720);
    y = random(720);
    Width = random(360);
    Height = random(360);
    
    //Gerar cor e opacidade do fill
    redf = random(255);
    greenf = random(255);
    bluef = random(255);
    opacityf = random(255);
    if (opacityf < 128) opacityf = 0;
    
    //Desenha a elipse
    fill(redf, greenf, bluef, opacityf);
    ellipse(x,y,Width,Height);
    
    i = i + 1;
  }
}
