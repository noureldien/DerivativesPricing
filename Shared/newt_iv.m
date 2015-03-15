function [ivol] = newt_iv(C,S,K,r,T)

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % %
% -------------------------------------------------------------------
% NEWT_IV.M
% -------------------------------------------------------------------
% The function uses Newton's method to find the root of
% the actual call price minus the Black-Scholes call price, solving
% for volatility.
% -------------------------------------------------------------------
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % %
% FUNCTION: newt_iv
% Input(s):
% - C: actual call price expressed in home currency
% - S: price of the underlying expressed in home currency
% - K: strike price of the underlying expressed in home currency
% - r: risk-free rate expressed as a decimal (5%=0.05)
% - T: Tenor expressed in years (6 months=0.5)
% Output(s): the approximate implied volatility using Black-Scholes
% and Newton's method. The approximated implied volatility and3/15/2015 MATLAB ­ implied volatility
% number of iterations taken to acheive an accurate result are
% displayed.
%

% Anonymous functions for Black-Scholes
d1 = @(S,K,r,vol,T) (log(S/K)+(r+vol^2/2)*T)/(vol*sqrt(T));
d2 = @(S,K,r,vol,T) d1(S,K,r,vol,T)-vol*sqrt(T);
bscp = @(S,K,r,vol,T) S*normcdf(d1(S,K,r,vol,T),0,1)-K*exp(- r*T)*normcdf(d2(S,K,r,vol,T),0,1);
vega = @(S,K,r,vol,T)S*normpdf(d1(S,K,r,vol,T),0,1)*sqrt(T);
% Initial guess
ivol = 0.2;
% Error tolerance
err = 0.0001;
% Set a limit to the number of iterations
i = 1; % number of iterations
ilimit = 2000000; % limit
cpdiff = err+1; % Cause the first iteration to occur (see next line)
while abs(cpdiff) > err
% Terminate the algorithm if the iteration limit has been reached
if (i > ilimit)
str = sprintf('ERROR: Implied volatility could not be found after %d iterations.', ilimit);
disp(str);
ivol = inf;
break;
% Otherwise continue the iteration
else
i = i+1;
end
% Calculate Black-Scholes call price for current implied
% volatility guess.
ccprice = bscp(S,K,r,ivol,T);
% Find the difference between calculated call price and
% actual call price.
% If the calculated call price minus the actual call price is not
% small enough, adjust the guess using Newton's method
if abs(cpdiff) > err
slope = vega(S,K,r,ivol,T);
y_int = cpdiff-slope*ivol;
ivol = -y_int/slope;
end
% If the calculated call price minus the actual call price is zero,
% a root as been found. Unless a root as been round, repeat
% the process using the new upper and lower bounds.
end
ivol;
end