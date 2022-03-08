function sawtooth
global omega0 E0 t n ev 

% FUNCTION DATA

x=input ('Do you want to enter the data relating to the function? [yes/no]= ','s');

if strcmpi(x, 'yes')==1
    E0=input('Value (Voltage Module) E0 [V]= '); 
    T0=input('Value (Initial Time) T0 [s]= ');
    Tend=input('Value (Final Time) Tend [s]= ');  
    
elseif strcmpi(x, 'no')==1
    E0=10;   %[V]
    T0=1;    %[s]
    Tend=10; %[s]
    
end

omega0=2*pi/T0;  %[rad/s]
n=10000;  %number of cycles
t=linspace(1,Tend,n);  %vector of the times
ev=zeros(1,n);  %input function to the generator

% SAWTOOTH WAVEFORM
% FUNCTION
for i=1:n
    ev=ev-2/pi*E0/i*sin(i*omega0*t); %a minus appears to mirror the function
end

%PLOT  

figure('Name','Dente di Sega','NumberTitle','off')
plot(t,ev,'g','LineWidth',2)
grid on 
grid minor
xlabel('Tempo [s]')
ylabel('Tensione [V]')
return