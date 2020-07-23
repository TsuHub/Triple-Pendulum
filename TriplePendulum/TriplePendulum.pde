float s1 = 100;      // "s" de stick
float s2 = 100;
float s3 = 100;
float d1 =  16;       // diâmetro
float d2 =  16;
float d3 =  16;
float a1 = PI/8;     // ângulo
float a2 = PI/8;
float a3 = PI/8;

float px3 = -1;
float py3 = -1;

float espessura = 3;
float cor1 = 0;
float cor2 = 255;
float cor3 = 0;
boolean ativo;

PGraphics canvas;

void setup()
{
  size(600, 600); 
  canvas = createGraphics(600, 600);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}

void draw()
{
  //background(255);
  image(canvas, 0, 0);
  stroke(0);
  strokeWeight(2);
  
  translate(300, 300);
  
  float x1 = s1 * sin(a1);
  float y1 = s1 * cos(a1);
  
  float x2 = x1 + s2 * sin(a2);
  float y2 = y1 + s2 * cos(a2);
  
  float x3 = x2 + s3 * sin(a3);
  float y3 = y2 + s3 * cos(a3);
  
  line(0, 0, x1, y1);
  fill(0);
  ellipse(x1, y1, d1, d1);
  
  line(x1, y1, x2, y2);
  fill(0);
  ellipse(x2, y2, d2, d2);
  
  line(x2, y2, x3, y3);
  fill(0);
  ellipse(x3, y3, d3, d3);
  
  //a1 += 0.0820;
  //a2 += 0.0860;
  //a3 += 0.0900;
  
  //a1 += 0.01;
  //a2 += 0.07;
  //a3 += 0.19;
  
  a1 += 0.01;
  a2 += 0.07;
  a3 += 0.19;
  
  canvas.beginDraw();
  canvas.translate(300, 300);
  canvas.strokeWeight(espessura);
  canvas.stroke(cor3, cor2, cor1);
  
  //canvas.point(x2, y2);
  //canvas.line(x2, y2, 0, 0);
  if(frameCount > 1)
  {
    canvas.line(px3, py3, x3, y3);
  }
  canvas.endDraw();
  
  //espessura *= 1.0008;

  if(!ativo)
  {
    cor1 += 0.2;
    cor2 -= 0.2;
    cor3 += 0.075;
  }
  
  else
  {
    cor2 += 0.4;
  }
  
  if(cor2 <= 0) ativo = true;
  
  if(cor1 >= 200 && cor2 >= 100 && cor3 >= 75) ativo = false;
  
  if(ativo)
  {
    cor1 -= 0.3;
    cor2 += 0.2;
    cor3 += 0.5;
  }
  
  px3 = x3;
  py3 = y3;
  
  text("Powered by Tsuy", 180, 280);
}
