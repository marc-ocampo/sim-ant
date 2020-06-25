%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Binary Phase Shift Keying Symbol Generator
%
% Maps logic 1 and 0 to -1 and 1 respectively
%
% @input
%         bitstream   is an Nx1 bitstream vector
% @output
%         bpsk_symb   is the Nx1 BPSK symbol stream
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function bpsk_symb = bpsk_generator(bitstream)
  bpsk_symb = exp(1i .* bitstream * pi);   % mapping 1s and 0s to -1 and 1
  printf("bpsk_symb = %dx%d\n", size(bpsk_symb)(1), size(bpsk_symb)(2));
endfunction