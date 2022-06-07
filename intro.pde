void intro() {
  theme.play();
  background(darkblue);
  image(background, 0, 0);
  fill(cream);
  textFont(font);
  textAlign(CENTER);
  text("Breakout!", width/2, 200);

  //play button
  fill(lightblue);
  strokeWeight(5);
  tactile(250, 600, 300, 100);
  rect(250, 600, 300, 100, 20);
  fill(mediumblue);
  textSize(70);
  text("play!", width/2, 675);

  //gif
  image(gif[f], 200, 250, 400, 300);
  f=f+1;
  if (f==numberOfFrames) f=0;
}

void introClicks() {
  if (mouseX>250 && mouseX<550 && mouseY>600 && mouseY<700) {
    click.play();
    click.rewind();
    mode=GAME;
  }
}

void tactile(int x, int y, int w, int h) {
  if (mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h) {
    stroke(mediumblue);
  } else stroke (lightblue);
}
