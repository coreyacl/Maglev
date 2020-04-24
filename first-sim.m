clear all
close all

mu = 1;
q1 = 1;
N = 10;
A = 0.001;
R = 0.1;
L = 1;
g = -9.81;

b = 5;
a = sqrt((5*mu*q1*N*A)/(4*pi*R*L*g))

Z = (mu*q1*N*A)/(4*pi*R*L)

sys = tf([1 0 z*b/a^3],[z/a^2])

figure
step(sys)

% step(sys)

Gol = sys-(0.001*9.8)

figure
pzmap(Gol)