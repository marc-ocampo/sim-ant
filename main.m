clear all
clc

% Test Parameters
N = 10^3            % number of symbols (> 0)
M = 2               % number of receive antenna (> 0)
P = 10^-3           % channel power (not in dB, 1 > P > 0)
N0 = 1              % noise power (not in dB, 1 > P > 0)
SNR_dB = 0:2:18     % signal to noise ratio in decibels

% BPSK Transmitter Model
[x, sym_stream] = bpsk_generator(N); % Nx1

% Channel and Noise Model
H = rayleigh_channel(N, M, P); % MxN
n = awgn(N, M, N0); % MxN

H1 = rayleigh_channel(N, 1, P); % SISO model (no diversity)
n1 = awgn(N, 1, N0);

ber_nodiv = zeros(1, length(SNR_dB));
ber_sd = zeros(1, length(SNR_dB));

for snr_idx = 1:length(SNR_dB)
  % Receiver
  yhat_nodiv = rx_simo(H1, x, n1, SNR_dB(snr_idx), 'NoDiv', 'BPSK');
  yhat_sd = rx_simo(H, x, n, SNR_dB(snr_idx), 'SelectionDiversity', 'BPSK');
  
  % Performance evaluation
  err_count = numel(find(sym_stream ~= yhat_nodiv'));
  ber_nodiv(snr_idx) = err_count / N;
  
  err_count = numel(find(sym_stream ~= yhat_sd'));
  ber_sd(snr_idx) = err_count / N;
end

% Plot the performance
close all
figure
semilogy(SNR_dB, ber_nodiv, '-+r');
hold on
semilogy(SNR_dB, ber_sd, '-*b');
grid on
legend('No Diversity','2Rx SD')
xlabel('SNR (dB)')
ylabel('BER')
title('BPSK System on Rayleigh Channel')












