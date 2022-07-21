void populatingVariables() {
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
  pupildiamater = 45;
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
