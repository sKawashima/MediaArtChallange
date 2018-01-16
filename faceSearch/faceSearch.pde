import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture camera;
OpenCV opencv;

void setup() {
  //size(1280, 1024);
  size(640, 512);
  camera = new Capture(this, width/2, height/2);
  opencv = new OpenCV(this, width/2, height/2);

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  camera.start();
}

void draw() {
  scale(2);
  opencv.loadImage(camera);
  image(camera, 0, 0 );
  noFill();
  stroke(255, 0, 255);
  Rectangle[] faces = opencv.detect();
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}

void captureEvent(Capture camera) {
  camera.read();
}
