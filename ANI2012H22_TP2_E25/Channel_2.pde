Movie myMovie;

void Channel2(){

background(0);
image(myMovie,10,10);
imageMode(CORNER);
image (Tv,0,0);
}

void movieEvent(Movie m) {
  m.read();
}
