
/*
* Author: Vivek Srivastav
* Pendulum
*/
float g = 9.8 ;
int radius = 20;
float t;
float theta_max = HALF_PI/3;

void setup(){
  size(640,480);
  smooth();
  t=0;
}

void draw(){
  drawAxes();
}

void drawAxes(){
  background(196);
  fill(0);
  t += 0.08;
  // point from where the pendulum is hanging
  float x = width/2;
  float y = height/10*2;

  stroke(255);
  // x
  line(width/10*2,height/10*8+radius,width/10*8,height/10*8+radius);
  // y
  line(x,y,x,height/10*8);
  
  stroke(0);
  // theta = theta_max*sin(sqrt(g/L)*t)
  float L = dist(x,y,x,height/10*8);  
  float theta = theta_max*sin(sqrt(g/L)*t)+HALF_PI;
  float posX = L*cos(theta);
  float posY = L*sin(theta);

  line(x,y,x+posX,y+posY);
  // anchor point
  fill(color(0,255,204));
  ellipse(x,y,10,10);
  
  translate(x,y);
  fill(color(255,204,0));  
  ellipse(posX,posY,radius*2,radius*2);
  translate(-x,-y);
}
