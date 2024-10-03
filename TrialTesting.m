% Load sample data from CSV file
data = csvread('sampledata.csv');
%data = binornd(3,0.7,10,20);
[1:20;data]
% Set parameters
ch = 2;      % State of interest
n = 20;      % Number of trials
k = [2, 3];  % Run lengths
c = 0;       % Circular sequences flag (0 for non-circular, 1 for circular)

% Call Runs_N function from RunCodes.m
Stats1 = Runs_E(data, ch, n, k, c);
Stats2 = Runs_WE(data, ch, k, 2, c);

% Display the results
fprintf('Number of non-overlapping success runs:\n');
%Stats1
[Stats1 Stats2]