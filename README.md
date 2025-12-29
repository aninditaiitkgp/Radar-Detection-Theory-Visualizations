# Radar-Detection-Theory-Visualizations
This repository contains MATLAB-based implementations for radar detection theory, focusing on visualization and analysis of:
Probability of Detection (Pd), Probability of False Alarm (Pfa), Receiver Operating Characteristic (ROC) curves, Gaussian probability density functions under different hypotheses

Gaussianpdfs.m : Plots Gaussian PDFs under H0 (μ=0) and H1 (μ=1), σ=1 with decision threshold γ=1.5. Shades detection/false-alarm regions for radar hypothesis testing visualization.

ROC.m : Generates ROC curves for N=10 samples, β=1 across SNRs dB using erfinv/erfcinv. Shows Pd vs Pfa trade-offs for detector performance analysis.
