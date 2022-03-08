function res = effe(x, H,  Ms,H0,k0)
% funzione da azzerare con bisezione
res = Ms * tanh(H/H0 + k0*x/Ms) - x;
return