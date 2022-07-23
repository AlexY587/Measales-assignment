import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Measeles extends PApplet {

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
int resetWhite = 0xffFFFFFF, red = 0xffC62000, black = 0xff000005, green = 0xff0EFF03, colorvariable, grey = 0xffB4AFAF;
int backgroundcolor;
Boolean nightMode=false, started = false, usure = false;
int thick=50, reset=1;
String title = "MEASELS!", nightbuttonText = "NightMode", nightbuttonSwitch = "", startbuttonText = "BEGIN THE MEASELS", quitbuttonText = "Quit";
float titleX, titleY, titleWidth, titleHeight;
PFont titlefont;
int blue=0xff0027FC, resetdefualtink=0xffFFFFFF, nightTint=0xffFFFFFF, tintButton=0xff835600;//nightmode friendly
int fillButtonNight=0xffFFFFFF, fillButtonStart=0xffFFFFFF, fillButtonQuit=0xffFFFFFF;
int titleSize, nightTitlesize, startTitlesize, quitTitlesize;
float imageX, imageY, imagewidth, imageheight, picWidthAdjusted, picHeightAdjusted;
Boolean widthLarger = false, heightLarger = false;
float imageLargerDimension, imageSmallerDimension;
float imageWidthRatio, imageHeightRatio;
PImage pic;
//
public void setup () 
{
 
populatingVariables();

}

public void draw () 
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

public void keyPressed () {
}

public void mousePressed () {
  if(mouseX>nightbuttonX && mouseX<nightbuttonX+nightbuttonWidth && mouseY>nightbuttonY && mouseY<nightbuttonY+nightbuttonWidth) {
   if ( mouseButton == LEFT) {
   int backgroundcolor =  color (random (255), random(255), random(255) )  ;
   background(backgroundcolor);
   fill(nightTint);
   ellipse(xface, yface, widthdiamaterface, heightdiamaterface);
   fill(resetWhite);
   if (nightMode == false) {
     nightMode = true;
     nightTint = 0xffFF8503;
     fill(nightTint);
     ellipse(xface, yface, widthdiamaterface, heightdiamaterface);
     fill(resetWhite);
   } else {
     nightMode = false;
     nightTint = 0xffFFFFFF;
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
public void populatingVariables() {
  pic = loadImage("Top-Hat-Transparent-PNG.png");
  int picwidth = 512;
  int picheight = 512;
  if (picwidth >= picheight) {
  imageLargerDimension = picwidth;
  imageSmallerDimension = picheight;
  widthLarger = true;
} else {
  //false if portrait
  imageLargerDimension = picheight;
  imageSmallerDimension = picwidth;
  heightLarger = true;
 }//end image dimension comparison
  //Aspect Ratio
//single line ifs can be sumarazed into if else or if-else-if-else
//computer choooses which formula to execute
imageWidthRatio = 1;
imageHeightRatio = 1;
if (widthLarger == true) imageWidthRatio = imageLargerDimension / imageLargerDimension;
if (widthLarger == true) imageHeightRatio = imageSmallerDimension / imageLargerDimension;
if (heightLarger == true) imageWidthRatio = imageSmallerDimension / imageLargerDimension;
if (heightLarger == true) imageHeightRatio = imageLargerDimension / imageLargerDimension;
//
//answers must be 1.0 and between 0 and 1 decomal
//Ratio of 1.0 similar to style="width:100%" (websites)
//println also verifies decimal places
//ratio of 0-1 similar to style="height:ratio" (websites)
//
//Population
imageX = width/8;
imageY = -height/1.2f;
imagewidth = width-1;//Canvas (0,0) means point doesnt match to rectangle missing outline on two sides
imageheight = height-1;
//
//Combunatuin of population of image with population of rect()
//adjusted image variabels for aspect ratio, entire image will be smaller
picWidthAdjusted = imagewidth * imageWidthRatio;
picHeightAdjusted = imageheight * imageHeightRatio;
println(imageX, imageY, picWidthAdjusted, picHeightAdjusted);
  xface = width/2;
  yface = height/2;
  if (width >= height) {
  SmallerDimension = height;
  } else {
  SmallerDimension = width;
  } 
  xcenter = width/2;
  ycenter = height/2;
  faceradius = SmallerDimension/2;
  widthdiamaterface = SmallerDimension;
  heightdiamaterface = SmallerDimension;
  xlefteye = widthdiamaterface/2.5f;
  ylefteye = heightdiamaterface/3.5f;
  eyediamater = 75;
  pupildiamater = 45;
  xrighteye = widthdiamaterface/1.05f;//this eye is not completly symetrical, i left it like this to give a bit of realisim to the face
  yrighteye = heightdiamaterface/3.5f;
  xnosebridige = widthdiamaterface/1.5f;
  ynosebridige = heightdiamaterface/3 + 10;
  xleftnostril = xlefteye + 100;
  yleftnostril = heightdiamaterface/3 + 150;
  xrightnostril = xrighteye - 100;
  yrightnostril = heightdiamaterface/3 + 150;
  xleftmustache = xlefteye;
  yleftmustache = ylefteye + 300;
  xrightmustache = xrighteye;
  yrightmustache = yrighteye + 300;
  xleftmouth = xlefteye;
  yleftmouth = ylefteye + 200;
  xrightmouth = xrighteye;
  yrightmouth = yrighteye + 200;
  nightbuttonX = xcenter - 400;
  nightbuttonY = ycenter + 200;
  nightbuttonWidth = 100;
  nightbuttonHeight = 100;
  startbuttonX = nightbuttonX;
  startbuttonY = ycenter + 50;
  startbuttonWidth = 100;
  startbuttonHeight = 100;
  quitX = nightbuttonX;
  quitY = ycenter - 125;
  quitWidth = 100; 
  quitHeight = 100;
  //
  backgroundcolor = ( nightMode==true ) ? color (random (255), random(255), 0 )  : color (random (255), random(255), random(255) )  ;
  background(backgroundcolor);
  fill(nightTint);
  ellipse(xface, yface, widthdiamaterface, heightdiamaterface);
  line(xleftmouth, yleftmouth, xrightmouth, yrightmouth);
  line(xleftmustache, yleftmustache, xrightmustache, yrightmustache);
  println(heightdiamaterface);
  println(widthdiamaterface);
  println(faceradius);
  fill(resetWhite);
  //rect( xcenter - faceradius, 0,2*faceradius, SmallerDimension );
  titleX = width*1/5;
titleY = height*0;
titleWidth = width*3/5;
titleHeight = height*1/10;
//
//Single Executed Code
//Fonts form Os or Operating System
//String[] fontList = PFont.list(); // to list all fonts available on os
//printArray(fontList);
titlefont = createFont("Times New Roman", 60);//verifiy font existince in Processing.JAVA
//Tools / Create Font / Find Font in list to verify / Do not press "OK", known bug
//
//Layout text space and typographical featured
}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Measeles" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
