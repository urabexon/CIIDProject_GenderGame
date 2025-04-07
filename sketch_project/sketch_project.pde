// Sound
import processing.sound.*;
SoundFile sound1;
SoundFile sound2;
SoundFile sound3;
SoundFile sound4;
SoundFile sound5;

// Images
PImage introImage;
PImage img1; 
PImage img2;
PImage img3;
PImage img4;
PImage img5; 
PImage img6;
PImage img7;
PImage img8;
PImage img9; 
PImage img10;
PImage img11;
PImage img12;
PImage img13; 
PImage img14;
PImage img15;
PImage img16;
PImage img17;
PImage img18;
PImage img19;
PImage img20; 
PImage img21;
PImage img22;
PImage img23;
PImage img24; 
PImage img25;
PImage img26;
PImage img27;

PGraphics lazyscreen;
int myImageNumber = 1; 
int nrOfImages = 25;

// Count up timer
int startingTime;

// Game variables

boolean gameStarted = false;;

void setup() {
  // size(960,540);
  
  fullScreen();
  // scale(3);
  lazyscreen= createGraphics(960,540);
  
  // Images
  introImage = loadImage("0.jpeg"); 
}

void draw() {

}