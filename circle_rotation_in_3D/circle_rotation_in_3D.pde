float angle = 0.0;
PFont myFont;

void setup() {
  size(640, 360, P3D);
  smooth();
  fill(255);
  rectMode(CENTER);  
  myFont = createFont("verdana", 12);
  textFont(myFont);
}

void draw() {
  background(200);
  line(0,height/2,width,height/2);
  angle = angle + 0.005;
  if(angle>PI*2)
    angle = 0;
  float c = cos(angle);
  fill(0);
  text("angle = " + degrees(angle), 10, 20);
  translate(width/2, height/2);
  rotateX(c);
  color sc =  color(255,204,0);
  fill(sc);
  ellipse(0, 0, 180, 180);
  //fill(128);
  rect(0,0,50,50); 
}
