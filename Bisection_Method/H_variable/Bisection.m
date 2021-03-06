% NUMERICAL METHODS for the solution of NON LINEAR EQUATIONS
%
% METHOD OF BISECTION
%
%--------------------------------------------------------
% EXAMPLE 2
% Given a variable H, determine M
%     M = Ms * tanh(H/H0 + k0*M/Ms)
%
%--------------------------------------------------------
close all
clear all
clc

% Constants of the problem
mu0  = 2*pi*1.e-7; % H/m
Ms   = 2/mu0;    % A/m
H0   = 800;        % A/m 
k0   = 0.95;       % dimensionless

% Define H in a range [-800 800]
H = -800:1:800;

% First you need to initialize the extremes of the range
Ma_init=8*Ms;
Mb_init=4*Ms;

% Parameters of the bisection method
kcountMAX=200;
eps_yf0=1.e-6; % epsilon of the vertical y
eps_xab=1.e-6;

Ma = Ma_init; % Ma and Mb are the extremes of the range
Mb = Mb_init;
fa = effe(Ma, H,  Ms,H0,k0);
fb = effe(Mb, H,  Ms,H0,k0);



kcount = 0;
lCondWhile = 1;
while lCondWhile

    kcount = kcount+1;
    % ATTENTION: fa and fb we have them
    Mc = .5*(Ma+Mb);
    fc = effe(Mc, H,  Ms,H0,k0);
   
    if fa*(fc.')>0 % fa and fc have the same sign
        % change Ma
        Ma_old = Ma;
        Ma = Mc;
        elseif fb*(fc.')>0 %prodotto riga per colonna tra vett riga e vett colonna
        % change Mb
        Mb_old = Mb;
        Mb = Mc;
    else
        disp 'think better!'
        pause
    end%if
    
    iCondVec = [0 0 0];
    if abs(fc)<eps_yf0
        % quit because the f is small
        iCondVec(1) = 1; % eps_yf0
    end
    
    if abs(Mb-Ma)<eps_xab
        % quit because the range is small
        iCondVec(2) = 1;
    end
    
    if kcount>kcountMAX
        % quit for too many iterations
        iCondVec(3)=1;
    end%if
    lCondWhile = not(iCondVec(1)|iCondVec(2)|iCondVec(3));
       
end%while
% 
disp '--------------------------'
kcount
iCondVec