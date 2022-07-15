//Global beriables
float xface, yface, widthdiamaterface, heightdiamaterface, SmallerDimension;
float xlefteye, ylefteye, eyediamater, xrighteye, yrighteye;
float xnosebridige,ynosebridige,xleftnostril,yleftnostril,xrightnostril,yrightnostril;
float xleftmouth, yleftmouth, xrightmouth, yrightmouth;
float xmeasle, ymeasle, measleDiameter;
float xcenter, ycenter, faceradius;
color resetWhite = #FFFFFF, red = #C62000;
Boolean nightMode=false;
int thick=50, reset=1;
//
void setup () 
{
  size(800, 600);
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
  xlefteye = widthdiamaterface/2.5;
  ylefteye = heightdiamaterface/3.5;
  eyediamater = 75;
  xrighteye = widthdiamaterface/1.05;//this eye is not completly symetrical, i left it like this to give a bit of realisim to the face
  yrighteye = heightdiamaterface/3.5;
  xnosebridige = widthdiamaterface/1.5;
  ynosebridige = heightdiamaterface/3 + 10;
  xleftnostril = xlefteye + 100;
  yleftnostril = heightdiamaterface/3 + 150;
  xrightnostril = xrighteye - 100;
  yrightnostril = heightdiamaterface/3 + 150;
  xleftmouth = xlefteye;
  yleftmouth = ylefteye + 300;
  xrightmouth = xrighteye;
  yrightmouth = yrighteye + 300;
  measleDiameter = SmallerDimension*1/random(50, 15);
  //
 
  color backgroundcolor = ( nightMode==true ) ? color (random (255), random(255), 0 )  : color (random (255), random(255), random(255) )  ;
  background(backgroundcolor);
  ellipse(xface, yface, widthdiamaterface, heightdiamaterface);
  line(xleftmouth, yleftmouth, xrightmouth, yrightmouth);
  
  
}

void draw () 
{
  ellipse(xlefteye, ylefteye, eyediamater, eyediamater);
  ellipse(xrighteye, yrighteye, eyediamater, eyediamater);
  triangle(xnosebridige,ynosebridige,xleftnostril,yleftnostril,xrightnostril,yrightnostril);
  strokeCap(SQUARE);
  strokeWeight(thick);
  line(xleftmouth, yleftmouth, xrightmouth, yrightmouth);
  strokeWeight(reset);
  xmeasle = random( xcenter - faceradius, xcenter + faceradius);
  ymeasle = random(0, SmallerDimension);// if there is zero first then default
  fill(red);
  noStroke();
  ellipse(xmeasle, ymeasle, measleDiameter, measleDiameter);
  stroke(1);
  fill(resetWhite);

}

void keyPressed () {
}

void mousePressed () {
  if(nightMode==false) {
    nightMode = true;
  } else {
    nightMode = false;
  
  } //end night mode
  /*
  color backgroundcolor = ( nightMode==true ) ? color (random (255), random(255), 0 )  : color (random (255), random(255), random(255) )  ;
  background(backgroundcolor);
  */
}
