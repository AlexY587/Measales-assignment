//Global beriables
float xface, yface, widthdiamaterface, heightdiamaterface, SmallerDimension;
float xlefteye, ylefteye, eyediamater, xrighteye, yrighteye, pupildiamater;
float xnosebridige,ynosebridige,xleftnostril,yleftnostril,xrightnostril,yrightnostril;
float xleftmouth, yleftmouth, xrightmouth, yrightmouth;
float xleftmustache, yleftmustache, xrightmustache, yrightmustache;
float xmeasle, ymeasle, measleDiameter;
float xcenter, ycenter, faceradius;
float randX, randY, rootOP;
float randSize;
float nightbuttonX, nightbuttonY,nightbuttonWidth, nightbuttonHeight;
float startbuttonX, startbuttonY, startbuttonWidth, startbuttonHeight;
float quitX, quitY, quitWidth, quitHeight;
color resetWhite = #FFFFFF, red = #C62000, black = #000005, green = #0EFF03, colorvariable, grey = #B4AFAF;
color backgroundcolor;
Boolean nightMode=false, started = false, usure = false;
int thick=50, reset=1;
String title = "MEASELS!", nightbuttonText = "NightMode", nightbuttonSwitch = "", startbuttonText = "BEGIN THE MEASELS", quitbuttonText = "Quit";
float titleX, titleY, titleWidth, titleHeight;
PFont titlefont;
color blue=#0027FC, resetdefualtink=#FFFFFF, nightTint=#FFFFFF, tintButton=#835600;//nightmode friendly
color fillButtonNight=#FFFFFF, fillButtonStart=#FFFFFF, fillButtonQuit=#FFFFFF;
int titleSize, nightTitlesize, startTitlesize, quitTitlesize;
float imageX, imageY, imagewidth, imageheight, picWidthAdjusted, picHeightAdjusted;
Boolean widthLarger = false, heightLarger = false;
float imageLargerDimension, imageSmallerDimension;
float imageWidthRatio, imageHeightRatio;
PImage pic;
//
void setup () 
{
 size(800, 600);
populatingVariables();

}

void draw () 
{
  if (mouseX>nightbuttonX && mouseX<nightbuttonX+nightbuttonWidth && mouseY>nightbuttonY && mouseY<nightbuttonY+nightbuttonWidth) {
    if (nightMode == true) {
      fillButtonNight = tintButton;
    } else {
    fillButtonNight = grey;
    }
  } else {
    fillButtonNight = nightTint;
  } //endhoverover
    if (mouseX>startbuttonX && mouseX<startbuttonX+startbuttonWidth && mouseY>startbuttonY && mouseY<startbuttonY+startbuttonWidth) {
    if (nightMode == true) {
      fillButtonStart = tintButton;
    } else {
    fillButtonStart = grey;
    }
  } else {
    fillButtonStart = nightTint;
  } //endhoverover
    if (mouseX>quitX && mouseX<quitX+quitWidth && mouseY>quitY && mouseY<quitY+quitWidth) {
    if (nightMode == true) {
      fillButtonQuit = tintButton;
    } else {
    fillButtonQuit = grey;
    }
  } else {
    fillButtonQuit = nightTint;
  } //endhoverover
    nightTitlesize = 20;
  fill(fillButtonNight);
  rect(nightbuttonX, nightbuttonY, nightbuttonWidth, nightbuttonHeight);
  fill(black);
  textFont(titlefont, nightTitlesize);
  textAlign(TOP ,TOP );
  text(nightbuttonText, nightbuttonX, nightbuttonY, nightbuttonWidth, nightbuttonHeight);
  fill(resetWhite);
  //nightbutton
  if (nightMode == false) {
    nightbuttonSwitch = "OFF";
    colorvariable = red;
  } else {
  nightbuttonSwitch = "ON";
  colorvariable = green;
  }
  nightTitlesize = 20;
  fill(nightTint);
  fill(fillButtonNight);
  rect(nightbuttonX, nightbuttonY, nightbuttonWidth, nightbuttonHeight);
  fill(black);
  textFont(titlefont, nightTitlesize);
  textAlign(TOP ,TOP );
  text(nightbuttonText, nightbuttonX, nightbuttonY, nightbuttonWidth, nightbuttonHeight);
  fill(resetWhite);
  fill(colorvariable);
  textAlign(CENTER, CENTER);
  text(nightbuttonSwitch, nightbuttonX, nightbuttonY, nightbuttonWidth, nightbuttonHeight);
  fill(resetWhite);
  //start
  quitTitlesize = 20;
  fill(fillButtonQuit);
  rect(quitX, quitY, quitWidth, quitHeight);
  fill(black);
  textFont(titlefont, quitTitlesize);
  text(quitbuttonText,quitX, quitY, quitWidth, quitHeight);
  textAlign(CENTER, CENTER);
  fill(resetWhite);
  //
  //start
  startTitlesize = 20;
  fill(fillButtonStart);
  rect(startbuttonX, startbuttonY, startbuttonWidth, startbuttonHeight);
  fill(black);
  textFont(titlefont, startTitlesize);
  text(startbuttonText, startbuttonX, startbuttonY, startbuttonWidth, startbuttonHeight);
  textAlign(CENTER, CENTER);
  fill(resetWhite);
  //
  line(xleftmustache, yleftmustache, xrightmustache, yrightmustache);
  //
  fill(nightTint);
  ellipse(xlefteye, ylefteye, eyediamater, eyediamater);
  ellipse(xrighteye, yrighteye, eyediamater, eyediamater);
  fill(black);
  ellipse(xlefteye, ylefteye, pupildiamater, pupildiamater);
  ellipse(xrighteye, yrighteye, pupildiamater, pupildiamater);
  fill(resetWhite);
  //
  fill(nightTint);
  triangle(xnosebridige,ynosebridige,xleftnostril,yleftnostril,xrightnostril,yrightnostril);
  strokeCap(SQUARE);
  strokeWeight(thick);
  line(xleftmouth, yleftmouth, xrightmouth, yrightmouth);
  strokeWeight(reset);
  fill(resetWhite);
  //
  randX = random( xcenter - faceradius, xcenter + faceradius);
  randY = random(0, SmallerDimension);// if there is zero first then default
  xmeasle = randX;
  ymeasle = randY;
  rootOP = sqrt(pow((randX - xcenter),2) + pow((randY - ycenter),2));//Calculates distance between point (randX, randY) and point (xcenter, ycenter)
  if (rootOP > faceradius) {//Uses if else statement to compare distance and radius of the face
  //if the distance is bigger than the radius then nothing happens
  } else {
  randSize = random(25, 50);
  measleDiameter = SmallerDimension/randSize;
  if (started == false) {
    
  } else {//if the distance is smaller then draw the measels
  fill(red);
  noStroke();
  ellipse(xmeasle, ymeasle, measleDiameter, measleDiameter);
  stroke(1);
  fill(resetWhite);
  }

  } 
image(pic,imageX, imageY, picHeightAdjusted, picWidthAdjusted);
}

void keyPressed () {
}

void mousePressed () {
  if(mouseX>nightbuttonX && mouseX<nightbuttonX+nightbuttonWidth && mouseY>nightbuttonY && mouseY<nightbuttonY+nightbuttonWidth) {
   if ( mouseButton == LEFT) {
   color backgroundcolor =  color (random (255), random(255), random(255) )  ;
   background(backgroundcolor);
   fill(nightTint);
   ellipse(xface, yface, widthdiamaterface, heightdiamaterface);
   fill(resetWhite);
   if (nightMode == false) {
     nightMode = true;
     nightTint = #FF8503;
     fill(nightTint);
     ellipse(xface, yface, widthdiamaterface, heightdiamaterface);
     fill(resetWhite);
   } else {
     nightMode = false;
     nightTint = #FFFFFF;
     ellipse(xface, yface, widthdiamaterface, heightdiamaterface);
   }
  } //end lmb
  }
   if(mouseX>startbuttonX && mouseX<startbuttonX+startbuttonWidth && mouseY>startbuttonY && mouseY<startbuttonY+startbuttonWidth) {
   if ( mouseButton == LEFT) {
    if (started == false) {
     started = true;
     startbuttonText = "STOP THE MEASELS";
   } else {
     started = false;
     startbuttonText = "BEGIN THE MEASELS";
   }
  } //end lmb 
   }
   if(mouseX>quitX && mouseX<quitX+quitWidth && mouseY>quitY && mouseY<quitY+quitWidth) {
   if ( mouseButton == LEFT) {
    if (usure == false) {
     usure = true;
     quitbuttonText = "Are You Sure?";
   } else {
     exit();
   
   }
   }
   }
  /*if ( mouseButton == RIGHT) {
    color backgroundcolor = color (random (255), random(255), 0 ) ;
   background(backgroundcolor);
   ellipse(xface, yface, widthdiamaterface, heightdiamaterface);
   nightMode = true;
  } //end rmb/*
  //if ( mouseButton == WHEEL) {}
  //
  /*
  if(nightMode==false) {
    nightMode = true;
  } else {
    nightMode = false;
  } //end night mode
   backgroundcolor = ( nightMode==true ) ? color (random (255), random(255), 0 )  : color (random (255), random(255), random(255) )  ;
   background(backgroundcolor);
   ellipse(xface, yface, widthdiamaterface, heightdiamaterface);
   color backgroundcolor = ( nightMode==true ) ? color (random (255), random(255), 0 )  : color (random (255), random(255), random(255) )  ;
   background(backgroundcolor);
  */
}//End mousepressed
