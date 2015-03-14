%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 2-a: estimating prices using Black-Scholes model
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
strikePrices = [2925, 3025, 3125, 3225, 3325, ...
    2925, 3025, 3125, 3225, 3325];

% neglect the last week as the timeToExpire (in years) becomes to small
% and the calcuations of volatility gives errors
neglectedDays = 10;

% data is divided to training and testing
n = size(stock, 1);
m = length(strikePrices);
nTrain = int16(n/4);
nTest = n-nTrain - neglectedDays;

% list of estimated prices of put and call options
estmPrices = zeros(nTest, m);

voltValues = zeros(nTest,m);
sigmaValues = zeros(nTest,m);
vegaValues = zeros(nTest,m);
gammaValues = zeros(nTest,m);
deltaValues = zeros(nTest,m);

% loop on the test data. for each one, calcuate the volatility
% from train data and estimate the call price and save it
for i=1:nTest
    idxCurrent = nTrain +i;
    
    % current price of the underlying asset
    stockPrice = stock(idxCurrent);
    
    % loop on the 10 options we have (5 call and 5 put)
    for j=1:m
        
        % current price of the option
        optionPrice = prices(idxCurrent,j);
        
        % strike price of the option
        strikePrice = strikePrices(j);
        
        % time untill the expiration of the option (in years)
        expTime = dates(n,j)+1 - dates(idxCurrent,j);
        expTime = expTime/365;
        
        % estimate the volatility based on nTrain historical data
        % note the difference between [blsimpv] and [blkimpv]
        if (j<=5)
            optionType = 1;
            optionClass = {'call'};
        else
            optionType = -1;
            optionClass = {'put'};
        end
        volt = blkimpv(stockPrice, strikePrice, intRate, expTime, optionPrice, [], [], optionClass);
        if (isnan(volt))
            if (i>1)
                volt = lastVolt;
            else
                volt = calcBSImpVol(optionType, optionPrice, stockPrice, strikePrice, expTime, intRate, 0.05);
            end
        end        
        lastVolt = volt;
        voltValues(i,j) = volt;
        
        % volatility, this is different than the implied volatility
        sigma = calcVolatility(prices(i:nTrain+i-1, j));
        sigmaValues(i,j) = sigma;
        
        % get some parameters of the model
        vegaValues(i,j) = blsvega(stockPrice, strikePrice, intRate, expTime, sigma);
        gammaValues(i,j) = blsgamma(stockPrice, strikePrice, intRate, expTime, sigma);
        deltaValues(i,j) = blsdelta(stockPrice, strikePrice, intRate, expTime, sigma);
        
        % apply the model to get the option price        
        [pCall, pPut] = blsprice(stockPrice, strikePrice, intRate, expTime, sigma);
        if (j <= 5)
            estmPrices(i,j) = pCall;
        else
            estmPrices(i,j) = pPut;
        end
    end
    
end



