function transfer_response
global omega0 E0 t n R0 R1 R2 ev Tau K H0ab

%INITIAL CONDITIONS
v0=zeros(1,n);

%At this point it is possible to write the transfer function
%remembering that H0 = V0 / E
%Furthermore, once Tau is known, we can write H0 as a function of Tau and
%of a constant K depending on the resistances

K=(R0*R2)/(R0*R1+R1*R2+R0*R2);

for r=1:n
    H0=K*(1/(1+1j*omega0*Tau));
    H0ab=abs(H0);
    H0ang=angle(H0);
    v0=v0-H0ab*((2*E0)/(r*pi))*sin(r*omega0*t+H0ang);
end

figure('Name','Voltage at the resistor R0','NumberTitle','off')
plot(t,ev,'g','LineWidth',2)
hold on 
plot(t,v0,'b','LineWidth',2)
hold off
grid on 
grid minor
xlabel('Time [s]')
ylabel('Voltage [V]')
legend('Sawtooth','Response')


return