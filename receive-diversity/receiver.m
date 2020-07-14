%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Receiver Model
%
% Received signal is modeled as:
%   y = Hx + n
%
% @input
%         H       is the MxN channel matrix where each row is assigned to one
%                   transmitted symbol
%         x       is the Nx1 modulated symbol stream
%         n       is the MxN noise matrix where each row is assigned to one
%                   transmitted symbol
%         P       is the symbol power
%         N0      is the noise power
% @output
%         y       is the MxN received symbol matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function y = receiver(H, x, n, P, N0)
  [M, N] = size(H);
  y = zeros(M, N);
  
  y = efficient_receiver(H, x, n, P, N0);
endfunction

% efficient version of inefficient_receiver by utilizing vectorization
function y = efficient_receiver(H, x, n, P, N0)
  y = (H .* transpose(x) * P) + (n * N0); 
endfunction

% used originally due to its intuitiveness but is inefficient due to the loops
function y = inefficient_receiver(N, H, x, n, P, N0)
  for symb_idx = 1:N
    y(:,symb_idx) = H(:,symb_idx) * x(symb_idx) * P + n(:,symb_idx) * N0;
  end
endfunction