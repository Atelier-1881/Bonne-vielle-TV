void Channel5(){
  
imageMode(CORNER);
image (dude,8,0);

rect.update();
imageMode(CORNER);
image (Tv,0,0);
}
  
  
class Rectangle{
    
Timer timer;
float x, y;
float w, h;
float minH, maxH;
float volume;
float minW, maxW, squashW;
  


Rectangle(){
        
timer = new Timer(1.5f, 400, true);

minH = height - 50;
maxH = 250;

x = width /2;
y = minH;

w = 70;
h =70;
volume = w * h;

minW =30;
maxW = w;
squashW = 80;
}
    
    
void update(){
  
timer.update();
changeScale();
jump();
display();
}
    

void display(){
      
imageMode(CENTER);
image (ball,x-170,y,w,h);
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
