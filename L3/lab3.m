clear all;
close all; 
clc

data = load("failures_1.mat");
c = data.c;
p = data.p;
s = data.s;
m = data.m;

p1 = p(:, 1);
p2 = p(:, 2);
m1 = m(:, 1);
m2 = m(:, 2);
m3 = m(:, 3);
s1 = s(:, 1);
s2 = s(:, 2);

c1a = length(find(c))
p1a = length(find(p1))
p2a = length(find(p2))

m1a = length(find(m1))
m2a = length(find(m2))
m3a = length(find(m3))

s1a = length(find(s1))
s2a = length(find(s2))
 
N = 40;
fc1 = c1a / N
fp1 = p1a / N
fp2 = p2a / N

fm1 = m1a / N
fm2 = m2a / N
fm3 = m3a / N

fs1 = s1a / N
fs2 = s2a / N

Nc = sum(c)
Np = sum(p1)  +sum(p2)
Ns = sum(s1) +sum(s2)
Nm = sum(m1)+sum(m2)+sum(m3)

Pc= 100;
Pp=50;
Ps = 10;
Pm=1;

D = (Nc * Pc + Np * Pp + Ns * Ps + Nm * Pm) / N