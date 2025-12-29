clc; clear; close all;

N = 10;                 % Number of samples
beta = 1;               
Pfa = linspace(1e-4, 1-1e-4, 500);  

%the threshold calculation uses the inverse error function: T = sqrt(2*N*beta^2) .* erfinv(1 - 2*Pfa);
% For Pfa = 0  → erfinv(1)  = ∞
% For Pfa = 1  → erfinv(-1) = -∞
% So avoid Avoid 0 and 1 in Pfa


X_dB = [0 3 10 13];      % SNR in dB
X = 10.^(X_dB/10);       % Linear SNR

figure; hold on;

%ROC Computation

for k = 1:length(X)

    %  Threshold from P_FA 
    % P_FA = 1/2 [1 - erf(T / sqrt(2Nβ^2))]
    T = sqrt(2*N*beta^2) .* erfinv(1 - 2*Pfa);

    % Detection Probability
    % P_D = 1/2 * erfc( erfc^{-1}(2P_FA) - sqrt(X/2) )
    Pd = 0.5 * erfc( erfcinv(2*Pfa) - sqrt(X(k)/2) );

    Pfa_plot = [0 Pfa];
    Pd_plot  = [0 Pd];

    plot(Pfa_plot, Pd_plot, 'LineWidth', 2);
end

% SNR=0 line
plot([0 1], [0 1], 'k--', 'LineWidth', 1.5);


xlabel('Probability of False Alarm, P_{FA}');
ylabel('Probability of Detection, P_D');
title('Receiver Operating Characteristics Curve');
legend('0 dB', '3 dB', '10 dB', '13 dB', 'SNR=0', ...
       'Location', 'southeast');

grid on;
axis([0 1 0 1]);
