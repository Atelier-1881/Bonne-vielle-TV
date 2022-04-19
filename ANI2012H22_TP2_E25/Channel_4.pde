float x, y;
float z,c;
float angle1 = 1;
float angle2 = 0.0;
float angle3 = 0.0;
float angle4 = 0.0;
float segLength = 40;
float segLength2 = 40;


void Channel4(){
 
background (230);
fill(250);
textFont(typo);
textSize(58);
text("The", 70, 90); 
textSize(108);
text("Sonics", 100, 160); 
fill (255);
rect(0,400,500,200);
fill(250);
textSize(48);
ellipse (250,350,150,150);
ellipse (250,225,120,120);
fill(0);
ellipse (230, 215,15,15);
ellipse (270, 215,15,15);
ellipse (250,335,10,10);
ellipse (250,310,10,10);
ellipse (250,360,10,10);
bezier(230, 250,240,255, 260, 260, 270, 250);
fill(#FF860D);
ellipse (250,235,10,20);
stroke(#8B4601);
strokeWeight(5);

  x = 315;
  y = 320;
  z = 180;
  c = 320;
  
{
  angle1 = (mouseX/float(width) - 1) * -PI;
  angle2 = (mouseY/float(height) - 1) * PI;
  
  angle3 = (mouseX/float(width) + 1) * -PI;
  angle4 = (mouseY/float(height) + 1) * PI;
  
pushMatrix();

 {segment(z, c, angle3); 
  segment(segLength2, 0, angle4);}
  
popMatrix();
  
pushMatrix();
  {segment(x, y, angle1); 
   segment(segLength, 0, angle2);}
 
popMatrix();
}

for (int i = 0; i < flakes.length; i++) 
    {
      flakes[i].display();
    } 
    imageMode (CORNER);
    image (Tv,0,0);
}


class Snow {
  
float x; 
float y;
float alpha;
float diameter;
float speed = random(0.9f, 2.0f);
float descentX;

Snow (float tempD) {
x = random(-50, width+50);
y = random(0,40);
diameter = tempD;
}
  
void spreadY(int i) {

y = y - i*3;
}
  
void display() {
  
alpha = map(y, 0, height, 255, -50);
noStroke();
fill(255, alpha);
ellipse(x, y, diameter, diameter);
y = y + speed;
x = x + descentX;
    
    
if (y > height) {
    y = -diameter;
}

if (x < 0-50) {
    x = width+diameter;} 
    
else if (x > width+50){
    x = 0-diameter;
  }
 }
}
  
  void segment(float x, float y, float a) {
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
}
