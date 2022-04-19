void Channel3(){

{ 
pushStyle();
imageMode(CENTER);

tint(c1);
image (Kisss, 125,125);
  
tint(c2);
image(Kisssss,375,125);
  
tint(c3);
image(Kissss,125,375);

tint(c4);
image(Kissssss, 375,375);
  

loop();
randomizeColor(); 
popStyle();
}

{
 imageMode(CORNER);
 image (Tv,0,0);
}

{
a = a + 0.15;
s = cos(a)*1.5;
angle = angle -1 ;
translate (250,250);
rotate (angle);
scale(s);
frameRate(15);
imageMode(CENTER);
image (Kiss,0,0);
 }
}

 void randomizeColor()
{
  c1 = color(int(random(256)),int(random(256)),int(random(256)),255);
  c2 = color(int(random(256)),int(random(256)),int(random(256)),255);
  c3 = color(int(random(256)),int(random(256)),int(random(256)),255);
  c4 = color(int(random(256)),int(random(256)),int(random(256)),255);
  
  redraw();
  
}
