% Votre algorithme pour resoudre 
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_1 

function xprime = votrealgorithme(A1, yprime) 

[m, p] = size(A1);


% Constraintes :
A2 = [-1*eye(p) zeros(p, m) % Vi, -xi <= 0
eye(p) zeros(p, m)          % Vi, x <= 1
A1 -1*eye(m)                 % Vi, -ti + Ax <= yprime
-1*A1 -1*eye(m)              % Vi, -ti - Ax <= -yprime
];
b = [zeros(1, p) ones(1, p) transpose(yprime) -1*transpose(yprime)];

C = [zeros(1, p) ones(1, m)];
lb = zeros(1, p+m);
ub = Inf(1, p+m);
ctype = repmat("U", 1, 2*(p+m));

% glpk (c, A, b, lb, ub, ctype, vartype, sense, param)
xprime = glpk(C, A2, b, lb, ub, ctype);

%xprime = zeros(size(A,2),1); % solution triviale