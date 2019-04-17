//Posição cartesiana

float[] x = new float[125];
float[] y = new float[125];

//Dimensões

float[] Width = new float[125];
float[] Height = new float[125];

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
    
    x[i] = random(720);
    y[i] = random(720);
    Width[i] = random(360);
    Height[i] = random(360);
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
    ellipse(x[i], y[i], Width[i], Height[i]);
    
    i = i + 1;
  }
  
  save("Circulos.png");
}
