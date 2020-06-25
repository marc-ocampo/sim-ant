%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% No Diversity
%
% Since there is 1 RX antenna, apply matched filtering
%
% @input
%         y           is the MxN received signal matrix
%         H           is the MxN channel matrix
% @output
%         y_nd        is the 1xN vector after matched filtering
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function y_nd = rx_no_div(y, H)
  y_nd = y ./ H(1, :);
endfunction
