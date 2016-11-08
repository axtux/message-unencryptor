% Projet d'optimisation non linéaire
%
% Décodez le message d'Alice... 

clear all; clc; 

% load la matrice d'encodage et le message d'Alice transmis par le canal: 
load 'messagedAlice.mat'

% Utilisez votre algorithme pour résoudre:
% 
%   min_{0 <= xprime <= 1} ||A*xprime - yprime||_2^2 
%
% Rem. La solution xprime devrait etre un vecteur de taille 160x1

xprime = votrealgorithme(A, yprime);

% Affichez le resultat: 
fprintf('The recovered message is: %s \n', decoding_bin(xprime,d)); 
