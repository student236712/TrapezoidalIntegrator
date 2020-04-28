%This script is used to show dependency between number of trapezoids 
%used do calculate integral of sin(x) in range (0,pi) 
%and search point where accuracy is less than 0.1 [%]


analyticalResult = 2;
givenAccuracyThreshold = 0.1;

%Create linear spacing vector between 5 and 100 to have variety of
%trapezoids numbers
numberOfTrapezoidsVector = linspace(5,100);

counter = length(numberOfTrapezoidsVector);

%Prealocate vector for results of another interations of integration  
integrationResults = zeros(1,counter);

%Prealocate vector for numbers of trapezoids
numbersOfTrapezoids =  zeros(1,counter);

%Prealocate vector for values of accuracy in each iteration
accuracy = zeros(1,counter);

%Create vectors for constant values - used in plots drawing
analyticalLine = ones(1,counter)*analyticalResult;
givenAccuracyThresholdLine = ones(1,counter)*givenAccuracyThreshold;

%Do integration with another number of steps and the same range in each
for i = 1:counter
    [integrationResult,numberOfTrapezoids] = trapezoidalIntegration(0,pi,numberOfTrapezoidsVector(i));
    integrationResults(i) = integrationResult;
    numbersOfTrapezoids(i) = numberOfTrapezoids;
    %Calculate value of accuracy using relative error
    accuracy(i) = abs(integrationResult-analyticalResult)*100/analyticalResult;
end

%Find first point where accuracy is less than given treshold
k = find(accuracy < givenAccuracyThreshold,1,'first');

%Find ammount of trapezoids that gives result under the accuracy treshold
%and create it's help line
foundTrapezoidsNumberLineX = ones(1,counter)*numbersOfTrapezoids(k);

%Create help line for plot
foundTrapezoidsNumberLineY = linspace(0,3);

%Create two plots in one figure
subplot(2,1,2)
plot(numbersOfTrapezoids,givenAccuracyThresholdLine,'r--',...
foundTrapezoidsNumberLineX,foundTrapezoidsNumberLineY,'g--',...
numbersOfTrapezoids,accuracy);
xlabel('Number of trapezoids')
ylabel('Accuracy [%]')
legend 'Given accuracy treshold' 'Trapezoids ammount that gives result under the accuracy treshold'
ylim([0 3])
xlim([5 100])

subplot(2,1,1)
plot(numbersOfTrapezoids,analyticalLine,'r--',foundTrapezoidsNumberLine,...
    foundTrapezoidsNumberLineY,'g--',numbersOfTrapezoids,integrationResults);
ylim([analyticalResult-0.15 analyticalResult+0.05])
xlim([5 100])
xlabel('Number of trapezoids')
ylabel('Integration result')
legend 'Analytical result' 'Trapezoids ammount that gives result under the accuracy treshold'


