%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Selection Diversity
%
% Upon receiving symbols from different antenna, select 1 with the highest SNR.
% (1) For each MxN received signal y, select 1 symbol per antenna with the
%   highest SNR.
% (2) Find the index of those chosen symbols from y to use on H and generate the
%   a new channel vector as a subset of the H matrix.
% (3) Use the chosen antenna per symbol, new channel vector, and the norm of the
%   channel vector to perform the matched filtering.
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

  % y_sd = inefficient_sd(y, H, N); % vectorize
  y_sd = max(y); %1

  [row,col] = find(y_sd == y); %2
  indices = sub2ind(size(H), row, col);
  new_H = H(indices)';

  y_sd = y_sd .* new_H / norm(new_H); %3
endfunction

function ydiv = inefficient_sd(y, H, N)
  for symb_idx = 1 : N
    % Choose the antenna with the highest SNR
    ydiv(1, symb_idx) = max(y(:,symb_idx));

    % Match the received signal with the estimated channel
    ant_idx = find(ydiv(1, symb_idx)==y(:,symb_idx));
    ydiv(1, symb_idx) = ydiv(1, symb_idx) / H(ant_idx, symb_idx);
  endfor  
endfunction
