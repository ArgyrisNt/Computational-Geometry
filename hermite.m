function [b]=hermite(p1,v1,w1,w2,v2,p2)
p=[p1,v1,w1,w2,v2,p2];
t=0:1;
%I apply the Hermite Interpolation and I find the control polygon of the
%5-th Bezier curve that interpolates the points p1,p2 with the desired
%first and second derivatives.
%The point of the Bezier curve at time t=0 is p1 and at time t=1 is p2.
b(:,1)=p(:,1);
b(:,6)=p(:,2);
%Now I calculate the rest of the control points,according to
%the formulas that we have proved during the lecture.
%I define the derivatives as follows: x'(0)=v1,x"(0)=w1,x'(1)=v2,x"(1)=w2.
b(:,2)=p1+v1./5; 
b(:,3)=p1+(2*v1)./5+w1./20;
b(:,4)=p2-(2*v2)./5+w2./20;
b(:,5)=p2-v2./5;
%The control polygon of the Bezier curve.
b;
k=size(b,1); %The dimension of the control points.
if k==2
   plot(b(1,:),b(2,:),'--') %I draw the control polygon.
else
   plot3(b(1,:),b(2,:),b(3,:),'--')
end
grid
end
