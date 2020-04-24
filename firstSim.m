%% Magnetic Levitation Project
% Corey and Eamon


%Define variable for the system
mu = 1;
q1 = 1;
N = 10;
A = 0.001;
R = 0.1;
L = 1;
g = -9.81;

%The setpoints for the linerization
%First we chose our 'b' setpoint for voltage
%And find an a that cancels out the constant
b = 5;
a = abs(sqrt((5*mu*q1*N*A)/(4*pi*R*L*g)))

%Z allows us to use cleaner math by placing
%all of our constants into one constant.
Z = (mu*q1*N*A)/(4*pi*R*L)

%Define the system
sys = tf([Z/a^2],[1 0 Z*b/a^3])

%% Visualize system
figure
pzmap(sys)

figure
step(sys)

%open loop
Gol = sys-(0.001*9.8)

figure
pzmap(Gol)
