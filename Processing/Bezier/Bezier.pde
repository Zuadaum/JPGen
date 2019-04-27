//Array das imagens

PGraphics[] imagem = new PGraphics[9];

//Posição cartesiana dos pontos dos triângulos

float[][] x1 = new float[9][60];
float[][] y1 = new float[9][60];
float[][] x2 = new float[9][60];
float[][] y2 = new float[9][60];
float[][] x3 = new float[9][60];
float[][] y3 = new float[9][60];

//Posição cartesiana dos pontos dos beziers

float[][] bx1 = new float[9][120];
float[][] by1 = new float[9][120];
float[][] bx2 = new float[9][120];
float[][] by2 = new float[9][120];
float[][] bx3 = new float[9][120];
float[][] by3 = new float[9][120];
float[][] bx4 = new float[9][60];
float[][] by4 = new float[9][60];

//Variáveis do fill dos triângulos

float[][] huef = new float[9][60];
float[][] satf = new float[9][60];
float[][] brightf = new float[9][60];
float[][] opacityf = new float[9][60];

//Variáveis do fill dos beziers

float[][] huefb = new float[9][60];
float[][] satfb = new float[9][60];
float[][] brightfb = new float[9][60];
float[][] opacityfb = new float[9][60];

//Variáveis de contagem

int i = 0;
int j = 0;
int k = 0;

void setup() {
  
  size(720,720);
  background(0);
  
  while(i < 9){
    j = 0;
    while(j < 60){
    
      //Geração de variáveis aleatórias dos triângulos
    
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
    j = 0;
    while(j < 120){
      bx1[i][j] = random(900) - 90;
      by1[i][j] = random(900) - 90;
      bx2[i][j] = random(900) - 90;
      by2[i][j] = random(900) - 90;
      bx3[i][j] = random(900) - 90;
      by3[i][j] = random(900) - 90;
      
      j = j + 1;
    }
    k = 0;
    while(k < 60){
      bx4[i][k] = random(900) - 90;
      by4[i][k] = random(900) - 90;
      huefb[i][k] = random(360);
      satfb[i][k] = random(100);
      if (satfb[i][k] > 15 && satfb[i][k] < 40) satfb[i][k] = satfb[i][k] + 50;
      brightfb[i][k] = random(100);
      opacityfb[i][k] = random(100);
      if (opacityfb[i][k] < 25) opacityfb[i][k] = 0;
      
      k = k + 1;
    }
    i = i + 1;
  }
  
  i = 0;
  while(i < 9){
    
    j = 0;
    k = 0;
    
    //Gera imagens 720x720
    imagem[i] = createGraphics(720,720,JAVA2D);
    imagem[i].beginDraw();
    
    //Modo de Cor HSV
    imagem[i].colorMode(HSB, 360, 100, 100, 100);
    
    //Background de cor aleatória
    imagem[i].background(random(360), random(100), random(100), random(100));
    
    while (k < 60){  //Quantidade de triangulos
      
      imagem[i].noStroke();
      
      //Desenha os triangulos
      imagem[i].fill(huef[i][k], satf[i][k], brightf[i][k], opacityf[i][k]);
      imagem[i].triangle(x1[i][k], y1[i][k], x2[i][k], y2[i][k], x3[i][k], y3[i][k]);
      
      //Desenha os Beziers
      imagem[i].fill(huefb[i][k], satfb[i][k], brightfb[i][k], opacityfb[i][k]);
      imagem[i].beginShape();
      imagem[i].vertex(bx4[i][k], by4[i][k]);
      imagem[i].bezierVertex(bx1[i][j], by1[i][j], bx2[i][j], by2[i][j], bx3[i][j], by3[i][j]);
      j = j + 1;
      imagem[i].bezierVertex(bx1[i][j], by1[i][j], bx2[i][j], by2[i][j], bx3[i][j], by3[i][j]);
      imagem[i].endShape();
      j = j + 1;
      
      k = k + 1;
    }
    imagem[i].endDraw();
    
    //Salva as imagens
    imagem[i].save("/ImagensAleatorias/desenho" + i + ".png");
    
    i = i + 1;
  }
  //Coloca a primeira imagem na janela
  image(imagem[7], 0, 0);
  //Está bem bugado
}
