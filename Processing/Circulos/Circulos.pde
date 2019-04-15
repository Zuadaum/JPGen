float x, y;  //Posição cartesiana

float Width, Height;  //Dimensões

float huef, satf, brightf, opacityf;  //Variáveis do fill

int i = 0;  //Variável de contagem

void setup() {
  
  //Modo de Cor HSV
  colorMode(HSB, 360, 100, 100, 100);
  
  //Imagem 720x720
  size(720, 720);
  
  //Background de cor aleatória
  background(random(360), random(100), random(100), random(100));
}

void draw() {
  while (i < 200){  //Quantidade de elipses
    
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
    if (opacityf < 25) opacityf = 0;
    
    //Desenha a elipse
    fill(huef, satf, brightf, opacityf);
    ellipse(x,y,Width,Height);
    
    i = i + 1;
  }
  
  save("Circulos.png");
}
