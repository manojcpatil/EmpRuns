function Stats=Runs_WM(samples,ch,k,r,circular)
if nargin < 4
    error('Runs_WM:TooFewInputs', 'Input arguments are undefined.');
elseif nargin < 5
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
            end
            j=j+1;
        end
    end
    clear temp j ncols_temp
    Stats(:,d)=no';
    clear no tpsamples;
end

end

