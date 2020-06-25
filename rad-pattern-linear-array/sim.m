%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIMPLE MATH SIMULATIONS OF UNIFORM LINEAR ANTENNA ARRAYS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EFFECT OF INTER-ANTENNA ELEMENT DISTANCE TO THE RADIATION PATTERN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = 3.8e9;      # carrier frequency (Hz)
N = 4;          # number of antenna element
color_code = ['b', 'r', 'g'];

lambda = 3e8 / f; # wavelength
d = [lambda/8 lambda/2 2*lambda]; # inter-antenna element distance

figure;
for idx = 1 : length(d)
  [theta, r] = uniform_linear_array(N, d(idx), lambda);
  
  if 2 == idx
    hold on
  endif
  
  polar(theta, abs(r), color_code(idx));
endfor
hold off
legend('lambda/8','lambda/2','2*lambda')
title('Effect of Antenna Element Spacing to the Radiation Pattern')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONCLUSION
% Antenna spacing less than half wavelength reduces antenna gain/directionaly.
% Antenna spacing more than half wavelength produces grating lobes.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EFFECT OF NUMBER OF ANTENNA ELEMENTS TO THE RADIATION PATTERN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = 3.8e9;      # carrier frequency (Hz)
N = [2 4 8];    # number of antenna element
color_code = ['b', 'r', 'g'];

lambda = 3e8 / f; # wavelength
d = lambda / 2; # inter-antenna element distance

figure;
for idx = 1 : length(N)
  [theta, r] = uniform_linear_array(N(idx), d, lambda);
  
  if 2 == idx
    hold on
  endif
  
  polar(theta, abs(r), color_code(idx));
endfor
hold off
legend('2 AEs','4 AEs','8 AEs')
title('Effect of Number of Antenna Elements to the Radiation Pattern')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONCLUSION
% Increasing the number of antenna elements in a uniform linear configuration
% makes the radiation pattern directive
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EFFECT OF TIME DELAYS TO THE RADIATION PATTERN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = 3.8e9;      # carrier frequency (Hz)
N = 4;          # number of antenna element
color_code = ['b', 'r', 'g', 'y', 'c' ,'m' ,'k'];

lambda = 3e8 / f; # wavelength
d = lambda / 2;   # inter-antenna element distance
delay = d .* [-30 -20 -10 1 10 20 30];

figure;
for idx = 1 : length(delay)
  [theta, r] = uniform_linear_array(N, d, lambda, delay(idx));
  
  if 2 == idx
    hold on
  endif
  
  polar(theta, abs(r), color_code(idx));
endfor
hold off
legend('-30d','-20d','-10d','d','10d','20','30d')
title('Effect of Antenna Element Delays to the Radiation Pattern')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONCLUSION
% <>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%