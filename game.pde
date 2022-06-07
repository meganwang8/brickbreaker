void game() {
  background(darkblue);

  //bricks
  int i=0;
  while (i<n) {
    if (alive[i]==true) {
      managebrick(i);
    }
    i++;
  }

  //paddle
  fill(lightblue);
  noStroke();
  circle(px, py, pd);

  //move paddle
  if (akey==true) px=px-5;
  if (px<50) akey=false;
  if (dkey==true) px=px+5;
  if (px>750) dkey=false;

  //ball
  fill(cream);
  circle(bx, by, br);

  //moving ball
  timer=timer-1;
  if (timer<=0) {
    by=by+vy; //vertical movement
    bx=bx+vx; //horizontal movement
  }

  //collision
  if (dist(px, py, bx, by)<=br+pd/2) {
    vx=(bx-px)/15;
    vy=(by-py)/15;
    bump.play();
    bump.rewind();
  }

  //bouncing
  if (by<=br) {
    vy=vy*-1.0001;
    bump.play();
    bump.rewind();
  }
  if (bx<=br || bx>=width-br) {
    vx=vx*-1.0001;
    bump.play();
    bump.rewind();
  }
  if (by>=height-br) {
    timer=100;
    bx=width/2;
    by=600;
    lives=lives-1;
  }

  //scoring
  fill(mediumblue);
  textFont(font);
  textSize(40);
  textAlign(LEFT);
  text("score: ", 30, 770);
  text("lives: ", 650, 770);
  fill(cream);
  text(score, 150, 770);
  text(lives, 750, 770);
  if (score>=78) {
    mode=WIN;
  }
  if (lives==0) {
    mode=LOSE;
  }

  //pause button
  fill(lightblue);
  strokeWeight(3);
  tactilecircle(50, 50, 60);
  circle(50, 50, 60);
  fill(mediumblue);
  textAlign(CENTER);
  textSize(40);
  text("P", 52, 65);
}

void gameClicks() {
  if (dist(mouseX, mouseY, 60, 60)<20) {
    click.play();
    click.rewind();
    mode=PAUSE;
  }
}

void tactilecircle(int x, int y, int r) {
  if (dist(mouseX, mouseY, x, y)<r) {
    stroke(mediumblue);
  } else stroke (lightblue);
}

void managebrick(int i) {
  if (y[i]==100) fill(red);
  if (y[i]==150) fill(orange);
  if (y[i]==200) fill(yellow);
  if (y[i]==250) fill(green);
  if (y[i]==300) fill(blue);
  if (y[i]==350) fill(purple);
  if (y[i]==400) fill(pink);
  noStroke();
  circle(x[i], y[i], brickd);
  if (dist(bx, by, x[i], y[i])< bd/2+brickd/2) {
    vx=(bx-x[i])/10;
    vy=(by-y[i])/10;
    alive[i]=false;
    score=score+1;
    scoring.play();
    scoring.rewind();
  }
  i=i+1;
}
