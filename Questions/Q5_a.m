%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 5-a: Black-Scholes vs. Binomial Lattice
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

%% step one: prepare data
% % load data
% load('Data\prices');
% load('Data\dates');
% load('Data\stock');
% 
% % interest rate is fixed
% intRate = 6/100;
% 
% % list of strike prices for all the 5 call options
% % and 5 put options we have
% % note that the strike price is different from the option price
% strikePrices = [...
%     2925, 3025, 3125, 3225, 3325, ...
%     2925, 3025, 3125, 3225, 3325];
% 
% % neglect the last week as the timeToExpire (in years) becomes to small
% % and the calcuations of volatility gives errors
% neglectedDays = 30;
% 
% % data is divided to training and testing
% n = size(stock, 1);
% m = length(strikePrices);
% nTrain = int16(n/4);
% nTest = n-nTrain - neglectedDays;
% 
% % pick up a day randomly from 1+(T/4) to T
% % in this question, we need only random 1 day form the test data
% nSamples = 1;
% testIdx = int16(randperm(nTest, nSamples)) + nTrain;
% 
% % pick up a random option
% nOptions = 1;
% optionIdx = int16(randperm(m/2, nOptions));
% 
% % current price of the underlying asset
% stockPrice = stock(testIdx);
% 
% % current price of the option
% optionPrice = prices(testIdx,optionIdx);
% 
% % strike price of the option
% strikePrice = strikePrices(optionIdx);
% 
% % time untill the expiration of the option (in years)
% expTime = dates(n,optionIdx)+1 - dates(testIdx,optionIdx);
% expTime = expTime/365;
% 
% % estimate the volatility based on nTrain historical data
% % note the difference between [blsimpv] and [blkimpv]
% if (optionIdx <= 5)
%     optionType = 1;
%     optionClass = {'call'};
% else
%     optionType = 0;
%     optionClass = {'put'};
% end
% 
% % volatility is needed for pricing using Black-Scholes model
% pr = prices(testIdx-nTrain:testIdx-1, optionIdx);
% sigma = calcVolatility(pr);

%%
%return;

%% step two: pricing
% estimate the call price using Black-Scholes and Binomial Lattice

% get the price using Black-Scholes
[pCall, pPut]  = blsprice(stockPrice, strikePrice, intRate, expTime, sigma);
if (optionIdx <= 5)
    pBlack = pCall;
else
    pBlack = pPut;
end

%latticeN = double(nTrain + nTest - testIdx);
%latticeN = 10000;
%latticeInc = expTime/latticeN;
deltaValues = [5, 10, 100, 1000, 10000, 100000].^-1;
nDelta = length(deltaValues);
priceLattice = zeros(3, nDelta);
priceLattice_ = zeros(1, nDelta);

% get price using lattice with different delta_t
for i=1:nDelta
    i
    latticeInc = deltaValues(i);
    [~, pLattice] = binprice(stockPrice, strikePrice, intRate, expTime, latticeInc, sigma, optionType);            
    priceLattice(1:2,i) = pLattice(1:2,2);
    if (size(pLattice,2) > 2)
        priceLattice(3,i) = pLattice(2,3);
    end
    %priceLattice_(i) = amPutLattice(stockPrice, strikePrice, intRate , expTime , sigma, int16(expTime/latticeInc));
end

%[~, pLattice] = binprice(52, 50, 0.1, 5/12, 1/12, 0.4, 0, 0, 2.06, 3.5);
% %[AssetPrice, OptionValue] = binprice(Price, Strike, Rate, Time, Increment, Volatility, Flag, DividendRate, Dividend, ExDiv)
% 
% price  =  amPutLattice (SO, K, r , T , sigma, N);
% p,  01  =  binprice(SO,K,r,T,T/N,sigma,O); 








