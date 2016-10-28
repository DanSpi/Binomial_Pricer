function [V0] = bin_Call(S0,K,r,n,u,d)
%Binomial price of a European Call Option
%   Input
% S0 Initial Value of the underlying asset
% K Strike
% r risk free
% n number of steps
% u up step
% d down step

% Preallocation for efficiency
V=nan(n);
q=(1+r-d)/(u-d);

% Payoff vector
V(1:n,n)  =  max(S0  .* u.^ (n-(1:n)).*  d.^(0:(n-1))-K,0);

% MG pricing
for j=n-1:-1:1
    V(1:j,j)=1/(1+r)*(q*V(1:j,j+1)+(1-q)*V(2:j+1,j+1));
end
%V;
V0=V(1,1);
end
