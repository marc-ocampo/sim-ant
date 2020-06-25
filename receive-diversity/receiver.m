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

  %  for symb_idx = 1:N  % try to improve through vectorization
  %    y(:,symb_idx) = H(:,symb_idx) * x(symb_idx) * P + n(:,symb_idx) * N0;
  %  end

  y = (H .* x' * P) + (n * N0); % vectorized form
endfunction