PImage[] img= new PImage[2];
float[] g = new float[2];
int i;
float pos;

void Channel6(){

{
 for (i=0; i<g.length; i++) {
    switch(i){
      case 0:
        pos = g[i]/250;
        break;
}  
    //reset to edge
if (pos<-2200) {g[i] = width;}
    //show img
    image(img[i], pos, 0);
    //update positions
    g[i] -= 125;
  }
}

rect1.update1();
imageMode(CORNER);
image (Tv,0,0);
}
  
  
class Rectangle1 {
    
Timer timer;

float x, y;
float w, h;
float minH, maxH;
float volume;
float minW, maxW, squashW;
  


Rectangle1(){
        
timer = new Timer(4f, 400, true);

minH = height -110;
maxH = 200;

x = width /2;
y = minH;

w =100;
h =200;
volume = w * h;

minW =80;
maxW = w;
squashW = 150;
}
    
void update1(){
        
timer.update();
changeScale();
jump();
display1();
}

void display1(){
      
imageMode(CENTER);
image (man,x-180,y-40,w,h);
} 
  
   

void jump(){
        
if(timer.getTime() < timer.timeLineLength / 2)
            y = map2(   timer.getTime(), 0, timer.timeLineLength / 2,
                         minH, maxH, EXPONENTIAL, EASE_IN_OUT);
if(timer.getTime() >= timer.timeLineLength / 2)
            y = map2(   timer.getTime(), timer.timeLineLength / 2, timer.timeLineLength,
                         maxH, minH, EXPONENTIAL, EASE_IN_OUT);
        
}

void changeScale(){
       
if(y < minH * 6/7)
   w = map(y, minH *6/7, maxH, minW, maxW);

if(y >= minH * 6/7)
   w = map(y, minH, minH * 6/7, squashW, minW);

h = volume / w;
 }
}
