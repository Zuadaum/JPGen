//Posição cartesiana

float[] x1 = new float[125];
float[] y1 = new float[125];
float[] x2 = new float[125];
float[] y2 = new float[125];
float[] x3 = new float[125];
float[] y3 = new float[125];

//Variáveis do fill

float[] huef = new float[125];
float[] satf = new float[125];
float[] brightf = new float[125];
float[] opacityf = new float[125];

int i = 0;  //Variável de contagem

void setup() {
  
  //Modo de Cor HSV
  colorMode(HSB, 360, 100, 100, 100);
  
  //Imagem 720x720
  size(720, 720);
  
  //Background de cor aleatória
  background(random(360), random(100), random(100), random(100));
  
  while(i < 125){
    
    //Geração de variáveis aleatórias
    
    x1[i] = random(900) - 90;
    y1[i] = random(900) - 90;
    x2[i] = random(900) - 90;
    y2[i] = random(900) - 90;
    x3[i] = random(900) - 90;
    y3[i] = random(900) - 90;
    huef[i] = random(360);
    satf[i] = random(100);
    if (satf[i] > 15 && satf[i] < 40) satf[i] = satf[i] + 50;
    brightf[i] = random(100);
    opacityf[i] = random(100);
    if (opacityf[i] < 25) opacityf[i] = 0;
    
    i = i + 1;
  }
}

void draw() {
  
  i = 0;
  while (i < 125){  //Quantidade de elipses
    
    noStroke();
    //Desenha a elipse
    fill(huef[i], satf[i], brightf[i], opacityf[i]);
    triangle(x1[i], y1[i], x2[i], y2[i], x3[i], y3[i]);
    
    i = i + 1;
  }
  
  save("Triangulos.png");
}
