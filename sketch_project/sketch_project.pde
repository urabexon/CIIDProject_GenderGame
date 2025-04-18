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

// Setup function(initializes screen, loads images, sounds, font)
void setup() {  
    fullScreen();
    lazyscreen = createGraphics(960, 540);
    font = createFont("Arial", 32, true);

    // load images
    for (int i = 0; i <= 27; i++) {
        images[i] = loadImage(i + ".jpeg");
    }

    // load sounds
    for (int i = 0; i < sounds.length; i++) {
        sounds[i] = new SoundFile(this, soundTriggers[i]);
    }
}

// Draw function(updates and renders screen based on current game state)
void draw() {
    lazyscreen.beginDraw();
    switch(gameState) {
        // intro screen
        case 1:
            lazyscreen.image(images[0], 0, 0);
            break;
        // game screen
        case 2:
            lazyscreen.background(0);
            updateTimer();

            // Play/stop sounds based on image index
            handleSound(currentImageIndex);

            // show image
            lazyscreen.image(images[getDisplayImageIndex(currentImageIndex)], 0, 0);

            // timer display
            lazyscreen.textFont(font);
            lazyscreen.textAlign(CENTER);
            lazyscreen.fill(0);
            if (gameStarted) {
                lazyscreen.text(minutes + " min : " + seconds + " sec", 480, 490);
            }
            break;
        // result screen
        case 3:
            lazyscreen.image(images[27], 0, 0);
            lazyscreen.textFont(font);
            lazyscreen.textAlign(CENTER);
            lazyscreen.fill(0);
            lazyscreen.text("Time: " + finalMinutes + " min : " + finalSeconds + " sec", 480, 30);
            lazyscreen.text("Male: " + keyman, 480, 80);
            lazyscreen.text("Female: " + keywoman, 480, 120);
            break;
    }
    lazyscreen.endDraw();
    image(lazyscreen, 0, 0, width, height);
}

// Handles key input to transition game state and record user choices
void keyPressed() {
    println("Key pressed (" + currentImageIndex + "," + gameState + ")");
    if (gameState == 1 && keyCode == ENTER) {
        gameState = 2;
    } else if (gameState == 2 && currentImageIndex < totalImages) {
        if (!gameStarted) {
            gameStarted = true;
            startingTime = millis();
        }
        if (keyCode == RIGHT) {
            keyman++;
            currentImageIndex++;
        } else if (keyCode == LEFT) {
            keywoman++;
            currentImageIndex++;
        }
    } else if (gameState == 2 && currentImageIndex >= totalImages) {
        // Transition to result screen
        gameState = 3;
        finalSeconds = seconds;
        finalMinutes = minutes;
        background(255);
    }
}

// Calculates and updates elapsed time since game start
void updateTimer() {
    seconds = (millis() - startingTime) / 1000;
    minutes = seconds / 60;
    hours = minutes / 60;
    seconds -= minutes * 60;
    minutes -= hours * 60;
}

// Plays or stops sounds depending on the current image index
void handleSound(int index) {
    for (int i = 0; i < soundImageIndexes.length; i++) {
        if (index == soundImageIndexes[i]) {
            if (!sounds[i].isPlaying())
                sounds[i].play();
        } else {
            if (sounds[i].isPlaying())
                sounds[i].stop();
        }
    }
}

// Returns image index to display
int getDisplayImageIndex(int index) {
    // If the index is in the sound trigger list, use img5 instead
    for (int trigger : soundImageIndexes) {
        if (index == trigger)
            return 5;
    }
    return index;
}
