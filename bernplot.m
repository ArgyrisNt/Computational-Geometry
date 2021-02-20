function b=bernplot(n) %I define a function "bernplot" which gets as an
                       %input a number n.
t=0:0.0005:1; 
%I start a loop in which the variable i runs from 0 to n,because
%I want to draw all the Bernstein polynomials of degree n.(B0n,...,Bnn).
for i=0:n %I write the formula for Bernstein polynomials.
    b=(factorial(n)./(factorial(i).*factorial(n-i))).*(1-t).^(n-i).*t.^i;
    plot(t,b)
    hold all
end
grid
end
