clc
clear

%apsibreziam x
x = 0.1:1/20:1;
%originali funkcijos reiksme
d =(1 + 0.6*sin((2*pi*x)/0.7)+0.3*sin(2*pi*x))/2;

%ieskome d funckijos maximumu ir ju pozcijos
[peaks,position] = findpeaks(d);

%ieskome d funkcijos minimumu. apverciame d
[lows,lposition] = findpeaks(-d)

%automatinis c parinkimas
c(1) = x(position(1));
c(2) = x(position(2));

%automatinis r parinikimas.%peak x - kilimo/leidimosi vidurio x
r_1 =  (x(lposition(1))-x(position(1)))/2
r_2 =   x(position(2))- (x(position(2))+ x(lposition(1)))/2

%arba
%r_1 = 17
%r_2 = 16
figure
plot(d)

figure
plot(-d)