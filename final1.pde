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



//float[][] x1, float[][] y1, float[][] x2, float[][] y2, float[][] x3, float[][] y3, float[][] huef, float[][] satf, float[][] brightf, float[][] opacityf 
//float[][] x1, float[][] y1, float[][] x2, float[][] y2, float[][] x3, float[][] y3, float[][] huef, float[][] satf, float[][] brightf, float[][] opacityf 

//Variáveis de contagem

int i = 0;
int j = 0;


// tira a media de uma lista
float med (float[] lista){
  int k, a; 
  float somat = 0, med;
  k = lista.length;
  for (a = 0; a < k; a = a + 1){
    somat = somat + lista[a]; 
  }
  med = somat/k;
  
  return med;
}


// essa funcao faz uma lista de medias com base em uma lista de uma lista de listas
float[] medl (float[][] lista){
  int b; 
  float[] medl = new float[lista.length];
  
  for (b = 0; b < lista.length; b = b + 1)
    medl[b] = med (lista [b]); 
  
  return medl;
}


// essa funcao da a lista do quadrado da porcentagem do desvio com base no maior valor.
float[] quadrado (float[] l){
  float []dif = new float [l.length +1];
  int a;
  float max = 0;
  
  //ve qual eh o valor mais alto da lista
  for (a = 0; a < l.length; a = a + 1)
    if (max < l[a])
      max = l[a];
  
  //tira a diferencia 
  for (a = 0; a < l.length; a = a + 1)
    if (l[a] < med(l))
      dif[a] = (med(l) - l[a]);
    else
      dif[a] = (l[a] - med(l));
      
  //deixa o resultado como um numero entre 0 e 1    
  for (a = 0; a < l.length; a = a + 1)
    dif[a] = dif[a]/max;
    dif[a] = sq(dif[a]);
    
  return dif;
}


//essa funcao calcula a "distancia"/diferenca de cada imagem e formatar o resultado em uma lista
float []distancia_quad (float[][] x1, float[][] y1, float[][] x2, float[][] y2, float[][] x3, float[][] y3, float[][] huef, float[][] satf, float[][] brightf, float[][] opacityf ){
  //float xl, yl, Widthl, Heightl, huel, satl, brigthl, opacityl, b; 
  int a;
  float []distancia = new float [x1.length];
  for (a = 0; a < x1.length; a = a + 1)
    distancia[a] = sqrt(quadrado (medl(x1))[a] + quadrado (medl(y1))[a] +quadrado (medl(x2))[a] + quadrado (medl(y2))[a] + quadrado (medl(x3))[a] +
    quadrado (medl(y3))[a] + quadrado (medl(huef))[a] + quadrado (medl(satf))[a] + quadrado (medl(brightf))[a] + quadrado (medl(opacityf))[a]);
    
  return distancia;
}


float [] distancia_final (float []d_l, float []votos){
   float []distancia_final = new float [votos.length];
   int a, b;
   float max = 0;
   for (b = 0; b < votos.length; b = b + 1)
        if (votos[b] > max)
          max = votos[b];
   
   
   for (a = 0; a < votos.length; a = a + 1)
     //distancia_final[a] = sqrt( sq(1 - d_l[a]) + sq(1 - votos[a]/max));  
     distancia_final[a] = sqrt( sq(d_l[a]) + sq(votos[a]/max)); //para ter distancias diretamente proporcionais a diversidade  
  return distancia_final;
}



//devolve uma lista crescente do ranking
int []rank (float []l) {
    int a, b = 0, d, e;
    double c = 0;
    int [] rank = new int [l.length];
    double []var = new double [l.length];
    for (e = 0; e < l.length; e = e + 1)
      var[e] = l[e]; 

    for (a = 0; a < l.length; a = a + 1){     
      for (c = 0, d = 0; d < l.length; d = d + 1){
        if (var[d] > c){
          c = var[d];
          b = d;
        }
      }  
      rank[rank.length - 1 - a] = b;
      var[b] = 0;
    }
    
  return rank;
}


int aleatorio (float []l){
   float soma = 0,
   k,
   t = 0;
   int r = -1,
   p = 0;
   for (int i = 0; i < l.length; i = i + 1)
    soma = soma + l[i]; 
   
   k = random (soma);
   
   for (int i = 0; i < l.length && p == 0; i = i + 1){
      t = t + l[i];
       if (k < t){
         r = i;
         p = 1;
       }
   }
   
  return r;
}






float [][] child (float[]px1, float[]py1, float[] px2, float[]py2, float[]px3, float[] py3, float[] phuef, float[]psatf, float[] pbrightf, float[] popacityf,
float[]mx1, float[]my1, float[] mx2, float[]my2, float[]mx3, float[] my3, float[] mhuef, float[]msatf, float[] mbrightf, float[] mopacityf){
  
    float child [][] = new float [10][125];  
    int k;
    float[] cx1 = new float[125];
    float[] cy1 = new float[125];
    float[] cx2 = new float[125];
    float[] cy2 = new float[125];
    float[] cx3 = new float[125];
    float[] cy3 = new float[125];
    float[] chuef = new float[125];
    float[] csatf = new float[125];
    float[] cbrightf = new float[125];
    float[] copacityf = new float[125];

    for (int i = 0; i < 125; i = i + 1){
      k = int(random (2));
      if (k == 0) {
        cx1[i] = px1[i];
        cy1[i] = py1[i];
        cx2[i] = px2[i];
        cy2[i] = py2[i];
        cx3[i] = px3 [i];
        cy3[i] = py3[i];
        chuef[i] = phuef [i];
        csatf[i] = psatf [i];
        cbrightf[i] = pbrightf [i];
        copacityf[i] = popacityf[i];
      }
      else {
        cx1[i] = mx1[i];
        cy1[i] = my1[i];
        cx2[i] = mx2[i];
        cy2[i] = my2[i];
        cx3[i] = mx3 [i];
        cy3[i] = my3[i];
        chuef[i] = mhuef [i];
        csatf[i] = msatf [i];
        cbrightf[i] = mbrightf [i];
        copacityf[i] = mopacityf[i]; 
      } 
    }
  
    child[0] = cx1;
    child[1] = cy1;
    child[2] = cx2;
    child[3] = cy2; 
    child[4] = cx3;
    child[5] = cy3;
    child[6] = chuef;
    child[7] = csatf;
    child[8] = cbrightf; 
    child[9] = copacityf;
  return child;
}






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

  int imagens = x1.length;
  


  
  for (int i = 0; i < imagens ; i = i + 1){
    int pai, mae;
     float filho [][] = new float [10][125]; 
    pai = aleatorio(distancia_quad (x1, y1, x2, y2, x3, y3, huef, satf, brightf, opacityf));
    mae = aleatorio(distancia_quad (x1, y1, x2, y2, x3, y3, huef, satf, brightf, opacityf));
    filho = child(x1[pai], y1[pai], x2[pai], y2[pai], x3[pai], y3[pai], huef[pai], satf[pai], brightf[pai], opacityf[pai],
      x1[mae], y1[mae], x2[mae], y2[mae], x3[mae], y3[mae], huef[mae], satf[mae], brightf[mae], opacityf[mae]);
    
    x1[i] = filho[0];
    y1[i] = filho[1];
    x2[i] = filho[2];
    y2[i] = filho[3];
    x3[i] = filho[4];
    y3[i] = filho[5];
    huef [i] = filho[6];
    satf [i] = filho[7];
    brightf [i] = filho[8];
    opacityf[i] = filho[9];
  }
 

}

  /*//println (rank(distancia_quad (x1, y1, x2, y2, x3, y3, huef, satf, brightf, opacityf)));
  println (aleatorio(distancia_quad (x1, y1, x2, y2, x3, y3, huef, satf, brightf, opacityf)));
  println (aleatorio(distancia_quad (x1, y1, x2, y2, x3, y3, huef, satf, brightf, opacityf)));
  println (aleatorio(distancia_quad (x1, y1, x2, y2, x3, y3, huef, satf, brightf, opacityf)));*/

        /*px1[]
        py1[]
        px2[]
        py2[]
        px3 []
        py3[]
        phuef []
        psatf []
        pbrightf []
        popacityf[]*/
