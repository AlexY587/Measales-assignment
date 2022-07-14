//Global beriables
float xface, yface, widthdiamaterface, heightdiamaterface;
float xlefteye, ylefteye, eyediamater, xrighteye, yrighteye;
float xnosebridige,ynosebridige,xleftnostril,yleftnostril,xrightnostril,yrightnostril;
float xleftmouth, yleftmouth, xrightmouth, yrightmouth;
float xmeasle, ymeasle, measleDiameter;
//
void setup () 
{
  size(800, 600);
  xface = width/2;
  yface = height/2;
  float SmallerDimension;
  if (width >= height) {
  SmallerDimension = height;
  } else {
  SmallerDimension = width;
  } 
  widthdiamaterface = SmallerDimension;
  heightdiamaterface = SmallerDimension;
  xlefteye = widthdiamaterface/3;
  ylefteye = heightdiamaterface/3;
  eyediamater = 50;
  xrighteye = widthdiamaterface;
  yrighteye = heightdiamaterface/3;
  xnosebridige = widthdiamaterface/1.5;
  ynosebridige = heightdiamaterface/3 + 100;
  xleftnostril = xlefteye + 100;
  yleftnostril = heightdiamaterface/3 + 150;
  xrightnostril = xrighteye - 60;
  yrightnostril = heightdiamaterface/3 + 150;
  //xleftmouth = ;
  //yleftmouth = ;
  //xrightmouth = ;
  //yrightmouth = ;
 // xmeasle = ;
  //ymeasle = ;
  //measleDiameter = ;
  
  
}

void draw () 
{
  ellipse(xface, yface, widthdiamaterface, heightdiamaterface);
  ellipse(xlefteye, ylefteye, eyediamater, eyediamater);
  ellipse(xrighteye, yrighteye, eyediamater, eyediamater);
  triangle(xnosebridige,ynosebridige,xleftnostril,yleftnostril,xrightnostril,yrightnostril);
  line(xleftmouth, yleftmouth, xrightmouth, yrightmouth);
  ellipse(xmeasle, ymeasle, measleDiameter, measleDiameter);

}

void keyPressed () {}

void mousePressed () {}
