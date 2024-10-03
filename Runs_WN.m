function Stats=Runs_WN(samples, ch, k, r, circular)
% no=Runs_WN(samples, ch, n, k, r, circular)
% This function returns the number of WN(n,k) of char 'ch' in matrix 'samples'.
% Each row in 'samples' is treated as a sequence, and the function counts
% occurrences of the specified run length 'k' of character 'ch' within substrings of length 'n'.
%
% Parameters:
% - samples: Matrix of samples (each row is treated as a sequence).
% - ch: Character to count occurrences for.
% - n: Length of substrings.
% - k: Run length.
% - r: Number of required runs in each substring.
% - circular (optional): Boolean flag for circular extension (default is false).

if nargin < 4
    error('Runs_WN:TooFewInputs', 'Input arguments are undefined.');
elseif nargin < 4
    circular = false;
end

% Convert single-row input to a matrix
[nrows, ncols] = size(samples);
if nrows == 1
    samples = vec2mat(samples, ncols);
end

% Initialize Stats matrix as a cell array
Stats = repmat(ncols+1,nrows, length(k));

% Loop through each pattern length
for d = 1:length(k)
    % Circular shift samples if c is 1
    if circular == 1
        tpsamples = [samples samples(:, [1:k(d)-1])];
    else
        tpsamples = samples;
    end

    % Initialize a vector to store results for each row
    no = repmat(ncols+1,nrows, 1);

    % Loop through each row of samples
    for i=1:nrows
        ncols_temp=ncols;
        temp = tpsamples(i,:);
        j=k(d);
        runscount=0;
        no(i)=ncols+1;

        while j<=ncols_temp
            if min(temp(j-k(d)+1:j)==ch)==1
                runscount=runscount+1;
                if runscount==r
                    no(i)=j;
                    break;
                end
                j=j+k(d);
            else
                j=j+1;
            end
        end
    end
    clear temp j ncols_temp
    Stats(:,d)=no';
    clear no tpsamples;
end

end

