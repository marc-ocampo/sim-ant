%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rayleigh Fading Channel
%
% The Rayleigh Fading channel is modeled as:
%           h = phi * C * sqrt(P) * a
%   where h   is the channel matrix 
%         phi is the directionality matrix
%         C   is the correlation matrix 
%         P   is the channel power 
%         a   is the zero-mean complex Gaussian samples
%
% The model is valid for SIMO system with a series of symbols from Tx
%
% @input
%         N   is the number of symbols (> 0)
%         M   is the number of receive antenna (> 0)
%         P   is the channel power (not in dB, 1 > P > 0)
% @output
%         H   is the MxN channel matrix where each row is assigned to one 
%             transmitted symbol
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function H = rayleigh_channel(N, M, P)
  phi = eye(M);
  C = eye(M);
  a = randn(M, N) + 1i * randn(M, N);
  H = phi * C * sqrt(P) * a;
  printf("H_size = %dx%d\n",size(H)(1), size(H)(2));
endfunction