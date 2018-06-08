//make multiple PImage layers
//move mouse to adjsut alpha values of the pixel array on the top layer

PImage galaxy;
PImage vr;

void setup() {
  size(800, 640);
  galaxy = loadImage("galaxy.jpg");
  vr = loadImage("vr.jpg");
  vr.loadPixels();
  loadPixels();
}


void draw() {
for (int x = 0; x < vr.width; x++) {
    for (int y = 0; y < vr.height; y++ ) {
      int loc = x + y*vr.width;
      
      float r,g,b,a;
      r = red (vr.pixels[loc]);
      g = green (vr.pixels[loc]);
      b = blue (vr.pixels[loc]);
      a = alpha (vr.pixels[loc]);
      
      // Calculate an amount to change brightness based on proximity to the mouse
      //float maxdist = 50;//dist(0,0,width,height);
      //float d = dist(x, y, mouseX, mouseY);
      
      float adjustBrightness = map(mouseX, 0, width, 0, 1); 
      //r *= adjustBrightness;
      //g *= adjustBrightness;
      //b *= adjustBrightness;
      a *= adjustBrightness;
      
      // Constrain RGB to make sure they are within 0-255 color range
      //r = constrain(r, 0, 255);
      //g = constrain(g, 0, 255);
      //b = constrain(b, 0, 255);
      //a = constrain(a, 0, 1);
      
      // Make a new color and set pixel in the window
      color c = color(r, g, b, a);
      pixels[y*width + x] = c;
    }
  }
  updatePixels();
}


//PImage galaxy;
//PImage vr;

//void setup() {
//  size(800, 640);
//  galaxy = loadImage("galaxy.jpg");
//  vr = loadImage("vr.jpg");

//}


//void draw() {
//  image(galaxy, 0, 0);
//  image(vr, 0, 0);
  
//  if (mousePressed) {
//     tint(255,0,0,100);
//  } else {
//     tint(255); 
//  }
//}



//PImage galaxy;
//PImage vr;

//void setup() {
//  size(800, 640);
//  galaxy = loadImage("galaxy.jpg");
//  vr = loadImage("vr.jpg");
//  vr.mask(galaxy);
//  imageMode(CENTER);
//}


//void draw() {
//  background(255);
//  image(galaxy, width/2, height/2);
//  image(vr, mouseX, mouseY);
//}
