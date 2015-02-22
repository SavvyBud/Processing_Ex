/*
 * The circle and mapping to axes
 * Author: Vivek Srivastav
*/

float radius = 150;
float t;

void setup(){
  size(640,480);
  smooth();
  stroke(255);     // Set line drawing color to white
  frameRate(25);
  t = 0;
}

void draw(){
  background(196);
  drawCircle();
  drawAxes();
  translate(width/2,height/2);
  t += 0.04;
  drawPosition(radius);
  translate(-width/2,-height/2);
}

void drawAxes(){
  stroke(0);
  fill(0);
  // x-axis
  line(0,height/2,width,height/2);
  text("x-axis", width/2+radius+10,height/2+15);
  //y-axis
  line(width/2,0,width/2,height);
  text("y-axis", width/2+10,height/2-radius-15); 
}

void drawCircle(){
  color c = color(255, 204, 0);
  fill(c);
  ellipse(width/2,height/2,radius*2,radius*2);
}

void drawPosition(float r){
  float x = r*cos(t);
  float y = r*sin(t);
  
  // lines to circles projected on x and y axes
  fill(128);
  line(x,y,x,0);
  line(x,y,0,y);
  color c = color(0,255,204);
  fill(c);
  ellipse(x,y,14,14);
  
  //X-axis projection
  c = color(255,0,204);
  fill(c);
  ellipse(x,0,10,10);
  
  //Y-axis projection
  c = color(255,0,204);
  fill(c);
  ellipse(0,y,10,10);
}
