if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="lattice_system-1";
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
size(8.6cm);

// the camera position
currentprojection = orthographic((0,0,5.0));

//
material sphereCcolor = material(diffusepen=gray, specularpen=white); //material1
material O_color = material(diffusepen=blue, specularpen=white); //material1
material cylcolor = material(diffusepen=gray, emissivepen=gray);//material2

material unitcylcolor = material(diffusepen=red, emissivepen=red);


material arrowcolor=material(diffusepen=green, emissivepen=gray);//material3

// cylinder raduis
real cylRadius = 0.02;
// point radius
real sphereRadius = 0.15;

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

// draw RED rod(line)
void drawRedRod(triple a, triple b) {
surface rod = extrude(scale(cylRadius)*unitcircle, axis=length(b-a)*Z);
triple orthovector = cross(Z, b-a);
if (length(orthovector) > .01) {
real angle = aCos(dot(Z, b-a) / length(b-a));
rod = rotate(angle, orthovector) * rod;
}
draw(shift(a)*rod, surfacepen=unitcylcolor);
}



// draw carbon(point) in
void drawCarbon(triple center) {
draw(shift(center)*scale3(sphereRadius)*unitsphere, surfacepen=sphereCcolor);
}


// draw carbon(point), red color
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

//////////////////////////////////////
// 以下が実際の描画に関すること
/////////////////////////////////////


// variable
real u = 0.304*4;
real c = 0.644*4;

// variable
real ix = 0.6;
real iy = 0.7;
real jx = 1.3;
real jy = 0.4;
real kx = 0.3;
real ky = 1.5;
real lx = 1.7;
real ly = 1.4;

// variable
triple dir = (0,0.8, 0);


// triple : an ordered triple of real components (x,y,z)
// lattice points
triple P_a = (0,0,0);
triple P_b = (0,1,0);
triple P_c = (1,0,0);
triple P_d = (1,1,0);
triple P_e = (0,2,0);
triple P_f = (1,2,0);
triple P_g = (2,0,0);
triple P_h = (2,1,0);
triple P_i = (2,2,0);
triple P_j = (0,3,0);
triple P_k = (1,3,0);
triple P_l = (2,3,0);
triple P_m = (3,0,0);
triple P_n = (3,1,0);
triple P_o = (3,2,0);
triple P_p = (3,3,0);
triple P_q = (0,4,0); // 角
triple P_r = (1,4,0);
triple P_s = (2,4,0);
triple P_t = (3,4,0);
triple P_u = (4,0,0); //角
triple P_v = (4,1,0);
triple P_w = (4,2,0);
triple P_x = (4,3,0);
triple P_y = (4,4,0); // 角


//// inner lattice points
// 1st lattice
triple Q_a = (ix,iy,0);
triple Q_b = (jx,jy,0);
triple Q_c = (kx,ky,0);
triple Q_d = (lx,ly,0);
// 2-4 lattice
triple Q_e = (2+ix,iy,0);
triple Q_f = (2+jx,jy,0);
triple Q_g = (2+kx,ky,0);
triple Q_h = (2+lx,ly,0);
triple Q_i = (ix,2+iy,0);
triple Q_j = (jx,2+jy,0);
triple Q_k = (kx,2+ky,0);
triple Q_l = (lx,2+ly,0);
triple Q_m = (2+ix,2+iy,0);
triple Q_n = (2+jx,2+jy,0);
triple Q_o = (2+kx,2+ky,0);
triple Q_p = (2+lx,2+ly,0);



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


////// surfaces
path3 H1 = plane((2,0,0),(0,2,0),(0,0,0));
draw(shift(0,0,0)*surface(H1),
surfacepen=cyan+opacity(0.60));


///// lines

// 外枠
drawRod(P_b,P_q);
drawRod(P_c,P_u);
drawRod(P_q,P_y);
drawRod(P_u,P_y);

// 内縦線
drawRod(P_d,P_r);
drawRod(P_g,P_s);
drawRod(P_m,P_t);

// 内横線
drawRod(P_d,P_v);
drawRod(P_e,P_w);
drawRod(P_j,P_x);

// unitcell
drawRedRod(P_a,P_b);
drawRedRod(P_a,P_c);
drawRedRod(P_b,P_d);
drawRedRod(P_c,P_d);


// points
// drawCarbon(Ti_a);
// drawCarbon(Ti_b);
// drawCarbon(Ti_c);
// drawCarbon(Ti_d);
// drawCarbon(Ti_e);
// drawCarbon(Ti_f);
// drawCarbon(Ti_g);
// drawCarbon(Ti_h);
// drawCarbon(Ti_i);
drawOCarbon(P_a);
drawOCarbon(P_b);
drawOCarbon(P_c);
drawOCarbon(P_d);
drawOCarbon(P_e);
drawOCarbon(P_f);
drawOCarbon(P_g);
drawOCarbon(P_h);
drawOCarbon(P_i);
drawOCarbon(P_j);
drawOCarbon(P_k);
drawOCarbon(P_l);
drawOCarbon(P_m);
drawOCarbon(P_n);
drawOCarbon(P_o);
drawOCarbon(P_p);
drawOCarbon(P_q);
drawOCarbon(P_r);
drawOCarbon(P_s);
drawOCarbon(P_t);
drawOCarbon(P_u);
drawOCarbon(P_v);
drawOCarbon(P_w);
drawOCarbon(P_x);
drawOCarbon(P_y);

drawOCarbon(Q_a);
drawOCarbon(Q_b);
drawOCarbon(Q_c);
drawOCarbon(Q_d);
drawOCarbon(Q_e);
drawOCarbon(Q_f);
drawOCarbon(Q_g);
drawOCarbon(Q_h);
drawOCarbon(Q_i);
drawOCarbon(Q_j);
drawOCarbon(Q_k);
drawOCarbon(Q_l);
drawOCarbon(Q_m);
drawOCarbon(Q_n);
drawOCarbon(Q_o);
drawOCarbon(Q_p);


// x,y axis/label
triple Origin = (-0.5,-0.5,0);
triple X = (0.5 ,-0.5,0);
triple Y = (-0.5, 0.5,0);
triple Xlabel = ( 1.1, -0.5,0);
triple Ylabel = (-0.5, 0.8,0);

draw(Origin--X, black, Arrow3);
draw(Origin--Y, black, Arrow3);
label("$x\, (\mu=1)$",Xlabel);
label("$y\\ (\mu=2)$",Ylabel);

//
triple atomlabel = (0.5,0.3,0);
triple atomx = (0.6,0.35,0);
triple atomy = (0.6,0.55,0);



label("atom $\kappa$", atomlabel);
draw(atomx--atomy, black, Arrow3);

triple celllabel = (1.5,1.7,0);
label("cell $l$", celllabel);



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
// drawFrame(Ti_e,Ti_f);
// drawFrame(Ti_e,Ti_g);
// drawFrame(Ti_f,Ti_h);
// drawFrame(Ti_g,Ti_h);

// arrows
// real length=1.5;
// drawArray(Ti_a,length*(1.939489e-01, -1.939489e-01,0));
// drawArray(Ti_b,length*(1.939489e-01, -1.939489e-01,0));
// drawArray(Ti_c,length*(1.939489e-01, -1.939489e-01,0));
// drawArray(Ti_d,length*(1.939489e-01, -1.939489e-01,0));
// drawArray(Ti_e,length*(1.939489e-01, -1.939489e-01,0));
// drawArray(Ti_f,length*(1.939489e-01, -1.939489e-01,0));
// drawArray(Ti_g,length*(1.939489e-01, -1.939489e-01,0));
// drawArray(Ti_h,length*(1.939489e-01, -1.939489e-01,0));
// drawArray(Ti_i,length*(4.187949e-01, -4.187949e-01,0));
// drawArray(O_a,length*(-2.256724e-01, 2.256723e-01,0));
// drawArray(O_b,length*(-2.256723e-01, 2.256724e-01,0));
// drawArray(O_c,length*(-3.042521e-01, 3.042521e-01,0));
// drawArray(O_d,length*(-3.042521e-01, 3.042521e-01,0));

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


