void pause() {
  //play button
  fill(lightblue);
  strokeWeight(3);
  tactilecircle(50, 50, 60);
  circle(50, 50, 60);
  fill(mediumblue);
  textSize(40);
  text("P", 52, 65);

  //pause
  textFont(font);
  textAlign(CENTER);
  fill(cream);
  textSize(120);
  text("paused", width/2, height/2);
}

void pauseClicks() {
  if (dist(mouseX, mouseY, 60, 60)<30) {
    click.play();
    click.rewind();
    mode=GAME;
  }
}
