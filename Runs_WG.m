function Stats = Runs_WG(samples, ch, k, r, c)
% Calculate the number of trials required to achieve the rth run with count greater than k.
%
% Input:
%   samples: a matrix where each row represents a sequence of binary values
%   ch: the character to count runs for
%   k: a vector of run length thresholds
%   r: the target run number
%   c: 1 for circular sequences, 0 for non-circular sequences
%
% Output:
%   Stats: a matrix where each column corresponds to a value of 'k', and each row corresponds to a row in 'samples'

if nargin < 4
    error('Runs_WG:TooFewInputs', 'Input arguments are undefined.');
elseif nargin < 5
    c = 0; % Default value for circular sequences
end

% Check for valid input values
if ~isnumeric(samples) || ~isscalar(ch) || ~isvector(k) || ~isscalar(r) || ~isscalar(c)
    error('Invalid input. Please provide valid scalar and vector inputs.');
end

[nrows, ncols] = size(samples);

% Additional error check for sequence length
if nrows == 1
    samples = vec2mat(samples, ncols);
end

klength = length(k);
Stats = ones(nrows, klength) * (ncols + 1); % Initialize Stats with default values

for d = 1:klength
    if c == 1
        tpsamples = [samples, samples(:, 1:k(d)-1)];
    else
        tpsamples = samples;
    end

    [nrows, ncols] = size(tpsamples);

    no = ones(nrows, 1) * (ncols + 1); % Initialize no with default values

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
        run_count = 0;

        while j <= ncols - k(d) + 1
            if j > 1 && j + k(d) <= ncols && all(tline2(j:j + k(d) - 1) == ch) && (j == 1 || tline2(j - 1) ~= ch)
                run_count = run_count + 1;

                % Check for circular sequences
                if j + k(d) <= ncols
                    while tline2(j + k(d)) == ch
                        j = j + 1;
                    end
                end

                % Check if the current run is the rth run with count greater than k(d)
                if run_count == r
                    no(i) = j + k(d) - 1;
                    break;
                end

                j = j + k(d) - 1;
            else
                j = j + 1;
            end
        end
    end

    Stats(:, d) = no;
end
end
