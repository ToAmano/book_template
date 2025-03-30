if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="E1u-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import three;
settings.render=8;
settings.prc=false;
settings.outformat="pdf";
// unitsize(1cm);
size(8.6cm, 6.45cm);

// the camera position
currentprojection = orthographic((0,0,5.0));

//
material sphereCcolor = material(diffusepen=gray, specularpen=white); //material1
material O_color = material(diffusepen=red, specularpen=white); //material1
material cylcolor = material(diffusepen=gray, emissivepen=gray);//material2

material arrowcolor=material(diffusepen=green, emissivepen=gray);//material3

// cylinder raduis
real cylRadius = 0.02;
// point radius
real sphereRadius = 0.2;

// draw rod(line)
void drawRod(triple a, triple b) {
surface rod = extrude(scale(cylRadius)*unitcircle, axis=length(b-a)*Z);
triple orthovector = cross(Z, b-a);
if (length(orthovector) > .01) {
real angle = aCos(dot(Z, b-a) / length(b-a));
rod = rotate(angle, orthovector) * rod;
}
draw(shift(a)*rod, surfacepen=cylcolor);
}


// draw carbon(point) in
void drawCarbon(triple center) {
draw(shift(center)*scale3(sphereRadius)*unitsphere, surfacepen=sphereCcolor);
}


// draw carbon(point)
void drawOCarbon(triple center) {
draw(shift(center)*scale3(sphereRadius)*unitsphere, surfacepen=O_color);
}

// draw arrow
void drawArray(triple center, triple direction) {
triple end = center+direction;
draw(center--end, p=green+linewidth(1pt), arrow=Arrow3(5,green));

// surface rod = extrude(scale(0.08)*unitcircle, axis=length(direction)*Z);
// triple orthovector = cross(Z, direction);
// if (length(orthovector) > .01) {
// real angle = aCos(dot(Z, direction) / length(direction));
// rod = rotate(angle, orthovector) * rod;
// }
//draw(shift(center)*rod, surfacepen=arrowcolor);
}


// variable
real u = 0.304*4;
real c = 0.644*4;

// variable
triple dir = (0,0.8, 0);


// triple : an ordered triple of real components (x,y,z)
// corner and center (Ti)
triple Ti_a = (0,0,0);
triple Ti_b = (4,0,0);
triple Ti_c = (0,4,0);
triple Ti_d = (4,4,0);
triple Ti_e = (0,0,c);
triple Ti_f = (4,0,c);
triple Ti_g = (0,4,c);
triple Ti_h = (4,4,c);
triple Ti_i = (2,2,c/2);
// O
triple O_a = (2-u,2+u,c/2);
triple O_b = (2+u,2-u,c/2);
triple O_c = (u,u,0);
triple O_d = (4-u,4-u,0);
triple O_e = (u,u,c); //cと同じ
triple O_f = (4-u,4-u,c); //dと同じ



// lines
drawRod(Ti_a,O_c);
drawRod(Ti_d,O_d);
drawRod(Ti_c,O_a);
drawRod(Ti_b,O_b);

drawRod(Ti_e,O_e);
drawRod(Ti_h,O_f);
drawRod(Ti_g,O_a);
drawRod(Ti_f,O_b);



drawRod(Ti_i,O_a);
drawRod(Ti_i,O_b);
drawRod(Ti_i,O_c);
drawRod(Ti_i,O_d);
drawRod(Ti_i,O_e);
drawRod(Ti_i,O_f);



// points
drawCarbon(Ti_a);
drawCarbon(Ti_b);
drawCarbon(Ti_c);
drawCarbon(Ti_d);
drawCarbon(Ti_e);
drawCarbon(Ti_f);
drawCarbon(Ti_g);
drawCarbon(Ti_h);
drawCarbon(Ti_i);
drawOCarbon(O_a);
drawOCarbon(O_b);
drawOCarbon(O_c);
drawOCarbon(O_d);
drawOCarbon(O_e);
drawOCarbon(O_f);



// Frame
material framecolor = material(diffusepen=black); // material3
void drawFrame(triple a, triple b) {
surface rod = extrude(scale(.1*cylRadius)*unitcircle, axis=length(b-a)*Z);
triple orthovector = cross(Z, b-a);
if (length(orthovector) > .01) {
real angle = aCos(dot(Z, b-a) / length(b-a));
rod = rotate(angle, orthovector) * rod;
}
draw(shift(a)*rod, surfacepen=framecolor);
draw(shift(b)*scale3(cylRadius)*unitsphere, surfacepen=framecolor);
}
drawFrame(Ti_a,Ti_b);
drawFrame(Ti_a,Ti_c);
drawFrame(Ti_b,Ti_d);
drawFrame(Ti_c,Ti_d);

drawFrame(Ti_a,Ti_e);
drawFrame(Ti_b,Ti_f);
drawFrame(Ti_c,Ti_g);
drawFrame(Ti_d,Ti_h);


drawFrame(Ti_e,Ti_f);
drawFrame(Ti_e,Ti_g);
drawFrame(Ti_f,Ti_h);
drawFrame(Ti_g,Ti_h);

// arrows
real length=1.5;
drawArray(Ti_a,length*(1.939489e-01, -1.939489e-01,0));
drawArray(Ti_b,length*(1.939489e-01, -1.939489e-01,0));
drawArray(Ti_c,length*(1.939489e-01, -1.939489e-01,0));
drawArray(Ti_d,length*(1.939489e-01, -1.939489e-01,0));
drawArray(Ti_e,length*(1.939489e-01, -1.939489e-01,0));
drawArray(Ti_f,length*(1.939489e-01, -1.939489e-01,0));
drawArray(Ti_g,length*(1.939489e-01, -1.939489e-01,0));
drawArray(Ti_h,length*(1.939489e-01, -1.939489e-01,0));
drawArray(Ti_i,length*(4.187949e-01, -4.187949e-01,0));
drawArray(O_a,length*(-2.256724e-01, 2.256723e-01,0));
drawArray(O_b,length*(-2.256723e-01, 2.256724e-01,0));
drawArray(O_c,length*(-3.042521e-01, 3.042521e-01,0));
drawArray(O_d,length*(-3.042521e-01, 3.042521e-01,0));

//drawArray(O_e,-dir);
//drawArray(O_f,-dir);

//4.187949e-01, -4.187949e-01
//1.939489e-01, -1.939489e-01
//-2.256724e-01, 2.256723e-01
//-2.256723e-01, 2.256724e-01
//-3.042521e-01, 3.042521e-01
//-3.042521e-01, 3.042521e-01

real l=4.5;
draw((l,l,0)--(0,l,0),white);
draw((l,l,0)--(l,l,0),white);
draw((-0.5,-0.5,0)--(0,l,0),white);
draw((-0.5,-0.5,0)--(0,l,0),white);

// axis arrows

triple Origin = (-0.5,-0.5,0);
triple X = (0.6,-0.5,0);
triple Y = (-0.5,0.6,0);
triple Xlabel = (1.0,-0.4,0);
triple Ylabel = (-0.4,1.0,0);

// draw(Origin--X, black, Arrow3);
// draw(Origin--Y, black, Arrow3);
// label("$x$",Xlabel);
// label("$y$",Ylabel);

