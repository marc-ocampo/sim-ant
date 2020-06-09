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
%         snr_dB  is the signal to noise ratio in decibels
%         div     is the diversity combining technique where 
%                   'SelectionDiversity' is supported
%         mod     is the modulation scheme to be used for the RX decision maker 
%                   where 'BPSK' is supported
% @output
%         yhat  is the 1xN symbol stream vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function yhat = rx_simo(H, x, n, snr_dB, div, mod)
  snr = 10^(-snr_dB / 10);
  
  [M, N] = size(H);
  y = zeros(M, N); % container of N symbols received from each of the M antenna
  
  for symb_idx = 1:N  % try to improve through vectorization
    y(:,symb_idx) = H(:,symb_idx) * x(symb_idx) + n(:,symb_idx) * snr;
  end
  
  % Diversity
  if M > 1
    % there is diversity
    if strcmp(div, 'SelectionDiversity')
      y_div = rx_div_sd(y, H);
    else
      printf("Unexpected diversity technique: %s\n", div)
      y_div = zeros(1, N);
    end
  else
    % no diversity
    y_div = y;
  end
  
  # Decision Maker
  if strcmp(mod, 'BPSK')
    yhat = bpsk_rx_decision_maker(y_div);
  else
    printf("Unexpected modulation scheme: %s\n", mod)
    yhat = zeros(1, N);
  end
  
endfunction