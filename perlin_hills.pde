int cols, rows;
int scl = 20;
int w = 5000;
int h = 5000;
float flying = 0;
float[][] terrain;

import com.hamoid.*;
VideoExport videoExport;

void setup(){
size(200,200, P3D);
cols = w / scl;
rows = h/ scl;
//noStroke();
stroke(255,255,255,50);
fill(239,188,213);
//noFill();
//fill(0);
terrain = new float[cols][rows];
strokeWeight(1);
videoExport = new VideoExport(this);
  videoExport.startMovie();
}

void draw(){
  lights();
  float yoff = flying;
for(int y = 0; y < rows; y++){
  float xoff = 0;
  for(int x = 0; x < cols; x++){
     terrain[x][y] = map(noise(xoff,yoff),0,1,-150,150);
     xoff += 0.1;
  }
  yoff += 0.1;
}
 flying -= 0.1; 
background(194,187,240);
//ambientLight(150,45,75);
translate(width/2, height/2);
rotateX(PI/3);

translate(-w/2,-h/2);
for(int y = 0; y < rows-1; y++){
  beginShape(TRIANGLE_STRIP);
for(int x = 0; x < cols; x++){
vertex(x*scl, y*scl, terrain[x][y]);
vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
}
endShape();
}
//videoExport.saveFrame();
}

void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}