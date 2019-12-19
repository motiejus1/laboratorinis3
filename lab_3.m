clc
clear

%apsibreziam x
x = 1/20:1/20:1;
%originali funkcijos reiksme
d =(1 + 0.6*sin((2*pi*x)/0.7)+0.3*sin(2*pi*x))/2;

%ieskome d funckijos maximumu ir ju pozcijos
[peaks,position] = findpeaks(d)

%ieskome d funkcijos minimumu
[lows,lposition] = islocalmin(d);

%automatinis c parinkimas
%c(1) = x(position(1));
%c(2) = x(position(2));

figure