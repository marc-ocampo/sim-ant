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

%   y_sd = inefficient_sd(y, H, N); % vectorize
%  y_sd = max(y); %1

  h = max(H);
  [row,col] = find(h == H);
  indices = sub2ind(size(y), row, col);
  y_sd = transpose(y(indices));
  y_sd = y_sd ./ h;
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
