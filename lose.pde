void lose() {
  lose.play();
  textFont(font);
  textAlign(CENTER);
  background(darkblue);
  imageMode(CORNER);
  image(background, 0, 0);

  //losing
  fill(cream);
  textSize(100);
  text("You Lost!", width/2, 200);

  //picture
  imageMode(CENTER);
  image(img2, width/2, 350);

  //retry button
  fill(lightblue);
  strokeWeight(5);
  tactile(300, 500, 200, 80);
  rect(300, 500, 200, 80, 20);
  fill(mediumblue);
  textSize(50);
  text("retry", width/2, 555);

  //quit button
  fill(lightblue);
  strokeWeight(5);
  tactile(300, 600, 200, 80);
  rect(300, 600, 200, 80, 20);
  fill(mediumblue);
  textSize(50);
  text("quit", width/2, 655);
}

void loseClicks() {
  if (mouseX>300 && mouseX<500 && mouseY>500 && mouseY<580) {
    setup();
    mode=GAME;
    theme.play();
    theme.rewind();
  }
  if (mouseX>300 && mouseX<500 && mouseY>600 && mouseY<680) {
    exit();
  }
}
