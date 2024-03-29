% Votre algorithme pour resoudre 
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_1 

function xprime = votrealgorithme(A1, yprime, integer=false) 

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


% default values
lb = zeros(1, 2*p+4*m);         % lower bound
ub = Inf(1, 2*p+4*m);           % upper bound
ctype = repmat("S", 1, 2*m+p);  % equality constraints

if(integer)
  display("resolving with integer variables")
else
  display("resolving with continuous variables")
endif
% x integer and others continuous
vartype = [repmat(ifelse(integer, "I", "C"), 1, p) repmat("C", 1, 4*m+p)]; % C for continuous variable, I for integer variable

% Résolution :
variables = glpk(C, A2, B, lb, ub, ctype, vartype);
xprime_lin = variables(1:p, 1);
xprime = round(abs(xprime_lin)); % abs here is just to get 0 instead of -0 that can happen with some very low errors

%diff = abs(xprime_lin-xprime);

%for i = 1:p
%  if(diff(i) > 0)
%    display("some vars different");
%  endif  
%end  

%display(diff);
