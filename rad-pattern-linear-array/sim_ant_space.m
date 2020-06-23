clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONFIGURATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = 3.8e9;      # carrier frequency (Hz)
N = 4;          # number of antenna element
color_code = ['b', 'r', 'g', 'y' ,'m'];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EFFECT OF NUMBER OF ANTENNA ELEMENTS TO THE RADIATION PATTERN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lambda = 3e8 / f; # wavelength
d = [lambda/8 lambda/4 lambda/2 lambda 2*lambda]; # inter-antenna element distance

figure;
for idx = 1 : length(d)
  [theta, r] = uniform_linear_array(N, d(idx), lambda);
  
  if 2 == idx
    hold on
  endif
  
  polar(theta, abs(r), color_code(idx));
endfor
hold off
legend('lambda/8','lambda/4','lambda/2','lambda','2*lambda')
title('Effect of Antenna Element Spacing to the Radiation Pattern')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONCLUSION
% Antenna spacing less than half wavelength reduces antenna gain/directionaly.
% Antenna spacing more than half wavelength produces grating lobes.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%