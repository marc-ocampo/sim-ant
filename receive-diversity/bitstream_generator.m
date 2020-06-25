%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bit Stream Generator
%
% Maps logic 1 and 0 to -1 and 1 respectively
%
% @input
%         N   is the number of bits (> 0)
% @output
%         X   is the Nx1 bitstream vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function X = bitstream_generator(N)
  if N > 0
    X = randn(N,1) > 0.5;
    printf("bitstream = %dx%d\n",size(X)(1), size(X)(2));
  else
    X = 0;
  end
endfunction