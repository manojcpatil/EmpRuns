function Stats = Runs_G(samples, ch, n, k, c)
% Calculate the number of G(n,k) runs for a matrix of binary sequences.
%
% Input:
%   samples: a matrix where each row represents a sequence of binary values
%   ch: the character to count runs for
%   n: the number of trials
%   k: a vector of run length thresholds
%   c: 1 for circular sequences, 0 for non-circular sequences
%
% Output:
%   Stats: a matrix where each column corresponds to a value of 'k', and each row corresponds to a row in 'samples'

if nargin < 4
    error('Runs:Runs_N:TooFewInputs', 'Input arguments are undefined.');
elseif nargin < 5
    c = 0;
end

% Check for valid input values
if ~isnumeric(samples) || ~isscalar(ch) || ~isscalar(n) || ~isvector(k) || ~isscalar(c) || n <= 0
    error('Invalid input. Please provide valid scalar and vector inputs.');
end

[nrows, ncols] = size(samples);

% Additional error check for column size and sequence length
if ncols < n
    error('Runs:Runs_N:WrongInputs', 'Column size and sequence length are not matching');
elseif nrows == 1 && mod(ncols, n) == 0
    samples = vec2mat(samples, ncols);
end

klength = length(k);
Stats = zeros(nrows, klength);

for d = 1:klength
    if c == 1
        tpsamples = [samples, samples(:, 1:k(d) - 1)];
    else
        tpsamples = samples;
    end

    [nrows, ncols] = size(tpsamples);

    if k(d) > n
        no = zeros(1, nrows);
    else
        no = zeros(1, nrows);

        for i = 1:nrows
            tline1 = tpsamples(i, :);

            if c == 1
                % Circular sequence handling
                tline2 = circshift(tline1, [0, find(tline1 == ch, 1) - 1]);
                tline2 = [tline2, tline2(1:k(d) - 1)];
                ncols = length(tline2);
            else
                tline2 = tline1;
            end

            j = 1;
            while j <= n - k(d) + 1
                if all(tline2(j:j + k(d) - 1) == ch) && (j == 1 || tline2(j - 1) ~= ch)
                    no(i) = no(i) + 1;
                    j = j + k(d) + 1;
                else
                    j = j + 1;
                end
            end

        end
    end

    Stats(:, d) = no';
end
end
