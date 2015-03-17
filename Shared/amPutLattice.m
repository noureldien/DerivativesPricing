function price  =  amPutLattice(S0,K,r,T,sigma,N)
% pricing American Style put option using binomial lattice
%
% Input:
%       S0: price of underlying
%        k: strike price
%        r: interest rate
%        T: time to expiry/maturity
%    sigma: volatility
%        N: no. of steps(days) to maturity.
%           it is used to divide the T to deltaT, deltaT = T/N
%
% Output:
%    price: the estimated price for the put option

%  Precompute invariant quantities
deltaT  = double(T/N);
u=exp(sigma *  sqrt(deltaT))  ;
d=1/u;
p=(exp(r*deltaT)  - d)/(u-d)  ;
discount  =  exp(-r*deltaT);
p_u  =  discount*p;
p_d  =  discount*(1-p)  ;
%  set up S values
SVals  =  zeros (2*N+1,1);
SVals(N+1)  =  S0;
for i=1:N
    SVals(N+1+i)  =  u*SVals(N+i);
    SVals (N+1-i)  =  d*SVals (N+2-i);
end
%  set up terminal values
PVals  =  zeros (2*N+1,1) ;
for i=1:2:2*N+1
end
%  work backwards
for tau=1:N
    PVals(i)  =  max(K-SVals(i)  , 0) ;
    for i= (tau+1) :2: (2*N+1-tau)
        hold  =  p_u*PVals(i+1)  +  p_d*PVals(i-1);
        PVals(i)  =  max(hold,  K-SVals(i));
    end
end
price  =  PVals(N+1);

end