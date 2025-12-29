clc; 
clear; 
close all;

% Parameters
y = -4:0.01:8;      % Observation axis

mu0 = 0;            % Mean under H0
mu1 = 1;            % Mean under H1
sigma = 1;          % Standard deviation
gamma = 1.5;        % Decision threshold


% Gaussian PDFs

p_y_H0 = (1/(sqrt(2*pi)*sigma)) * exp(-(y - mu0).^2 / (2*sigma^2));
p_y_H1 = (1/(sqrt(2*pi)*sigma)) * exp(-(y - mu1).^2 / (2*sigma^2));


% Plot

figure;
hold on;

% PDFs
h_H0 = plot(y, p_y_H0, 'k', 'LineWidth', 2);        % p(Y|H0)
h_H1 = plot(y, p_y_H1, 'k--', 'LineWidth', 2);      % p(Y|H1)


% Shaded regions


% Region from p(Y|H1)
idx_H1 = y >= gamma;
area(y(idx_H1), p_y_H1(idx_H1), ...
    'FaceColor', [0 0 0], 'EdgeColor', 'none');

% Region from p(Y|H0)
idx_H0 = y >= gamma;
area(y(idx_H0), p_y_H0(idx_H0), ...
    'FaceColor', [0.7 0.7 0.7], 'EdgeColor', 'none');


% Threshold

h_th = xline(gamma, 'k:', 'LineWidth', 2);


% Labels & Legend

xlabel('Y');
ylabel('p_Y(Y)');
title('Gaussian PDFs under H_0 and H_1');

legend([h_th h_H1 h_H0], ...
       {'Threshold', 'p_Y(Y|H_1)', 'p_Y(Y|H_0)'}, ...
       'Location', 'northeast');

grid on;
