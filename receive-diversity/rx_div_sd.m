%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Selection Diversity
%
% Upon receiving symbols from different antenna, select 1 with the highest SNR
%
% @input
%         y           is the MxN received signal matrix
%         H           is the MxN channel matrix
% @output
%         y_sd        is the 1xN vector after selection diversity combining
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function y_sd = rx_div_sd(y, H)
  N = size(y)(2);
  y_sd = zeros(1, N);
  
  for symb_idx = 1 : N
    % Choose the antenna with the highest SNR
    y_sd(1, symb_idx) = max(y(:,symb_idx));
    
    % Match the received signal with the estimated channel
    ant_idx = find(y_sd(1, symb_idx)==y(:,symb_idx));
    y_sd(1, symb_idx) = y_sd(1, symb_idx) / H(ant_idx, symb_idx);
  endfor  
endfunction
