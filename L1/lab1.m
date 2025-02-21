load("data.mat");

dataSort = sort(data);
w = dataSort(length(dataSort)) - dataSort(1);
m = floor(sqrt(length(dataSort)));
omega = w/(m - 1);
u1 = dataSort(1) - omega/2;
u2 = u1 + omega;
u3 = u2 + omega;
u4 = u3 + omega;
u5 = u4 + omega;
u6 = u5 + omega;
u7 = u6 + omega;
um = dataSort(length(dataSort)) + omega/2;
xc = (dataSort(1) + dataSort(length(dataSort))) / 2;
a1 = sum(dataSort >= u1 & dataSort < u2);
a2 = sum(dataSort >= u2 & dataSort < u3);
a3 = sum(dataSort >= u3 & dataSort < u4);
a4 = sum(dataSort >= u4 & dataSort < u5);
a5 = sum(dataSort >= u5 & dataSort < u6);
a6 = sum(dataSort >= u6 & dataSort < u7);
a = [a1 a2 a3 a4 a5 a6];
f1 = a1/length(dataSort);
f2 = a2/length(dataSort);
f3 = a3/length(dataSort);
f4 = a4/length(dataSort);
f5 = a5/length(dataSort);
f6 = a6/length(dataSort);
A1 = a1;
A2 = a1 + a2;
A3 = a1 + a2 + a3;
A4 = a1 + a2 + a3 + a4;
A5 = a1 + a2 + a3 + a4 + a5;
A6 = a1 + a2 + a3 + a4 + a5 + a6;
A = [A1 A2 A3 A4 A5 A6];
F1 = f1;
F2 = f1 + f2;
F3 = f1 + f2 + f3;
F4 = f1 + f2 + f3 + f4;
F5 = f1 + f2 + f3 + f4 + f5;
F6 = f1 + f2 + f3 + f4 + f5 + f6;
F = [F1 F2 F3 F4 F5 F6];
xc1 = (u1+u2)/2;
xc2 = (u2+u3)/2;
xc3 = (u3+u4)/2;
xc4 = (u4+u5)/2;
xc5 = (u5+u6)/2;
xc6 = (u6+u7)/2;
vxc = [xc1 xc2 xc3 xc4 xc5 xc6];
f1xc1 = f1 * xc1;
f2xc2 = f2 * xc2;
f3xc3 = f3 * xc3;
f4xc4 = f4 * xc4;
f5xc5 = f5 * xc5;
f6xc6 = f6 * xc6;
sumfixci = f1xc1 + f2xc2 + f3xc3 + f4xc4 + f5xc5 + f6xc6;
m = mean(dataSort);
MG = geomean(dataSort);
MH = harmmean(dataSort);
MSQ = norm(dataSort)/sqrt(length(dataSort));
ME = median(dataSort);
s = std(dataSort);
dispersiaEstimata = 1/length(dataSort) * sum((dataSort-m).^2);
abatereaStandard = sqrt(dispersiaEstimata);
Q1 = prctile(dataSort,25);
Q2 = prctile(dataSort,50);
Q3 = prctile(dataSort,75);
Iq = Q3 - Q1;
q = Iq / Q2;
xindirectmean = 1/length(dataSort)*sum(a.*vxc);
L1 = max(a);
theta1 = 16;
theta2 = 25;
M0 = L1 + theta1*omega/(theta1+theta2);
dispersiaEsantionataCorectata = 1/(length(dataSort) - 1) * sum(a.*((vxc - xindirectmean).^2));
abatereaStandard = sqrt(dispersiaEsantionataCorectata);
dispersiaEstimata = 1/(length(dataSort)) * sum(a.*((vxc - xindirectmean).^2));
abatereaStandardEsantionata = sqrt(dispersiaEstimata);
coeficientVariatie = abatereaStandard / xindirectmean;
yule = abs((xindirectmean - M0)/(xindirectmean-ME));


%% ex 6
r11 = 0.85;
r12 = 0.87;
r13 = 0.88; 
r21 = 0.93;
r31 = 0.89;
r32 = 0.90;
r41 = 0.92;
r42 = r41;
r43 = r41;
r51 = 0.85;
r52 = r51; 
r53 = r51; 
r61 = 0.91;
r62 = 0.94;
r63 = 0.98;

rs1 = r11 * r12 * r13;
rs2 = r31 * r32;
rs3 = r41 * r42 * r43;
rs4 = r51 * r52 * r53;
rs5 = r61 * r62 * r63;
rp1 = 1 - (1-rs1)*(1-r21)*(1-rs2);
rp2 = 1 - (1-rs3)*(1-rs4)*(1-rs5);

rfinal = rp1*rp2;

%% ex 5
r = 0.985119;
% r = e^-z*t;
z = log(r)/-150;

%% ex 4
t = [50, 120, 230, 275, 300, 245, 370, 220, 350, 400];
MTBF = sum(t)/10;

%% ex 3
t = [1000, 1500, 4000, 5000];
def = [1, 2, 2, 95];
MTBF = sum(t.*def)/100;
z = 1/MTBF;