//Array das imagens

PGraphics[] triangulo = new PGraphics[8];

//Posição cartesiana

float[][] x1 = new float[8][125];
float[][] y1 = new float[8][125];
float[][] x2 = new float[8][125];
float[][] y2 = new float[8][125];
float[][] x3 = new float[8][125];
float[][] y3 = new float[8][125];

//Variáveis do fill

float[][] huef = new float[8][125];
float[][] satf = new float[8][125];
float[][] brightf = new float[8][125];
float[][] opacityf = new float[8][125];

  //Variáveis de contagem

int i = 0;
int j = 0;

void setup() {
  
  size(720,720);
  background(0);
  
  while(i < 8){
    j = 0;
    while(j < 125){
    
      //Geração de variáveis aleatórias
    
      x1[i][j] = random(900) - 90;
      y1[i][j] = random(900) - 90;
      x2[i][j] = random(900) - 90;
      y2[i][j] = random(900) - 90;
      x3[i][j] = random(900) - 90;
      y3[i][j] = random(900) - 90;
      huef[i][j] = random(360);
      satf[i][j] = random(100);
      if (satf[i][j] > 15 && satf[i][j] < 40) satf[i][j] = satf[i][j] + 50;
      brightf[i][j] = random(100);
      opacityf[i][j] = random(100);
      if (opacityf[i][j] < 25) opacityf[i][j] = 0;
    
      j = j + 1;
    }
    i = i + 1;
  }
}

void draw() {
  
  i = 0;
  while(i < 9){
    
    j = 0;
    
    //Gera imagens 720x720
    triangulo[i] = createGraphics(720,720,JAVA2D);
    triangulo[i].beginDraw();
    
    //Modo de Cor HSV
    triangulo[i].colorMode(HSB, 360, 100, 100, 100);
    
    //Background de cor aleatória
    triangulo[i].background(random(360), random(100), random(100), random(100));
    
    while (j < 125){  //Quantidade de triangulos
      
      triangulo[i].noStroke();
      
      //Desenha os triangulos
      triangulo[i].fill(huef[i][j], satf[i][j], brightf[i][j], opacityf[i][j]);
      triangulo[i].triangle(x1[i][j], y1[i][j], x2[i][j], y2[i][j], x3[i][j], y3[i][j]);
    
      j = j + 1;
    }
    
    triangulo[i].endDraw();
    
    //Salva as imagens
    triangulo[i].save("/ImagensAleatorias/Triangulos" + i + ".png");
    
    i = i + 1;
  }
  //Coloca a primeira imagem na janela
  //image(triangulo[7], 0, 0);
  //Está bem bugado
}
