%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 3: volatility vs. implied volatility
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

% load data
load('Data\prices');
load('Data\dates');
load('Data\stock');

% interest rate is fixed
intRate = 6/100;

% list of strike prices for all the 5 call options
% and 5 put options we have
% note that the strike price is different from the option price
strikePrices = [2925, 3025, 3125, 3225, 3325, 3335, 3435, 3535, 3635, 3735];

% neglect the last week as the timeToExpire (in years) becomes to small
% and the calcuations of volatility gives errors
neglectedDays = 10;

% data is divided to training and testing
n = size(stock, 1);
m = length(strikePrices);
nTrain = int16(n/4);
nTest = n-nTrain - neglectedDays;

% in this question, we need only random 30 days form
% the test data
nSamples = 100;
testIdx = int16(randperm(nTest, nSamples)) + nTrain;
testIdx = sort(testIdx);
nTest = nSamples;

voltValues = zeros(nTest,m);
sigmaValues = zeros(nTest,m);

% loop on the test data. for each one, calcuate the volatility
% from train data and estimate the call price and save it
for i=1:nTest
    
    idxCurrent = testIdx(i);
    
    % current price of the underlying asset
    stockPrice = stock(idxCurrent);
    
    % loop on the 10 options we have (5 call and 5 put)
    for j=1:m
        
        % current price of the option
        optionPrice = prices(idxCurrent,1);
        
        % strike price of the option
        strikePrice = strikePrices(j);
        
        % time untill the expiration of the option (in years)
        expTime = dates(n,1)+1 - dates(idxCurrent,1);
        expTime = expTime/365;
                
        % implied volatility
        optionType = 1;
        optionClass = {'call'};
        %volt = blkimpv(stockPrice, strikePrice, intRate, expTime, optionPrice, [], [], optionClass);
        volt = blsimpv(stockPrice, strikePrice, intRate, expTime, optionPrice, [], [], [], optionClass);
        if (isnan(volt))
            % try
            %    volt = calcBSImpVol(optionType, optionPrice, stockPrice, strikePrice, expTime, intRate, 0.05);
            % catch
            %    %volt = newt_iv(optionPrice, stockPrice, strikePrice, intRate, expTime);
            %    %disp(volt);
            %end
            volt = 0;
        end
        voltValues(i,j) = volt;
        
        % volatility, this is different than the implied volatility
        pr = prices(idxCurrent-nTrain:idxCurrent-1, 1);
        sigma = calcVolatility(pr);
        sigmaValues(i,1) = sigma;
    end
    
end

voltValues_ = [];
for i=1:nTest
     v = voltValues(i,:);
     if (isempty(v(v==0)))
         voltValues_ = [voltValues_; v];
     end
end



