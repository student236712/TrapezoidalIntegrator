function [integrationResult,numberOfTrapezoids] = trapezoidalIntegration(minRange,maxRange,n)
%trapezoidalIntegration - function allows integrating funtions using
%trapezoidal method
%Written as example for sinus function
%Input variables:
%minRange - minimum range of integrating
%maxRange - maximum range of integrating
%n - number of steps used to calculate integral (amount of trapezoids
%drawn)

%Create vector of n numbers in given range
X = linspace(minRange,maxRange,n);

%Calculate number of iterations
maxCounter = length(X);

%Prealocate vector for differences between following elements from X vector
deltaX = zeros(1,maxCounter);

%Prealocate vector for calculated areas values of following trapezoids 
Y = zeros(1,maxCounter);

%Calculate differences between following elements from X vector
for i = 2:maxCounter
    deltaX(i) = X(i)-X(i-1);
end

%Calculate values of trapezoids areas
for i = 2:maxCounter
   Y(i)=(sin(X(i-1))+sin(X(i)))/2*deltaX(i);
end

%Sum each value in Y vector as integration result
integrationResult = sum(Y);

numberOfTrapezoids = maxCounter;
end


