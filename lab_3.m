clc
clear

%apsibreziam x
x = 1/20:1/20:1;
%originali funkcijos reiksme
d =(1 + 0.6*sin((2*pi*x)/0.7)+0.3*sin(2*pi*x))/2;

%ieskome d funckijos maximumu ir ju pozcijos
[peaks,position] = findpeaks(d);

%ieskome d funkcijos minimumu. apverciame d
[lows,lposition] = findpeaks(-d);

%automatinis c parinkimas
c(1) = x(position(1));
c(2) = x(position(2));

%automatinis r parinikimas.%peak x - kilimo/leidimosi vidurio x
r_1 =  (x(lposition(1))-x(position(1)))/2;
r_2 =   x(position(2))- (x(position(2))+ x(lposition(1)))/2;

%arba naudoti sitas reiksmes.Paskaiciuotas is akies is grafiko x - kilimo/leidimosi vidurio x 
%r_1 = 17
%r_2 = 16

%svoriai
w_0 = randn(1);
w_1 = randn(1);
w_2 = randn(1);

%zingsnis

et = 0.1;
eklaida = 1; %pradine klaida

%iteracijos per kiek pasiektas rezultatas
iteracijos = 0;

%tusti masyvai e ir y. e - klaidu masyvas, y = apskaiciuotu reiksmiu masyvas 
e = zeros(1,length(x));
y = zeros(1,length(x));

%koeficientu perskaiciavimas
    %ciklas kiekvienam x
    for i = 1 : length(x)
        %spinduli tipo funckija. Gausas
        f_1 = exp(-(x(i)-c(1))^2/(2*r_1^2));
        f_2 = exp(-(x(i)-c(2))^2/(2*r_2^2));
        %suaproksimuotos reiksmes
        y(i) = f_1*w_1+f_2*w_2+w_0;
        %klaida
        e(i) = d(i) - y(i);
        %perskaiciuojame svorius
        w_1 = w_1 + et*e(i)*f_1;
        w_2 = w_2 + et*e(i)*f_2;
        w_0 = w_0 + et*e(i);
    end    

plot(x,y)

figure
plot(x,d)
