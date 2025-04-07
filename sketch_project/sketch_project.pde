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
int seconds;
int minutes;
int hours;
// keep time for result
int finalSeconds;
int finalMinutes;

// Game variables
int gameState = 1;
int keyman = 0;
int keywoman = 0;
// int timeOut = 10;
// int counter = 20;
PFont font;

boolean gameStarted = false;;

void setup() {
  // size(960,540);
  
  fullScreen();
  // scale(3);
  lazyscreen= createGraphics(960,540);
  
  // Images
  introImage = loadImage("0.jpeg");
  // resize(introImage.width*2, introImage.height*2);
  img1 = loadImage("1.jpeg"); 
  img2 = loadImage("2.jpeg");
  img3 = loadImage("3.jpeg");
  img4 = loadImage("4.jpeg"); 
  img5 = loadImage("5.jpeg");
  img6 = loadImage("6.jpeg");
  img7 = loadImage("7.jpeg"); 
  img8 = loadImage("8.jpeg");
  img9 = loadImage("9.jpeg");
  img10 = loadImage("10.jpeg"); 
  img11 = loadImage("11.jpeg");
  img12 = loadImage("12.jpeg");
  img13 = loadImage("13.jpeg"); 
  img14 = loadImage("14.jpeg");
  img15 = loadImage("15.jpeg");
  img16 = loadImage("16.jpeg"); 
  img17 = loadImage("17.jpeg");
  img18 = loadImage("18.jpeg");
  img19 = loadImage("19.jpeg"); 
  img20 = loadImage("20.jpeg");
  img21 = loadImage("21.jpeg");
  img22 = loadImage("22.jpeg"); 
  img23 = loadImage("23.jpeg");
  img24 = loadImage("24.jpeg");
  img25 = loadImage("25.jpeg");
  img26 = loadImage("26.jpeg");
  img27 = loadImage("27.jpeg");

  // sound
  sound1 = new SoundFile(this,"6.wav");
  sound2 = new SoundFile(this,"9.wav");
  sound3 = new SoundFile(this,"13.wav");
  sound4 = new SoundFile(this,"15.wav");
  sound5 = new SoundFile(this,"20.wav");
  
  font = createFont("Arial", 32, true);
  // count up timer
  // textSize(20);//Count down test size

}

void draw() {
    lazyscreen.beginDraw();
    switch(gameState) {
        case 1:
            lazyscreen.image(introImage,0,0);
            break;
        case 2:
            lazyscreen.background(0);
            seconds = (millis() - startingTime) / 1000;//millis is computer time.
            minutes = seconds / 60;
            hours = minutes/60;
            seconds-=minutes * 60;
            minutes-=hours * 60;

            // ------- main image switching -------
            switch (myImageNumber) {
                case 1:
                    introImage=img1; 
                    lazyscreen.image(introImage,0,0);
                    break;

                case 2:
                    introImage=img2;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 3:
                    introImage=img3;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 4:
                    introImage=img4;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 5:
                    if (!sound1.isPlaying()) {
                        sound1.play();
                    }
                    introImage=img5;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 6:
                    if (sound1.isPlaying()) {
                        sound1.stop();
                    }
                    introImage=img6;
                    lazyscreen.image(introImage,0,0); 
                    break;

                case 7:
                    introImage=img7;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 8:
                    introImage=img8;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 9:
                    if (!sound2.isPlaying()) {
                        sound2.play();
                    }
                    introImage=img5;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 10:
                    if (sound2.isPlaying()) {
                        sound2.stop();
                    }
                    introImage=img10;
                    lazyscreen.image(introImage,0,0); 
                    break;

                case 11:
                    introImage=img11;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 12:
                    introImage=img12;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 13:
                    if (!sound3.isPlaying()) {
                        sound3.play();
                    }
                    introImage=img5;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 14:
                    if (sound3.isPlaying()) {
                        sound3.stop();
                    }
                    introImage=img14;
                    lazyscreen.image(introImage,0,0); 
                    break;

                case 15:
                    if (!sound4.isPlaying()) {
                        sound4.play();
                    }
                    introImage=img5;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 16:
                    if (sound4.isPlaying()) {
                        sound4.stop();
                    }
                    introImage=img16;
                    lazyscreen.image(introImage,0,0); 
                    break;

                case 17:
                    introImage=img17;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 18:
                    introImage=img18;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 19:
                    introImage=img19;
                    lazyscreen.image(introImage,0,0);
                    break; 

                case 20:
                    if (!sound5.isPlaying()) {
                        sound5.play();
                    }
                    introImage=img5;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 21:
                    if (sound5.isPlaying()) {
                        sound5.stop();
                    }
                    introImage=img21;
                    lazyscreen.image(introImage,0,0); 
                    break;

                case 22:
                    introImage=img22;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 23:
                    introImage=img23;
                    lazyscreen.image(introImage,0,0); 
                    break;

                case 24:
                    introImage=img24;
                    lazyscreen.image(introImage,0,0);
                    break;

                case 25:
                    introImage=img25;
                    lazyscreen.image(introImage,0,0);
                    break;

                // case 26:
                // introImage=img26;
                // lazyscreen.image(introImage,0,0);
                // break;

                // case 27:
                // introImage=img27;
                // lazyscreen.image(introImage,0,0);
                // lazyscreen.text("thank you for playing",50,50);
                // break;
            }
            // ------- end image switching -------

            // draw to screen
            lazyscreen.textFont(font);
            lazyscreen.textAlign(CENTER);
            lazyscreen.fill(0);

            if (gameStarted) {
                lazyscreen.text(+ (minutes) + " min:" + (seconds) + " sec",480,490);
            }

            break;

        case 3:
            lazyscreen.image(img27,0,0);
            lazyscreen.textFont(font);
            lazyscreen.textAlign(CENTER);
            lazyscreen.fill(0);
            lazyscreen.text("Time: "+ (minutes) + " min:" + (seconds) + " sec",480,30);
            lazyscreen.text("Male: " + keyman,480,80);
            lazyscreen.text("Female: " + keywoman,480,120);
            break;
    }
    lazyscreen.endDraw();
    image(lazyscreen,0,0,width,height);
}

void keyPressed() {
    println("key pressed (" + myImageNumber+","+gameState+")");
    if (gameState == 1) {
        if (keyCode == ENTER) {
            gameState = 2;
        }
    } else if (gameState == 2 && myImageNumber < nrOfImages) {
        if (!gameStarted) {
            gameStarted = true;
            startingTime = millis();
        }
        if (keyCode == 39) {
            // right
            myImageNumber++;
            keyman = keyman +1; 
        } else if(keyCode == 37) {
            // left
            myImageNumber++; 
            keywoman = keywoman +1;
        }
        println("entering here" + myImageNumber);
    } else if (gameState == 2 && myImageNumber >= nrOfImages-1) {
        // add line
    }

}
