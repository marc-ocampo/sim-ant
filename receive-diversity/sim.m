clear all
clc

% Test Parameters
N = 10^3            % number of symbols (> 0)
M = 2               % number of receive antenna (> 0)
P = 10^-3           % channel power (not in dB, 1 > P > 0)
N0 = 1              % noise power (not in dB, 1 > N0 > 0)
SNR_dB = 0:2:18     % signal to noise ratio in decibels

% Initialie BER counters
ber_nodiv = zeros(1, length(SNR_dB));
ber_sd = zeros(1, length(SNR_dB));
ber_mrc = zeros(1, length(SNR_dB));

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
  yhat_nodiv = rx_simo(H, x, n, pow, N0, 'NoDiv', 'BPSK');
  yhat_sd = rx_simo(H, x, n, pow, N0, 'SD', 'BPSK');
  yhat_mrc = rx_simo(H, x, n, pow, N0, 'MRC', 'BPSK');

  % Performance evaluation
  ber_nodiv(idx) = compute_ber(sym_stream, yhat_nodiv);
  ber_sd(idx) = compute_ber(sym_stream, yhat_sd);
  ber_mrc(idx) = compute_ber(sym_stream, yhat_mrc);
end

% Plot the performance
close all
figure
semilogy(SNR_dB, ber_nodiv, '-+r');
hold on
semilogy(SNR_dB, ber_sd, '-*b');
semilogy(SNR_dB, ber_mrc, '-og');
grid on
legend('No Diversity','2Rx SD', '2Rx MRC')
xlabel('SNR (dB)')
ylabel('BER')
title('BPSK System on Rayleigh Channel')












