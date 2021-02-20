function [b]=multidegelev(p,d)
n=size(p,2); %The number of points of control polygon p.
k=size(p,1); %The dimension of the points.
if k==2
   plot(p(1,:),p(2,:),'--') %I draw the control polygon.
else
   plot3(p(1,:),p(2,:),p(3,:),'--')
end
newpoints(:,1)=p(:,1); %The first control point after d-degree elevations
                       %will be the same.
   for j=n:n+d-1 %I want to calculate the new control points for every
                 %single degree elevation.
       newpoints(:,j+1)=p(:,n); %The last points remains as it is.
       for i=2:j
           newpoints(:,i)=(i-1)/(n)*p(:,i-1)+(1-(i-1)/(n))*p(:,i);
       end
       p=newpoints; %Now the control polygon p is consisted of the new
                    %control points "newpoints".
       n=size(p,2); %The size of the new control polygon p,
                    %which is being increased by 1 degree after every.
                    %loop of j.The final size of p is n+d.
   end
b=p;
hold all
s=size(b,1); %The dimension of the new control points.
if s==2
   plot(b(1,:),b(2,:),'--') %I draw the new control polygon.
else
   plot3(b(1,:),b(2,:),b(3,:),'--')
end
legend('before','after')
grid
end
