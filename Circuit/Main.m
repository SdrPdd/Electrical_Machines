clc
clear all
close all
global omega0 E0 t n R0 R1 R2 L ev Tau K omega H0ab  omega_Tau

% Determine the TRANSFER FUNCTION of V0R and 
% the RESPONSE expression for a SAWTOOTH waveform

% Let's start by evaluating the SAWTOOTH function at the generator input
sawtooth;

% Once the starting circuit is known, it is possible to calculate 
%(through the use of matrices) its modulus on component R0
circuit_solution;

% At this point it is possible to identify the transfer function and
% the expression of the response
transfer_response;

%transfer function plot to evaluate behavior
plot_function;

