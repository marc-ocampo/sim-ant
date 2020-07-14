%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Maximum Ratio Combining
%
% Combine signals from different antennas based on the estimated channel weights 
% obtained from each antenna
%
% @input
%         y           is the MxN received signal matrix
%         H           is the MxN channel matrix
% @output
%         y_mrc       is the 1xN vector after MRC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function y_div = rx_div_mrc(y, H)
  N = size(y)(2);
  y_div = zeros(1, N);

  y_div = efficient_mrc(H, y);
endfunction

% efficient version of inefficient_mrc by utilizing vectorization
function y_div = efficient_mrc(H, y)
  norm_H = norm(H, opt='columns'); % to get norm per symbol on different ants
  y_div = sum(y .* conj(H) ./ norm_H);
endfunction

% used originally due to its intuitiveness but is inefficient due to the loops
function y_div = inefficient_mrc(N, H, y)
  for symb_idx = 1 : N % vectorize
    h = H(:, symb_idx);
    y_div(1, symb_idx) = y(:, symb_idx)' * h / norm(h);
  endfor
endfunction
