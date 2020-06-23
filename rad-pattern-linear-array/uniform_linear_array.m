% INPUT
% N is the number of antenna elements
% d is the distance between antenna elements
% lambda is the carrier wavelength

% OUTPUT
% theta is the angle vector
% r is the total received vector for all angles

% REFERENCE
% http://www.raymaps.com/index.php/fundamentals-of-a-uniform-linear-array-ula/

function [theta, r] = uniform_linear_array(N, d, lambda)
  theta = 0:pi/180:2*pi;
  r = efficient_ula(theta, N, d, lambda);
endfunction

function r = efficient_ula(theta, N, d, lambda) % vectorized
  n = transpose(1 : N);
  r_prime = exp(-j * 2 * pi * (n - 1) * d * cos(theta) / lambda)
  size(r_prime)
  r = ones(1,N) * r_prime;  
endfunction

function r = inefficient_ula(theta, N, d, lambda) % via for-loop
  r = zeros(1, length(theta));

  for n = 1:N
    r = r + exp(-j * 2 * pi * (n - 1) * d * cos(theta) / lambda);
  endfor
endfunction
