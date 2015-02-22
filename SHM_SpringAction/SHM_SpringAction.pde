/*
* Simple harmonic motion
* Author: Vivek Srivastav
*/

float theta;
float offset = 25;
float stemLength = 20;
int rectHeight = 34;
int anchorRadius = 5;
int nodeSize = 4;
int numNodes = 14;

void setup(){
  size(640,480);
  rectMode(CENTER);
  theta = 0;
}

void draw(){
  background(196);
  theta += 0.04;
  float posY = 70 * sin(theta);  
  drawAxes();
  drawSpring(posY);
  drawWeight(posY);
}

void drawAxes(){
  // x-axes
  stroke(255);
  line(0,height/10*7,width,height/10*7);
  // y-axes
  line(width/2,0,width/2,height);
}

void drawSpring(float posY){
  fill(0);
  stroke(0);
  
  // location of anchor
  float x = width/2;
  float y = height/10*2;

  //stem to anchor
  line(x,y+anchorRadius,x,y+stemLength+anchorRadius);
  //stem to weight
  line(width/2,height/10*7+posY-stemLength-rectHeight/2,
    width/2,height/10*7+posY-rectHeight/2);
  fill(0);
  ellipse(x,y+stemLength+anchorRadius,nodeSize,nodeSize);
  ellipse(width/2,height/10*7+posY-stemLength-rectHeight/2,nodeSize,nodeSize);
  
  float x1 = x;
  float y1 = y+stemLength+anchorRadius;
  float len = dist(x,y+stemLength+anchorRadius,width/2,height/10*7+posY-stemLength-rectHeight/2);
  float d = len/(numNodes+1);
  float lx = x;
  float ly = y1;
  for(int i=0;i<numNodes;i++){
    float nx = x1 + pow(-1,i+1)*offset;
    y1 += d;
    ellipse(nx,y1,nodeSize,nodeSize);  
    line(lx,ly,nx,y1);
    lx = nx;
    ly = y1;
  }
  line(lx,ly,width/2,height/10*7+posY-stemLength-rectHeight/2);
  // anchor
  fill(color(0,255,204));
  ellipse(x,y,anchorRadius*2,anchorRadius*2);
}

void drawWeight(float posY){
  fill(color(255,204,0));
  rect(width/2,height/10*7+posY,50,rectHeight);
}

