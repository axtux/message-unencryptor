% Votre algorithme pour résoudre 
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_1 

function xprime = votrealgorithme(A1, yprime) 

[m,p] = size(A1);
% Constraintes : Vi, -xi <= 0 && x <= 1
A2 = [-1*eye(p)
eye(p)];
b = [zeros(1, p) ones(1, p)];

f = [];



xprime = linprog(f, A2, b);

xprime = zeros(size(A,2),1); % solution triviale