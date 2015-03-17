function [ put_value, put_range ] = mCarlo( stockPrice, strikePrice, intRate, expTime, sigma )

% Pricing European Put Option Using Monte Carlo

%%%%%%%%%% Monte-Carlo Method Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % Repeatable trials on/off
%randn('state',0);
% Number of Monte-Carlo trials
M=1e4;

%%%%%%%%%% Use final values to compute %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
final_vals=stockPrice*exp((intRate-0.5*sigma^2)*expTime + sigma*sqrt(expTime)*randn(M,1));

% Evaluate the Put option options
option_values=max(strikePrice-final_vals,0);

% Discount under r-n assumption
present_vals=exp(-intRate*expTime)*option_values;

% Compute confidence intervals
int=1.96*std(present_vals)/sqrt(M);

% Take the average
put_value=mean(present_vals);

% Range
put_range = [put_value-int put_value+int];


end

