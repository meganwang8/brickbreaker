void win() {
  win.play();
  textFont(font);
  textAlign(CENTER);
  background(darkblue);
  imageMode(CORNER);
  image(background, 0, 0);

  //winning
  fill(cream);
  textSize(100);
  text("You Won!", width/2, 200);

  //picture
  imageMode(CENTER);
  image(img, width/2, 350);

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

void winClicks() {
  if (mouseX>300 && mouseX<500 && mouseY>500 && mouseY<580) {
    click.play();
    click.rewind();
    setup();
    mode=GAME;
    theme.play();
    theme.rewind();
  }
  if (mouseX>300 && mouseX<500 && mouseY>600 && mouseY<680) {
    click.play();
    click.rewind();
    exit();
  }
}
