% SQUARE WAVE RESPONSE
clc
clear all
close all

T0=1;
w0=(2*pi)/T0;
N=1000;
deltaT=0.002;
TV=(0:1:N-1)*deltaT;
JK=13.7;
jk=0;
for z=1:2:N
    jk=jk+((4*JK)/(z*pi))*sin(z*w0*TV);
end
figure('Name','Square wave','NumberTitle','off')
plot(TV,jk,'b')
grid on


R=1;
L=0.1;
Hl=0;
Hlab=0;
Hlan=0;
Ilv=0;
for r=1:2:N
    Hl=R/(R+1i*r*w0*L);
    Hlab=abs(Hl);
    Hlan=angle(Hl);
    Ilv=Ilv+Hlab*((JK*4)/(r*pi))*sin(r*w0*TV+Hlan);
end

figure(2)
plot(TV,jk)
hold on
plot(TV,Ilv)
hold off
legend('Square wave','Response')


figure(3)
subplot(1,2,1)
plot(TV,jk)
subplot(1,2,2)
plot(TV,Ilv)