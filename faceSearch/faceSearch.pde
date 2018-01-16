import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

Capture camera;
OpenCV opencv;

PImage img;

float bend;
float cw;

void setup() {
  //size(1280, 1024);
  size(640, 512);
  camera = new Capture(this, 320, 256);  
  opencv = new OpenCV(this, 320, 256);

  img = loadImage("871549868.png");
  bend = 0.1;
  cw = 320;

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  camera.start();
}

void draw() {
  scale(2);
  opencv.loadImage(camera);
  opencv.flip(1);

  pushMatrix();
  scale(-1, 1);
  image(camera, -width * 0.5, 0 );
  popMatrix();

  noFill();
  stroke(255, 0, 255);
  Rectangle[] faces = opencv.detect();
  for (int i = 0; i < faces.length; i++) {
    image(img, faces[i].x*(1-bend*3), faces[i].y*(1-bend*2), faces[i].width + faces[i].x*(bend*6), faces[i].height+faces[i].y*(bend*4));
  }
}

void captureEvent(Capture camera) {
  camera.read();
}