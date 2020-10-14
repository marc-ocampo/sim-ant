################################################################################
# REFERENCE
# https://www.mwrf.com/technologies/systems/article/21138412/phasedarray-antenna-patterns-part-2lineararray-beam-characteristics-and-array-factor
#
# What can be interpreted from this graph?
# 1. The first sidelobe is -13dBc regardless of the number of antenna elements.
#    This is due to the sinc function in the equation.
# 2. Beamwidth becomes sharper as the number of antenna elements increase.
#    This goes for both its main lobe and its sidelobes.
# 3. Sidelobes have increasing beamwidth as it moves farther from the main lobe.
# 4. Sidelobes decreases amplitude as it moves farther from the main lobe.
################################################################################

# Parameters
N = [8 16 32]'; # number of antenna elements (AE)
d_lambda = 0.5; # quarter wavelength AE spacing
beam_angle = 0; # electrical boresight
theta = -90:1/100:90; # mechanical boresight

# Calculation
theta_rad = theta * pi/180;
beam_angle_rad = beam_angle * pi/180;

AF_num = sin(N * pi * d_lambda * (sin(theta_rad) - sin(beam_angle_rad)));
AF_denum = N * sin(pi * d_lambda * (sin(theta_rad) - sin(beam_angle_rad)));
AF_dB = 20*log10(AF_num./AF_denum);

# Plot
figure;
plot(theta, AF_dB);
title('Number of Antenna Elements and Beam Pattern')
legend('N=8', 'N=16', 'N=32')
xlabel('Beam angle (degrees)')
ylabel('Amplitude (dB)')

#### Another case where beam angle is shifted

# Parameters
N = 32;
d_lambda = 0.5;
beam_angle = [0 30 60]';
theta = -90:1/100:90;

# Calculation
theta_rad = theta * pi/180;
beam_angle_rad = beam_angle * pi/180;

AF_num = sin(N * pi * d_lambda * (sin(theta_rad) - sin(beam_angle_rad)));
AF_denum = N * sin(pi * d_lambda * (sin(theta_rad) - sin(beam_angle_rad)));
AF_dB = 20*log10(AF_num./AF_denum);

# Plot
figure;
plot(theta, AF_dB);
title('Beam Angle and Antenna Factor')
legend('0 deg', '30 deg', '60 deg')
xlabel('Beam angle (degrees)')
ylabel('Amplitude (dB)')