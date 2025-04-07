// Sound
import processing.sound.*;
SoundFile[] sounds = new SoundFile[5];
String[] soundTriggers = { "6.wav", "9.wav", "13.wav", "15.wav", "20.wav" };
int[] soundImageIndexes = { 5, 9, 13, 15, 20 };

// Images
PImage[] images = new PImage[28];

// Graphics
PGraphics lazyscreen;
int currentImageIndex = 1;
int totalImages = 25;

// Timer
int startingTime;
int seconds, minutes, hours;
int finalSeconds, finalMinutes;

// Game state
int gameState = 1;
boolean gameStarted = false;
int keyman = 0;
int keywoman = 0;

// Font
PFont font;

void setup() {  
    fullScreen();
    lazyscreen = createGraphics(960, 540);
    font = createFont("Arial", 32, true);

    // load images
    for (int i = 0; i <= 27; i++) {
        images[i] = loadImage(i + ".jpeg");
    }

    // Load sounds
    for (int i = 0; i < sounds.length; i++) {
        sounds[i] = new SoundFile(this, soundTriggers[i]);
    }
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
        gameState = 3;
        background(255);
        finalSeconds = seconds;
        finalMinutes = minutes;
        lazyscreen.textFont(font);
        lazyscreen.textAlign(CENTER);
        lazyscreen.fill(0);
        lazyscreen.text("Time:" + (minutes) + " min:" + (seconds) + " sec",480,30);
        lazyscreen.text("man count:" + keyman,10,30);
        lazyscreen.text("woman count:" + keywoman,10,60);
    }
}
