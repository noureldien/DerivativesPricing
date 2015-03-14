%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% some old code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% there is a difference between blsimpv, blkimpv
% volt1 = blsimpv(stockPrice, strikePrice, intRate, expTime, optionPrice);
% volt2 = blkimpv(stockPrice, strikePrice, intRate, expTime, optionPrice);
% volt3 = calcBSImpVol(+1, optionPrice, stockPrice, strikePrice, expTime, intRate, 0.05);
% volt_1 = blsimpv(100, 95, 0.075, 0.25, 10);
% volt_2 = blkimpv(100, 95, 0.075, 0.25, 10);
% volt_3 = calcBSImpVol(+1, 10, 100, 95, 0.25, 0.075, 0.05);