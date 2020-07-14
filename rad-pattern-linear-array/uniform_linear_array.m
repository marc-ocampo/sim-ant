%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% UNIFORM LINEAR ANTENNA ARRAY
%
% Generates the radiation pattern of a uniform linear antenna array based the
% number of antenna elements, distance between antenna elements, and wavelength
% of the carrier. This pattern should be valid for both transmit and receive
% blocks.
%
% INPUT
% N is the number of antenna elements
% d is the distance between antenna elements
% lambda is the carrier wavelength
% delay is the time delay on the 1st adjacent antenna element

% OUTPUT
% theta is the angle vector
% r is the total received vector for all angles

% REFERENCE
% http://www.raymaps.com/index.php/fundamentals-of-a-uniform-linear-array-ula/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [theta, r] = uniform_linear_array(N, d, lambda, delay=0)
  theta = 0:pi/180:2*pi;
  r = efficient_ula(theta, N, d, lambda, delay);
endfunction

% uses vectorization for a more efficient computation
function r = efficient_ula(theta, N, d, lambda, delay) % vectorized
  n = transpose(1 : N);
  r_prime = exp(-j * 2 * pi * (n - 1) * d * cos(theta) / lambda);
  r_prime = r_prime .* exp(-j * (n - 1) * delay);
  r = ones(1,N) * r_prime * exp(-j * delay);
endfunction

% first implemented since it is intuitive but less efficient
function r = inefficient_ula(theta, N, d, lambda, delay) % via for-loop
  r = zeros(1, length(theta));

  for n = 1:N
    r = r + exp(-j * 2 * pi * (n - 1) * d * cos(theta) / lambda);
    % each antenna element has increasing delay
    r = r * exp(-j * (n - 1) * delay);
  endfor
endfunction
