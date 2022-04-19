
import processing.video.*;


import processing.sound.*;
SoundFile file1;
SoundFile file3;
SoundFile file4;
SoundFile file5;
SoundFile file6;
SoundFile file7;
SoundFile file8;
SoundFile file9;
SoundFile file10;


final int Enter_STATE=0;
final int Clic_STATE=1;
int state=Enter_STATE;

final int Enter_STATE2=0;
final int Clic_STATE2=2;
int state2=Enter_STATE2;

final int Enter_STATE3=0;
final int Clic_STATE3=3;
int state3=Enter_STATE3;

final int Enter_STATE4=0;
final int Clic_STATE4=4;
int state4=Enter_STATE4;

final int Enter_STATE5=0;
final int Clic_STATE5=5;
int state5=Enter_STATE5;

final int Enter_STATE6=0;
final int Clic_STATE6=6;
int state6=Enter_STATE6;

final int Enter_STATE7=0;
final int Clic_STATE7=7;
int state7=Enter_STATE7;

final int Enter_STATE8=0;
final int Clic_STATE8=8;
int state8=Enter_STATE8;

final int Enter_STATE9=0;
final int Clic_STATE9=9;
int state9=Enter_STATE9;



int sectionActiveAtStartup = 1;
int sectionActive = sectionActiveAtStartup;

PImage Tv;


//Thee sonics///////////////////////////////////////////

PFont typo;

//Flocons
Snow[] flakes = new Snow[300];

//Kiss///////////////////////////////////////////////////
PImage Kiss;
PImage Kisss;
PImage Kissss;
PImage Kisssss;
PImage Kissssss;

color c1 = color(190,120,100,255);
color c2 = color(223,200,223,255);
color c3 = color(190,91,127,255);
color c4 = color(91,190,80,255);

float angle;
float a = 0.0;
float s = 0.0;

//Basket///////////////////////////////////////////////////////
PImage ball;
PImage dude;
Rectangle rect;
int loopAmount = 0;

//Moon/////////////////////////////////////////////////////////

PImage man;
Rectangle1 rect1;

//Monn End////////////////////////////////////////////////////

//Generique///////////////////////////////////////////////////

PImage logo;
PFont fin;

//White///////////////////////////////////////////////////////

int count = 100;

float boidRadius = 10.0f;

float boidMaxspeed = 2.0f;
float boidMaxforce = 0.03f;

float boidThresholdSeparation = 50.0f;
float boidThresholdCohesion = 50.0f;
float boidThresholdAligment = 50.0f;

float boidWeightSeparation = 1.50f;
float boidWeightCohesion = 1.00f;
float boidWeightAligment = 0.75f;

color colorBack = #F7B593;

// variables
Crowd crowd;
Boid boid;




void setup(){

size (715,500);

rect = new Rectangle();
rect1 = new Rectangle1();

Tv=loadImage("tv.png");

myMovie = new Movie(this, "v2.mp4"); 
file1 = new SoundFile(this, "a1.wav");
file3 = new SoundFile(this, "a3.mp3");
file4 = new SoundFile(this, "a4.mp3");
file5 = new SoundFile(this, "a5.mp3");
file6 = new SoundFile(this, "a6.mp3");
file7 = new SoundFile(this, "a7.mp3");
file8 = new SoundFile(this, "a8.mp3");
file9 = new SoundFile(this, "a9.mp3");
file10 = new SoundFile(this, "clic.wav");
file1.play();

//The Sonics////////////////////////////////////////////////////  
 
textSize(64);
frameRate(30);

fin = loadFont("Ubuntu-Regular-18.vlw");
typo = loadFont("BradleyHandITC-48.vlw");

//Flocons  
for (int i = 0; i<flakes.length; i++)
    { 
      flakes[i] = new Snow(random(2, 10));
      flakes[i].spreadY(i);
    }


//The Sonics End/////////////////////////////////////////////////

//Kiss///////////////////////////////////////////////////////////

angle = 0; 
Kiss=loadImage("kiss1.png");
Kisss=loadImage("kiss2.jpg");
Kissss=loadImage("kiss3.jpg");
Kisssss=loadImage("kiss4.jpg");
Kissssss=loadImage("kiss5.jpg");

//Basket/////////////////////////////////////////////////////////

ball = loadImage("ball.png");
dude = loadImage("dude.jpg");

//Moon//////////////////////////////////////////////////////////

man = loadImage("man.png");
img[0] = loadImage("moon.jpg");
img[1] = loadImage("moon.jpg");
logo = loadImage("logo.jpg");  

for (i=0; i<g.length; i++) {
    g[i] = width;
}


//Generique////////////////////////////////////////////////////

//White////////////////////////////////////////////////////////

crowd = new Crowd();

  // initialisation du groupe de boids
  for (int index = 0; index < count; ++index)
  {
    // instanciation d'un nouveau boid
    boid = new Boid(width / 2.0f, height / 2.0f);

    // configuration du nouveau boid
    configuration(boid);

    // ajouter le nouveau boid au système de boids
    crowd.add(boid);
}


//Dee///////////////////////////////////////////////////////////

groove=loadImage("groove.png");
dude1 = loadImage("dude1.png");
dude2 = loadImage("dude2.png");

for (int i = 0; i < images.length; i++){
    
    images[i] = loadImage("deee" + nf(i+1, 2) + ".png"); // nf() allows to generate 01, 02, etc.
} 
   lastTime = millis();
  
  
  timeNow = timeLast = timeElapsed = timeDelay = timeBetweenBeat = 0.0f;

  // BPM initial
  changeBPM(bpmDefault);
}


void draw(){


switch (sectionActive){
   
//Worley/////////////////////////////////////////////////////////    
     case 1:
     Channel1();
      break;
//Wanda//////////////////////////////////////////////////////////
     case 2:
      Channel2();
      break;
//Kiss///////////////////////////////////////////////////////////
     case 3:
      Channel3();
      break;
  //Tthe Sonics /////////////////////////////////////////////////
     case 4:
      Channel4();
      break; 
//Bounce/////////////////////////////////////////////////////////      
     case 5:
      Channel5();
      break; 
//Moon//////////////////////////////////////////////////////////  
     case 6:
      Channel6();
      break; 
//White////////////////////////////////////////////////////////      
      case 7:
      Channel7();
      break;
//Deee////////////////////////////////////////////////////////      
      case 8:
      Channel8();
      break;
//Generique////////////////////////////////////////////////////////      
      case 9:
      Channel9();
      textMode(CORNER);
      break;
}
}

void mousePressed(){

if ((mouseX>=530 && mouseX<=570) && (mouseY>=90 && mouseY<=130)){ state=Clic_STATE;
    sectionActive = 1;
    
    file1.stop();
    file1.play();
    file3.pause();
    file4.pause();
    file5.pause();
    file6.pause();
    file7.pause();
    file8.pause();
    file9.pause();
    file10.play();
    myMovie.pause();
}
if ((mouseX>=580 && mouseX<=615) && (mouseY>=90 && mouseY<=130)){ state=Clic_STATE2;
    sectionActive = 2;
    
    myMovie.play();
    file1.pause();
    file3.pause();
    file4.pause();
    file5.pause();
    file6.pause();
    file7.pause();
    file8.pause();
    file9.pause();
    file10.play();
}
if  ((mouseX>=625 && mouseX<=660) && (mouseY>=90 && mouseY<=130)){ state=Clic_STATE3;
    sectionActive = 3;
   
    file3.stop();
    file3.play();
    file1.pause();
    file4.pause();
    file5.pause();
    file6.pause();
    file7.pause();
    file8.pause();
    file9.pause();
    file10.play();
    myMovie.pause();
}
if  ((mouseX>=530 && mouseX<=570) && (mouseY>=140 && mouseY<=180)){ state=Clic_STATE4;
    sectionActive = 4;
    
    file4.stop();
    file4.play();
    file1.pause();
    file3.pause();
    file5.pause();
    file6.pause();
    file7.pause();
    file8.pause();
    file9.pause();
    file10.play();
    myMovie.pause(); 
}
if  ((mouseX>=580 && mouseX<=615) && (mouseY>=140 && mouseY<=180)){ state=Clic_STATE5;
    sectionActive = 5;
    
    file5.stop();
    file5.play();
    file4.pause();
    file1.pause();
    file3.pause();
    file6.pause();
    file7.pause();
    file8.pause();
    file9.pause();
    file10.play();
    myMovie.pause(); 
} 
if  ((mouseX>=625 && mouseX<=660) && (mouseY>=140 && mouseY<=180)){ state=Clic_STATE6;
    sectionActive = 6;
    
    file6.stop();
    file6.play();
    file1.pause();
    file3.pause();
    file4.pause();
    file5.pause();
    file7.pause();
    file8.pause();
    file9.pause();
    file10.play();
    myMovie.pause();
}
if  ((mouseX>=530 && mouseX<=570) && (mouseY>=190&& mouseY<=230)){ state=Clic_STATE7;
    sectionActive = 7;
    
    file7.stop();
    file7.play();
    file1.pause();
    file3.pause();
    file4.pause();
    file5.pause();
    file6.pause();
    file8.pause();
    file9.pause();
    file10.play();
    myMovie.pause();
}
if  ((mouseX>=580 && mouseX<=615) && (mouseY>=190 && mouseY<=230)){ state=Clic_STATE8;
    sectionActive = 8;
    
    file8.stop();
    file8.play();
    file1.pause();
    file3.pause();
    file4.pause();
    file5.pause();
    file6.pause();
    file7.pause();
    file9.pause();
    file10.play();
    myMovie.pause();
}
if  ((mouseX>=625 && mouseX<=660) && (mouseY>=190 && mouseY<=230)){ state=Clic_STATE9;
    sectionActive = 9;
    
    file9.stop();
    file9.play();
    file1.pause();
    file3.pause();
    file4.pause();
    file5.pause();
    file6.pause();
    file7.pause();
    file8.pause();
    file10.play();
    myMovie.pause();
}
}


  
