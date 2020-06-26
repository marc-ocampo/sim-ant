clear all
clc

% Test Parameters
N = 10^3            % number of symbols (> 0)
M = 2               % number of receive antenna (> 0)
P = 10^-3           % channel power (not in dB, 1 > P > 0)
N0 = 1              % noise power (not in dB, 1 > N0 > 0)
SNR_dB = 0:2:18     % signal to noise ratio in decibels
num_tech = 3;       % no diversity, selective diversity, MRC

% Initialize BER counters here each row is the BER for a combining technique
ber = zeros(num_tech, length(SNR_dB));

% Translate SNRdB to symbol power
SNR = 10.^(SNR_dB / 10);
symb_pow = SNR * N0;

% BPSK Transmitter Model
sym_stream = bitstream_generator(N);
x = bpsk_generator(sym_stream); % Nx1

% Channel and Noise Model
H = rayleigh_channel(N, M, P); % MxN
n = awgn(N, M, N0); % MxN

for idx = 1:length(symb_pow)
  pow = symb_pow(idx);

  % Receiver
  y = receiver(H, x, n, pow, N0);

  % Receive Diversity
  y_div = zeros(num_tech, N);
  y_div(1, :) = rx_no_div(y, H);
  y_div(2, :) = rx_div_sd(y, H);
  y_div(3, :) = rx_div_mrc(y, H);

  yhat = zeros(1, N); % placeholder
  for tech_idx = 1:num_tech
    % RX Decision Maker
    yhat = bpsk_rx_decision_maker(y_div(tech_idx, :));

    % BER Computation
    ber(tech_idx, idx) = compute_ber(sym_stream, yhat);
  end
end

% Plot the performance
labels = ['-+r', '-*b', '-og'];
figure
for tech_idx = 1:num_tech
  if 2 == tech_idx
    hold on
  endif

  label_idx = ((tech_idx - 1) * 3) + 1;
  semilogy(SNR_dB, ber(tech_idx, :), labels(label_idx : label_idx+2));
end
hold off
grid on
legend('No Diversity','2Rx SD', '2Rx MRC')
xlabel('SNR (dB)')
ylabel('BER')
title('BPSK System on Rayleigh Channel')