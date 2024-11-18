clear all;
clc

load("failure_times_1.mat")
dataSort = sort(ft);
r0 = 10;
r = 9;
t = 10000;
tc = dataSort(r0);
Se = sum(dataSort);
Sc = Se + (length(dataSort) - r0)*tc;
St = sum(dataSort(1:r)) + (length(dataSort)-r0)*t;
w = dataSort(length(dataSort)) - dataSort(1);
m = floor(sqrt(length(dataSort)));
omega = w/(m-1);

u1 = dataSort(1) - omega/2;
u2 = u1 + omega;
u3 = u2 + omega;
u4 = u3 + omega;
u5 = u4 + omega;
u6 = u5 + omega;
u7 = u6 + omega;

tc1 = (u1+u2)/2;
tc2 = (u2+u3)/2;
tc3 = (u3+u4)/2;
tc4 = (u4+u5)/2;
tc5 = (u5+u6)/2;

MTBF_epuizat = Sc / length(dataSort);
MTBF_cenzurat = Sc / r0;
MTBF_trunchiat = St / (r+1);
s_ep = sqrt(sum((dataSort - MTBF_epuizat).^2)/(length(dataSort)-1));

gamma_cenzurat = 1/MTBF_cenzurat;
gamma_trunchiat = 1/MTBF_trunchiat;