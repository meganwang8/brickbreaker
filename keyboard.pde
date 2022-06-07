void keyPressed() {
  if (key=='a'||key=='A') akey=true;
  if (px<50) akey=false;
  if (key=='d'||key=='d') dkey=true;
  if (px>750) dkey=false;
}

void keyReleased() {
  if (key=='a'||key=='A') akey=false;
  if (key=='d'||key=='D') dkey=false;
}
