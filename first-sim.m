clear all
close all

Z = 400;
num = Z;

sys = tf([num],[1,0,0])

con = tf([20,1],[1])

figure
step(sys*con)

% step(sys)

Gol = sys-(0.001*9.8)

figure
pzmap(Gol)