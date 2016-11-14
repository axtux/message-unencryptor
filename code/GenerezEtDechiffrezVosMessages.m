% Projet d'optimisation non lin�aire
%
% Envoi d'un message crypt� � travers un canal avec du bruit qaussien...
% 
% Encodez vous-m�me et d�chiffrez un message: 

clear all; clc;

% Message � envoyer
my_mess = 'Coucou petite perruche !';
fprintf('The encoded message is: %s \n', my_mess)

% Message sous forme binaire
[x,d]  = encoding_bin(my_mess);

% Longeur du message
n = length(x);

% Longeur du message qui va �tre envoy�
m = 4*n; 

%for i = 0:0.1:0.9
for i = 0.4:0.01:0.5
  % Matrice d'encodage: on prend une matrice al�atoirement g�n�r�e
  A = randn(m,n);

  % Message que l'on d�sire envoyer
  y = A*x; 

  % Bruit ajout� par le canal de transmition
  % = normale N(0,sigma) pour un % des entr�es de y
  yprime = noisychannel(y, i); 

  % Retrouvez x approximativement depuis yprime en r�solvant: 
  % 
  %   min_{0 <= xprime <= 1} ||A*xprime - yprime||_2^2 
  % 
  xprime = votrealgorithme(A,yprime); 

  %fprintf('The error is %d \n', norm(x-xprime)); 
  fprintf('Noise %i, message is: %s \n', i, decoding_bin(xprime,d));
  
end