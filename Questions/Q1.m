%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 1-a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% use the brownian motion to predict the strike
% price of the call/put options and compare it
% to the trader's strike prices (for call/put)
% and get his profit/loss

clc;

% load data
load('Data\prices.mat');
load('Data\dates.mat');
load('Data\stock.mat');

% globally, interet rate is 6.0% = 0.06
segma = 6/100;

[M,N] = size(prices);

% how many options we have (from each type: call and put)
mOptions = N/2;

% get the prices of the call options
%priceCO = 
%ast = options(1:nPrices)

figure(1); clf;
hold on;
grid on;
box on;
for i=1:mOptions
    plot(price, 'b');
end








