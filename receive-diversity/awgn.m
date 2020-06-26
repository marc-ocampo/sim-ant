%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Additive White Gaussian Noise Generator (without noise phase rotation)
%
% @input
%         N   is the number of symbols (> 0)
%         M   is the number of receive antenna (> 0)
%         N0  is the noise power (not in dB, 1 > N0 > 0)
% @output
%         n   is the MxN noise matrix where each row is assigned to one 
%             transmitted symbol
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function n = awgn(N, M, N0)
  n = sqrt(N0/2) * randn(M, N); % no imag component since no phase rotation
  printf("size(n) = %dx%d\n",size(n)(1), size(n)(2));
endfunction