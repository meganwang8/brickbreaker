void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == WIN) {
    winClicks();
  } else if (mode == LOSE) {
    loseClicks();
  } else if (mode == OPTIONS) {
    optionsClicks();
  } else {
    println("Error: Mode = " + mode);
  }
}
