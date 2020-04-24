mu = 1;
q1 = 1;
N = 10;
A = 0.001;
R = 0.1;
L = 1;
g = -9.81;

b = 5;
a = abs(sqrt((5*mu*q1*N*A)/(4*pi*R*L*g)))

Z = (mu*q1*N*A)/(4*pi*R*L)

sys = tf([Z/a^2],[1 0 Z*b/a^3])

figure
pzmap(sys)

figure
step(sys)

% step(sys)

Gol = sys-(0.001*9.8)

figure
pzmap(Gol)
