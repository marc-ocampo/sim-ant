function ber = perf_eval(symbol_stream, yhat)
  N = size(yhat)(2);
  error_count = numel(find(symbol_stream ~= yhat'));
  ber = error_count / N;
endfunction
##err_count = numel(find(sym_stream ~= yhat_nodiv'));
##  ber_nodiv(snr_idx) = err_count / N;