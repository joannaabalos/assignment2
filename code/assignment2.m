%% ELEC 4700 Assignment-2 Finite Difference Method
% Assignment 2 - Joanna Abalos 100962263
clc
clear
close all

% In this assignment, Laplace's equation by Fourier Domain was used to
% examine electrostatic potential problems and currentflow in inhomogeneous
% solids. This report contains PDF simulations. To see the simulations in
% full scale (without overlap or compression), assignment2.m should be ran.

%% Part 1

% Part 1 uses the Finite Difference Method to make observations on a
% rectangular region with isolated conducting sides. Using a specific
% analytical solution, meshing was observed.

%-----------Part 1a-----------%
assignment21a

%-----------Part 1b-----------%

for i =1:4
    assignment21b(i);
end

% The meshing reaches the solution when the number of points on the meshing 
% approaches infinity. The more points on the mesh, the closer to the actual 
% solution. Although infinite points cannot be simulater, numerical 
% solutions are very common, are easy to visualize, and provide sufficient 
% approximations. Analytic solutions can be slow but they
% provide exact approximations.

%% Part 2

%-----------Part 2a-----------%
assignment22a

%-----------Part 2b-----------%
I = zeros(1,10);

for i =1:10
    I(i) = assignment22b(i);
end

x=linspace(1,10,10);

figure(4)
subplot(2,2,1)
plot(x,I);
title('Mesh Density')
xlabel('Scale (units/m)')
ylabel('Current (A)')

%-----------Part 2c-----------%
I = zeros(1,10);

for i =1:10
    I(i) = assignment22c(i);
end

x = 1./x;

subplot(2,2,2)
plot(x,I);
title('Narrowing of Bottle-Neck - Current')
xlabel('Scaling Width Between Resistive Regions - Narrow to Wide (m)')
ylabel('Current (A)')

%-----------Part 2d-----------%
I = zeros(1,10);

for i =1:10
    sig(i) = 1/(i);
    I(i) = assignment22d(sig(i));
end

subplot(2,2,3)
plot(sig,I);
title('Sigma Charge Density Variations')
xlabel('Charge Density (C/m)')
ylabel('Current (A)')