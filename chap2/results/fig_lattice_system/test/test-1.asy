if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="test-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(100);
import graph;
path bill = Circle((0,0),100);
real phi = 70*pi/180;
draw(bill);
pair s = (-100,0), db, dt = exp(I*phi), e = s+300*dt;
path traj = s--e;
real [] c;
for(int i=0; i<8; ++i) {
c = intersect(bill, traj);
e = point(traj, c[1]);
db = dir(bill, c[0]);
draw(s--e,blue);
dt = -dt + 2*dot(dt,db)*db;
s = e;
e = s+300*dt;
traj = (s+dt)--e;
}
