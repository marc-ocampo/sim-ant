%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Binary Phase Shift Keying Decision Maker
%
% Translates received BPSK symbols to symbol stream.
% Decision rule:
%         if phase > |pi/2|, recognize as 1, else 0
% This is aligned with the bpsk_generator.m
%
% @input
%         y     is the 1xN received signal vector where N is the number of 
%                 BPSK symbols
% @output
%         yhat  is the 1xN symbol stream vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function yhat = bpsk_rx_decision_maker(y)
  yhat = abs(angle(y)) > pi/2; % if phase > pi/2, decide 1, else 0
endfunction