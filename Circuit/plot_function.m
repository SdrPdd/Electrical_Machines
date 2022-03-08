function plot_function

global n Tau K omega omega_Tau

omega_Tau=1/Tau;

H0ab=zeros(1,n);
omega=linspace(0,8*omega_Tau,n); %vector defined to evaluate how the transfer function varies as a function of the omega pulsation
s=n/8+1; %coordinate of the omega0 point

for r=1:n
    H0=K*(1/(1+1j*omega(r)*Tau));
    H0ab(r)=abs(H0);
end

figure('Name','Transfer Function','NumberTitle','off')
plot(omega,H0ab,'r','LineWidth',2)
hold on
plot(omega(s),H0ab(s),'ob')
hold off
xlabel('Pulsation [rad/s]')
ylabel('|H0| [-]')
grid on
grid minor

return