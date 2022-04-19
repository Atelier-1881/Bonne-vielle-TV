
void Channel8(){
  
fade(16);
updateMouse();
crowd.update();
crowd.render();

imageMode(CORNER);
image (Tv,0,0);

}

void updateMouse()

{
  if (mousePressed == true){
    if (frameCount % 2 == 0){
     
      boid = new Boid(mouseX+100, mouseY);
      configuration(boid);
      crowd.add(boid);
    }
  }

}

void configuration(Boid b){
  

b.radius = boidRadius;
b.maxspeed = boidMaxspeed;
b.maxforce = boidMaxforce;

b.thresholdCohesion = boidThresholdCohesion;
b.thresholdAligment = boidThresholdAligment;
b.thresholdSeparation = boidThresholdSeparation;
  
b.weightSeparation = boidWeightSeparation;
b.weightCohesion = boidWeightCohesion;
b.weightAligment = boidWeightAligment;
}

void fade (float intensity){
  
rectMode(CORNER);
noStroke();
fill(colorBack, intensity);
rect(0, 0, width, height);
}
