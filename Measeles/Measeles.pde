//Global beriables
float xface, yface, widthdiamaterface, heightdiamaterface, SmallerDimension;
float xlefteye, ylefteye, eyediamater, xrighteye, yrighteye;
float xnosebridige,ynosebridige,xleftnostril,yleftnostril,xrightnostril,yrightnostril;
float xleftmouth, yleftmouth, xrightmouth, yrightmouth;
float xleftmustache, yleftmustache, xrightmustache, yrightmustache;
float xmeasle, ymeasle, measleDiameter;
float xcenter, ycenter, faceradius;
float randX, randY, rootOP;
float randSize;
color resetWhite = #FFFFFF, red = #C62000;
color backgroundcolor;
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
  xleftmustache = xlefteye;
  yleftmustache = ylefteye + 300;
  xrightmustache = xrighteye;
  yrightmustache = yrighteye + 300;
  xleftmouth = xlefteye;
  yleftmouth = ylefteye + 200;
  xrightmouth = xrighteye;
  yrightmouth = yrighteye + 200;
  //
  backgroundcolor = ( nightMode==true ) ? color (random (255), random(255), 0 )  : color (random (255), random(255), random(255) )  ;
  background(backgroundcolor);
  ellipse(xface, yface, widthdiamaterface, heightdiamaterface);
  line(xleftmouth, yleftmouth, xrightmouth, yrightmouth);
  line(xleftmustache, yleftmustache, xrightmustache, yrightmustache);
  println(heightdiamaterface);
  println(widthdiamaterface);
  println(faceradius);
  
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
  randX = random( xcenter - faceradius, xcenter + faceradius);
  randY = random(0, SmallerDimension);// if there is zero first then default
  xmeasle = randX;
  ymeasle = randY;
  rootOP = sqrt(pow((randX - xcenter),2) + pow((randY - ycenter),2));
  
  if (rootOP > faceradius) {
  xmeasle = 1000;
  ymeasle = 1000;
  } else {
  } 
  randSize = random(25, 50);
  fill(red);
  noStroke();
  measleDiameter = SmallerDimension/randSize;
  ellipse(xmeasle, ymeasle, measleDiameter, measleDiameter);
  stroke(1);
  fill(resetWhite);

}

void keyPressed () {
}

void mousePressed () {
  if ( mouseButton == LEFT) {
   color backgroundcolor =  color (random (255), random(255), random(255) )  ;
   background(backgroundcolor);
   ellipse(xface, yface, widthdiamaterface, heightdiamaterface);
  } //end lmb
  if ( mouseButton == RIGHT) {
    color backgroundcolor = color (random (255), random(255), 0 ) ;
   background(backgroundcolor);
   ellipse(xface, yface, widthdiamaterface, heightdiamaterface);
  } //end rmb
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
}
