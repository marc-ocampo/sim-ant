clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONFIGURATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 4;                        # number of antenna elements
f = [700e6 2.4e9 3.8e9];      # carrier frequency (Hz)
color_code = ['b', 'r', 'g'];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EFFECT OF FREQUENCY TO THE RADIATION PATTERN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lambda = 3e8 ./ f; # wavelength
d = lambda / 2;   # inter-antenna element distance

theta = 0:pi/180:2*pi;

figure;
for idx = 1 : length(d)
  [_, r] = uniform_linear_array(N, d(idx), lambda(idx));
  
  if 2 == idx
    hold on
  endif
  
  polar(theta, abs(r), color_code(idx));
endfor
hold off
legend('700 MHz','2.4 GHz','3.8 GHz')
title('Effect of Frequency to the Radiation Pattern')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONCLUSION
% Frequency has no effect in the radiation pattern
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%