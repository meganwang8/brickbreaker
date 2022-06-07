import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Megan Wang
//2-4
//April 28, 2022

PImage[]gif;
PImage img;
PImage img2;
PImage background;
int numberOfFrames;
int f;

//colour palette
color darkblue = #457b9d;
color mediumblue = #5aa9e6;
color lightblue = #bde0fe;
color cream = #f7ede2;
color red = #ffadad;
color orange = #ffd6a5;
color yellow = #fdffb6;
color green = #caffbf;
color blue = #bde0fe;
color purple = #d8bbff;
color pink = #ffc8dd;
color black = #000000;

//MODE VARIABLES
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int WIN = 3;
final int LOSE = 4;
final int OPTIONS = 5;

//Game Variables
float bx, by, bd, br, vx, vy, px, py, pd;

//Brick Variables
int[]x;
int[]y;
int brickd;
boolean[] alive;
int n;
int tempx, tempy;

//Scoring Variables
int score, lives, timer;

//Keyboard variables
boolean akey, dkey;

PFont font;

//music
Minim minim;
AudioPlayer theme, click, bump, scoring, win, lose;

void setup() {
  size(800, 800);
  mode=WIN;
  font = createFont("Coffee Extra.otf", 100);

  //gif
  int i=0;
  numberOfFrames=21;
  gif = new PImage[numberOfFrames];

  //pictures
  img=loadImage("happycat.jpeg");
  img2=loadImage("sadcat.jpeg");
  background=loadImage("background.png");

  while (i<numberOfFrames) {
    gif[i]=loadImage("frame_"+i+"_delay-0.07s.gif");
    i=i+1;
  }

  vy=random(-6, -3);
  vy=random(3, 6);
  vx=random(-6, -3);
  vx=random(3, 6);

  px=width/2;
  py=height;
  pd=100;

  bx=width/2;
  by=600;
  br=10;

  timer=50;
  score=0;
  lives=3;

  //initialize keyboard
  akey=dkey=false;

  //bricks
  brickd=40;
  n=99;
  x=new int[n];
  y=new int[n];
  alive=new boolean[n];
  tempx=100;
  tempy=100;

  while (i<n) {
    x[i]=tempx;
    y[i]=tempy;
    alive[i]=true;
    tempx=tempx+50;
    if (tempx==width-50) {
      tempx=100;
      tempy=tempy+50;
    }
    i=i+1;
  }

  //music
  minim = new Minim(this);
  theme = minim.loadFile("duck.mp3");
  scoring = minim.loadFile("sparkle.wav");
  bump = minim.loadFile("pop.mp3");
  win = minim.loadFile("win.wav");
  lose = minim.loadFile("lose.mp3");
  click = minim.loadFile("click.mov");
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == WIN) {
    win();
  } else if (mode == LOSE) {
    lose();
  } else if (mode == OPTIONS) {
    options();
  } else {
    println("Error: Mode = " + mode);
  }
}
