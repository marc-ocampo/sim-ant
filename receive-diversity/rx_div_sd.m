%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Selection Diversity
%
% Upon receiving symbols from different antenna, select 1 with the highest SNR.
% (1) For each M received signal y, select 1 symbol among M antenna with the
%   highest SNR (or the largest h)
% (2) Find the index of those chosen symbols from h to use on y and generate the
%   chosen received signal vector from 1 antenna
% (3) Equalize the chosen symbols by using the h vector from (1)
%
% Reference
% http://www.dsplog.com/2008/09/06/receiver-diversity-selection-diversity/
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

  y_sd = efficient_sd(y, H);
endfunction

% efficient version of inefficient_sd by utilizing vectorization
function ydiv = efficient_sd(y, H)
  % Find the max channel per column (or symbol)
  h = max(H);

  % Find the indices of the max values found in the channel matrix
  [row,col] = find(h == H);

  % Convert those row-column indices as serial indices
  indices = sub2ind(size(y), row, col);

  % Choose the received signal based on the serial indices
  ydiv = transpose(y(indices));

  % Match the received signal with the estimated channel
  ydiv = ydiv ./ h;
endfunction

% used originally due to its intuitiveness but is inefficient due to the loops
function ydiv = inefficient_sd(N, y, H)
  for symb_idx = 1 : N
    % Choose the antenna with the highest SNR (or attenuation is lowest)
    % We do not base on y because it involves the power from the transmitter
    [h_max, ant_idx] = max(H(:,symb_idx));

    % Match the received signal with the estimated channel
    ydiv(1, symb_idx) = y(ant_idx, symb_idx) / h_max;
  endfor
endfunction
