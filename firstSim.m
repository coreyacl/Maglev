%% Magnetic Levitation Project
% Corey and Eamon


%Define variable for the system
%https://www.daycounter.com/Calculators/Magnets/Solenoid-Force-Calculator.phtml
%based off of https://media.digikey.com/pdf/Data%20Sheets/Adafruit%20PDFs/3875_Web.pdf
mu = pi*4e-7;   % permeability of space
q1 = .01e-6;       % Magnetic force of small magnet in Teslas
N = 4000;       % # of turns in solenoid
A = 0.06;         % Area of solenoid in mm^2
R = 2.41;       % Internal resistance of solenoid (5V/.6A) in Ohms
g = -9.81;      % Acceleration due to gravity
l = 112;
L = 10e-3;

%The setpoints for the linerization
%First we chose our 'b' setpoint for voltage
%And find an a that cancels out the constant
b = 2.48;
a = abs(sqrt((b*mu*q1*N*A)/(4*pi)));

%Z allows us to use cleaner math by placing
%all of our constants into one constant.
Z = (mu*q1*N*A)/(4*pi);

%Define the system
G = tf([Z/a^2],[1 0 Z*b/a^3]);
%% Closed Loop
close all

%%%%%%%%%%%%%%%% PID
% k = 34*156;
% kd = k* 69;
% kp = k* 963;
% ki = k* 2899;

%%%%%%%%%%%%%%%% PID
k = 762;
sp = 15;
kd = k* 1;
kp = k* (sp*2);
ki = k* (sp*sp);

%%%%%%%%%% PI
% k = 1;
% kd = k* 0;
% kp = k* 1;
% ki = k* 50;
%

H = 1;                     % Sensor
Ac = tf([1],[L R])         % LR Circuit Actuator
C = tf([kd,kp,ki],[1,0])   % Controller
M = 0.03;
nu = tf([1 50],[1]);       % Extra derivative term
Pi = tf([50],[1 0]);
sim = tf([1],[.0015 1]);   % Timing of the simulation

sys = G*Ac*sim

% Visualize system
% open loop
Gol = C*sys*H;
figure
step(Gol+M*g)
% close loop
CL = (C*sys)/(1+Gol) ;

figure
subplot(2,1,1)
pzmap(CL)
subplot(2,1,2)
rlocus(Gol)
figure
step(CL)
