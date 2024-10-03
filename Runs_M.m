function Stats=Runs_M(samples,ch,n,k,c)
% ----------------------------------------------
%  Mnk=Runs_M(tline,ch,n,k,c)
%
%  This function returns the  number of overlapping success runs
%  of length k in 'samples' sequences,
%  where each row of 'samples' represents the 'n' trials,
%  'k' represents required run length of states 'ch', and
%  'c'=0 if the counting scheme is linear and
%  'c'=1 if the counting scheme is circular
%  by default it consider 'c'=0.
%
%  Description:
%  Overlapping runs of length k: Ling (1988) introduced
%  overlapping counting scheme of runs. According to this
%  counting scheme of runs, successive occurrences of success
%  runs of length k may have an overlapping part with the
%  previous success run. For example, a sequence of consecutive
%  k+1 occurrences of successes contains two overlapping
%  success runs of length k. In general a sequence of trials with
%  occurrence of consecutive n successes contains n-k+1
%  overlapping success runs of length k.
%
%  M_(n,k_i)^i :
%  The number of overlapping i-run of length k_i in the n base
%  pairs in the sense of Ling's (1988) counting. According to this
%  counting schemes of runs successive occurrences of i-runs of
%  length k_i may have an overlapping part with previous run (if
%  any). For example, a sequence of consecutive k_i+1 occurrences
%  of i's contains two overlapping i-runs of length k_i.
%
%  Example:
%
%  Input:
%  z = [1,0,1,1,1,1,1,0,1,1,1,0,0,0,1,1,1,0,1,1];
%  statistic  = Runs_M(z,1,20,3,0)
%  statistic1 = Runs_M(z,1,20,3,1)
%
%  output:
%  statistic = 5
%  statistic1 = 6
%
%  Input:
%  z = binornd(1,0.65,200,20);
%  statistic = Runs_M(z,1,20,3,0);
%  m = describe(statistic)
%  m.Empirical_CDF
%
%  output:
%  m =
%
%           Mean: 4.6500
%        Minimum: 0
%        Maximum: 14
%           Mode: 4
%         Median: 4
%          Range: 14
%          Stdev: 2.8191
%       Variance: 7.9472
%  Empirical_CDF: [15x3 double]
%           Diag: 174.0016
%
%
%  ans =
%
%       0   10.0000    0.0500
%  1.0000   25.0000    0.1250
%  2.0000   50.0000    0.2500
%  3.0000   74.0000    0.3700
%  4.0000  105.0000    0.5250
%  5.0000  128.0000    0.6400
%  6.0000  150.0000    0.7500
%  7.0000  170.0000    0.8500
%  8.0000  181.0000    0.9050
%  9.0000  190.0000    0.9500
%  10.0000  195.0000    0.9750
%  11.0000  196.0000    0.9800
%  12.0000  197.0000    0.9850
%  13.0000  199.0000    0.9950
%  14.0000  200.0000    1.0000
%
%  Reference:
%  Ling, K. D. (1988). On binomial distribution of order k. Statistics
%    and Probability Letters, 6, 247-250.
%
%  See also:
%  Runs_N, Runs_G, Runs_E and Runs_X
% ----------------------------------------------

% run=repmat(ch,1,k);
% total=length(tline);
% if k>n
%  no=0;
% else
%  for i=1:total-n+1
%  no(i)= length(strfind(tline(i:i+n-1),run));
%  end
% end
% no=tabulate(no);

if nargin<4
    error('Runs:Runs_M:TooFewInputs','Input arguments are undefined.');
elseif nargin<5
    c=0;
end

[nrows,ncols]=size(samples);

if ncols<n
    error('Runs:Runs_M:WrongInputs','Column size and sequence length are not matching');
elseif nrows==1 && mod(ncols,n)==0
    samples=vec2mat(samples,ncols);
end

klength = length(k);
Stats = zeros(nrows, klength);

for d = 1:klength
    if c==1
        tpsamples=[samples samples(:,[1:k(d)-1])];
    else
        tpsamples=samples;
    end
    [nrows,ncols]=size(tpsamples);

    if k(d)>n
        no=0
    else
        for i=1:nrows
            temp = tpsamples(i,1:ncols);
            j=k(d);
            no(i)=0;
            while j<=ncols
                if min(temp(j-k(d)+1:j)==ch)==1
                    no(i)=no(i)+1;
                end
                j=j+1;
            end
        end
        clear temp
    end
Stats(:,d)=no';

clear no tpsamples;
end
end