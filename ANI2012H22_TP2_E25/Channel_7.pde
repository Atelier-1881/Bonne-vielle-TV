
float bpmDefault = 122;
float bpmDelta = 8.0f;
float fadeIntensity = 2.0f;
float bpm;
float timeNow;
float timeLast;
float timeElapsed;
float timeDelay;
float timeBetweenBeat;
int beatCount = 0;
int secondPerMinute = 60;
PImage groove;
PImage dude1;
PImage dude2;


PImage[] images = new PImage[3]; 
int counter; // Automatically initialized at 0
final int DISPLAY_TIME = 493; // 2000 ms = 2 seconds
int lastTime; // When the current image was first displayed


int getRandomColor(){
  return color(random(120,255),random(255),random(255));
}


void Channel7(){

pushMatrix();
angle = angle -1 ;
rotate (angle);
drawFlower (random (width), random(height), random(5,15));
drawFlower2 (random (width), random(height), random(10,20));
popMatrix();

if (millis() - lastTime >= DISPLAY_TIME) {
  counter = ++counter % images.length;
  lastTime = millis();
}
 
image(images[counter], 250, 250);
  timeNow = millis();
  timeElapsed = (timeNow - timeLast) / 1000.0f;
  timeLast = timeNow;
  timeDelay += timeElapsed;

 
if (timeDelay >= timeBetweenBeat)
  {
    timeDelay -= timeBetweenBeat;
    beat();
  }

fade(fadeIntensity);
imageMode(CORNER);
image (Tv,0,0);
  
}


void changeBPM(float bpmNew){
  
bpm = bpmNew;
timeDelay = 0.0f;
timeBetweenBeat = secondPerMinute / bpm;
}


void beat(){ 
  
imageMode(CENTER);
image (groove,250,250);
++beatCount;
}


void drawFlower (float x, float y, float flowerSize) {

strokeWeight(flowerSize);
stroke(getRandomColor());
translate(x,y);
  
for( int i=0; i<10; i++){
    rotate(TWO_PI /10);
    line(0,0,3* flowerSize,0);
}
    
strokeWeight(0);
fill(getRandomColor());
imageMode(CENTER);
image(dude1,0,0, 3* flowerSize, 3 * flowerSize);

}

void drawFlower2 (float x, float y, float flowerSize) {
  
strokeWeight(flowerSize);
stroke(getRandomColor());
translate(x,y);
  
for( int i=0; i<10; i++){
    rotate(TWO_PI /10);
    line(0,0,3* flowerSize,0);
}
  
strokeWeight(0);
fill(getRandomColor());
imageMode(CENTER);
image(dude2,0,0, 3* flowerSize, 3 * flowerSize);
}
