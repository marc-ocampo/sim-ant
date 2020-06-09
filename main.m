clear all
clc

% Test Parameters
N = 10^3            % number of symbols (> 0)
M = 2               % number of receive antnna (> 0)
P = 10^-3           % channel power (not in dB, 1 > P > 0)
N0 = 1              % noise power (not in dB, 1 > P > 0)
SNR_dB = 0:2:18     % signal to noise ratio in decibels

% BPSK Transmitter Model
[x, sym_stream] = bpsk_generator(N); % Nx1

% Channel and Noise Model
H = rayleigh_channel(N, M, P); % MxN
n = awgn(N, M, N0); % MxN

ber = zeros(1, length(SNR_dB));
for snr_idx = 1:length(SNR_dB)
  % Receiver
  yhat = rx_simo(H, x, n, SNR_dB(snr_idx), 'SelectionDiversity', 'BPSK');
  
  % Performance evaluation
  err_count = numel(find(sym_stream ~= yhat'));
  ber(snr_idx) = err_count / N;
end

% Plot the performance
close all
figure
semilogy(SNR_dB, ber, '-+r');
hold on
% others here
grid on
legend('2Rx SD')
xlabel('SNR (dB)')
ylabel('BER')
title('BPSK System on Rayleigh Channel')












