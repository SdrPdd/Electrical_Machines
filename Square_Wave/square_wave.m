% SQUARE WAVE
clc
clear all
close all

% DATA
omega=2*pi; %[rad]
En=10;
Tend=10; %[s]
n=10000;
t=linspace(1,Tend,n);

% FUNCTION
jk=zeros(1,n);
for i=1:2:n
    jk=jk+4/i*En/pi*sin(i*omega*t);
end
plot (t,jk,'g','LineWidth',2)
grid on
grid minor
legend('square wave')
xlabel('time [s]')
ylabel('voltage [V]')
axis([3 6 -12 12])
axis square 

    
