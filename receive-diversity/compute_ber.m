%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BER Calculator
%
% Calculates the BER by comparing the decided yhat against the originally
% transmitted symbols
%
% @input
% symbol_stream is the 1xN transmitted symbol vector
% yhat is the 1xN received symbol vector after the decision maker
%
% @output
% ber is the bit error rate (of type double)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ber = compute_ber(symbol_stream, yhat)
  N = size(yhat)(2);
  
  error_count = numel(find(symbol_stream ~= yhat'));
  ber = error_count / N;
endfunction