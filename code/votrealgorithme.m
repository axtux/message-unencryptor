% Votre algorithme pour resoudre 
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_1 

function xprime = votrealgorithme(A1, yprime) 


[m, p] = size(A1);


% Objectif : xi->p tpi->m tmi->m qi->m ri->m si->p
C = [zeros(1, p) ones(1, m) -1*ones(1, m) zeros(1, m) zeros(1, m) zeros(1, p)];
% Contraintes :
A2 = [
-1*A1 eye(m) -1*eye(m) -1*eye(m) zeros(m) zeros(m, p)               % -Ax +tpi -tmi -qi = -y'
A1 eye(m) -1*eye(m) zeros(m) -1*eye(m) zeros(m, p)                  % Ax +tpi -tmi -ri = y'
-1*eye(p) zeros(p, m) zeros(p, m) zeros(p, m) zeros(p, m) -1*eye(p) % -xi -si = -1
];

B = [
-1*yprime
yprime
-1*ones(p, 1)
];

% default values not working
lb = zeros(1, 2*p+4*m);
ub = Inf(1, 2*p+4*m);
ctype = repmat("S", 1, 2*m+p); % equality constraint
vartype = repmat("C", 1, 2*p+4*m); % continuous variable

% Résolution :
variables = glpk(C, A2, B, lb, ub, ctype, vartype);
xprime = variables(1:m, 1);
xprime = round(abs(xprime));


%xprime = zeros(size(A,2),1); % solution triviale