function circuit_solution
global omega0 E0 R0 R1 R2 L Tau
%CIRCUITO DATA 

x=input('Do you want to enter the resistance data? [yes/no] = ','s');

if strcmpi (x,'yes')==1
    R1=input('Value R1 [Ohm]= ');
    R2=input('Value R2 [Ohm]= ');
    R0=input('Value R0 [Ohm]= '); 
    
elseif strcmpi (x,'no')==1
    R1=1; %Ohm
    R2=3; %Ohm
    R0=2; %Ohm
    
end

R=(R0*R2+R1*R0+R1*R2)/(R1+R2);

L=input('Value L [H]= ');

Tau=L/R;
disp(['Value Tau = ' num2str(Tau)])

f=2*pi*Tau; %cutoff frequency
disp(['Cutoff Frequency = ' num2str(f)])

%ADMITTANCE
XL=1i*omega0*L;

%SYSTEM
A=[1 -1 -1;R1 XL+R0 0;R1 0 R2];
B=[0;E0;E0];

%SOLUTION
X=A\B; %vector currents

%VOLTAGE ON R0
V0=R0*X(2);
disp(['Voltage value V0 = ' num2str(V0)])

%MODULE OF V0
A2=abs(V0); %amplitude
disp(['Value of the voltage module V0 = ' num2str(A2)])

return