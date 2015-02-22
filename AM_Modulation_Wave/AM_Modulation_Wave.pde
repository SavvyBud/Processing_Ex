 
int xspacing = 4;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
int maxwaves = 5;   // total # of waves to add together

float theta = 0.0;
float[] amplitude = new float[maxwaves];   // Height of wave
float[] dx = new float[maxwaves];          // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues;                           // Using an array to store height values for the wave (not entirely necessary)
float[][] wyvalues = new float[maxwaves][];

void setup() {
  size(640,720);
  colorMode(RGB, 255, 255, 255, 100);
  w = width + 16;

  for (int i = 0; i < maxwaves; i++) {
    amplitude[i] = random(10,40);
    float period = random(100,300); // How many pixels before the wave repeats
    dx[i] = (TWO_PI / period) * xspacing;
    wyvalues[i] = new float[w/xspacing];
  }

  yvalues = new float[w/xspacing];
}

void draw() {
  background(128);
  calcWave();
  renderWave();
  textSize(32);
  text("Amplitude modulation of two waves", 10, 30);
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // Set all height values to zero
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = 0;
  }
 
  // Accumulate wave height values
  for (int j = 0; j < maxwaves; j++) {
    for(int k=0;k<wyvalues[j].length;k++){
      wyvalues[j][k] = 0;
    }
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      // Every other wave is cosine instead of sine
      if (j % 2 == 0)  {
        yvalues[i] += sin(x)*amplitude[j];
        wyvalues[j][i] += sin(x)*amplitude[j];
      } else {
        yvalues[i] += cos(x)*amplitude[j];
        wyvalues[j][i] += cos(x)*amplitude[j];
      }
      x+=dx[j];
    }
  }
}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  noStroke();
  fill(255,50);
  ellipseMode(CENTER);
  for(int j=0;j<2;j++){
    for (int x = 0; x < wyvalues[j].length; x++) {
      ellipse(x*xspacing,height/4*(j+1)+wyvalues[j][x],8,8);
    }
  }
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing,height/4*3+yvalues[x],8,8);
  }
  
}

