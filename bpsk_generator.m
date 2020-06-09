%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Binary Phase Shift Keying Symbol Generator
%
% Maps logic 1 and 0 to -1 and 1 respectively
%
% @input
%         N           is the number of symbols (> 0)
% @output
%         bpsk        is the Nx1 BPSK symbol stream
%         sym_stream  is the logic stream consisting of 1s and 0s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [bpsk, symb_stream] = bpsk_generator(N)
  symb_stream = randn(N,1) > 0.5;       % stream of random 1s and 0s
  bpsk = exp(1i .* symb_stream * pi);   % mapping 1s and 0s to -1 and 1
  
  printf("bpsk = %dx%d\n",size(bpsk)(1), size(bpsk)(2));
endfunction