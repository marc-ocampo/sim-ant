################################################################################
# REFERENCE
# https://www.mwrf.com/technologies/systems/article/21133656/phasedarray-antenna-patterns-part-1lineararray-beam-characteristics-and-array-factor
#
# What can be interpreted from this graph?
# 1. There can be a 180deg phase shift between antenna elements to produce a 90
#    deg beam tilt. This is not realizable.
# 2. For d > lambda/2, no amount of phase shift can produce a full beam shift.
#    This will also produce grating lobes (not shown here).
################################################################################

# Parameters
d_lambda = [0.4 0.5 0.6]'; # d / lambda where d is the inter-AE distance
                           #                  lambda is the signal wavelength
theta = -90:1/100:90;

# Calculation
phase_delay = 360 * d_lambda * sin(theta * pi/180);

# Plot
figure;
plot(theta, phase_delay)
title('Beam Direction and Inter-AE Phase Difference')
legend('d/lambda=0.4', 'd/lambda=0.5', 'd/lambda=0.6')
xlabel('beam direction (degrees)')
ylabel('phase difference (degrees)')