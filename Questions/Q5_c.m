%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 5: measruing performance of Black-Scholes
%             against Binomail Lattice
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
strikePrices = [...
    2925, 3025, 3125, 3225, 3325, ...
    2925, 3025, 3125, 3225, 3325];

% neglect the last week as the timeToExpire (in years) becomes to small
% and the calcuations of volatility gives errors
neglectedDays = 10;

% data is divided to training and testing
n = size(stock, 1);
m = length(strikePrices);
nTrain = int16(n/4);
nTest = n-nTrain - neglectedDays;

% in this question, we need only random 50 days
nSamples = 80;
testIdx = int16(randperm(nTest, 140)) + nTrain;
testIdx = sort(testIdx);

errorBlack = zeros(1, nSamples);
errorLattice = zeros(1, nSamples);

% loop on the test data. for each one, calcuate the volatility
% from train data and estimate the call price and save it
for i=1:nSamples
    
    idxCurrent = testIdx(i);
    
    % current price of the underlying asset
    stockPrice = stock(idxCurrent);
    
    % pick up a random option
    nOptions = 1;
    optionIdx = int16(randperm(m/2, nOptions));
    
    % current price of the option
    optionPrice = prices(idxCurrent,optionIdx);
    
    % strike price of the option
    strikePrice = strikePrices(optionIdx);
    
    % time untill the expiration of the option (in years)
    expTime = dates(n,optionIdx)+1 - dates(idxCurrent,optionIdx);
    expTime = expTime/365;
    
    % estimate the volatility based on nTrain historical data
    % note the difference between [blsimpv] and [blkimpv]
    if (optionIdx<=5)
        optionType = 1;
        optionClass = {'call'};
    else
        optionType = -1;
        optionClass = {'put'};
    end
    
    % volatility, this is different than the implied volatility
    pr = prices(idxCurrent-nTrain:idxCurrent-1, optionIdx);
    sigma = calcVolatility(pr);
    
    % get the price using Black-Scholes
    [pCall, pPut]  = blsprice(stockPrice, strikePrice, intRate, expTime, sigma);
    if (optionIdx <= 5)
        pBlack = pCall;
    else
        pBlack = pPut;
    end
    
    % pricing using binomial lattice
    expTimeDays = dates(n,optionIdx)+1 - dates(idxCurrent,optionIdx);
    latticeInc = 1/expTimeDays;
    latticeInc
    [~, pLattice] = binprice(stockPrice, strikePrice, intRate, expTime, latticeInc, sigma, optionType);
    
    errorBlack(i) = pBlack - optionPrice;
    errorLattice(i) = pLattice(2,3) - optionPrice;
    
    i    
end







