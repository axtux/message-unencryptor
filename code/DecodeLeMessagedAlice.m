% Projet d'optimisation non linéaire
%
% Décodez le message d'Alice... 

clear all; clc; 

% load la matrice d'encodage et le message d'Alice transmis par le canal: 
load '\\umons.ac.be\student\121609\Desktop\Projet Opti\DecodeLeMessagedAlice\messagedAlice.mat'

% Utilisez votre algorithme pour résoudre:
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_2^2 
%
% Rem. La solution xprime devrait etre un vecteur de taille 160x1
A1 = A;
[m, p] = size(A1);


% Constraintes :
A2 = [-1*eye(p) zeros(p, m) % Vi, -xi <= 0
eye(p) zeros(p, m)          % Vi, x <= 1
A1 -1*eye(m)                 % Vi, -ti + Ax <= yprime
-1*A1 -1*eye(m)              % Vi, -ti - Ax <= -yprime
];
b = [zeros(1, p) ones(1, p) transpose(yprime) -1*transpose(yprime)];

f = [zeros(1, p) ones(1, m)];



xprime = linprog(f, A2, b);


%xprime = votrealgorithme(A, yprime);

% Affichez le resultat: 
fprintf('The recovered message is: %s \n', decoding_bin(xprime,d)); 
