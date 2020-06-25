%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Multiple RX Antenna Receiver
%
% Receiver the gets the combined noise, channel attenuation, and transmitted
% signal over multiple RX antenna
%
% @input
%         H       is the MxN channel matrix where each row is assigned to one 
%                   transmitted symbol
%         x       is the Nx1 modulated symbol stream
%         n       is the MxN noise matrix where each row is assigned to one 
%                   transmitted symbol
%         P       is the symbol power
%         N0      is the noise power
%         div     is the diversity combining technique where the following are
%                   supported:
%                     (1) 'SD' for Selection Diversity
%                     (2) 'MRC' for Maximum Ratio Combining
%         mod     is the modulation scheme to be used for the RX decision maker 
%                   where 'BPSK' is supported
% @output
%         yhat  is the 1xN symbol stream vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function yhat = rx_simo(H, x, n, P, N0, div, mod)
  [M, N] = size(H);
  if strcmp(mod, 'NoDiv')
    M = 1;
  end
  y = zeros(M, N); % container of N symbols received from each of the M antenna
  
  for symb_idx = 1:N  % try to improve through vectorization
    y(:,symb_idx) = H(:,symb_idx) * x(symb_idx) * P + n(:,symb_idx) * N0;
  end

  ydiv = apply_diversity(N, y, H, div);
  yhat = apply_rx_decision_maker(mod, ydiv, N);
endfunction

% Private function intended to be used by rx_simo()
function y_div = apply_diversity(N, y, H, div)
  y_div = zeros(1, N);

  if strcmp(div, 'SD')
    y_div = rx_div_sd(y, H);
  elseif strcmp(div, 'MRC')
    y_div = rx_div_mrc(y, H);
  elseif strcmp(div, 'NoDiv')
    y_div = rx_no_div(y, H);
  else
    printf("Unexpected diversity technique: %s\n", div)
  end
endfunction

% Private function intended to be used by rx_simo()
function yhat = apply_rx_decision_maker(mod, y_div, N)
  yhat = zeros(1, N);

  if strcmp(mod, 'BPSK')
    yhat = bpsk_rx_decision_maker(y_div);
  else
    printf("Unexpected modulation scheme: %s\n", mod)
  end
endfunction
