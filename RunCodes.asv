function Stats=Runs_N(samples,ch,n,k,c)
% ----------------------------------------------
%
%  Nnk = Runs_N(samples,ch,n,k,c)
%
%  This function returns the  number of non-overlapping success
%  runs of length k in 'samples' sequences, where each row represents
%  the 'n' trials and 'k' represents required run length of states 'ch'.
%  c = 1 for circular sequences
%
%  Description:
%  Feller (1968) introduced a counting scheme of runs called non-
%  overlapping counting scheme of runs. According to this counting
%  scheme two consecutive success runs may not be separated by
%  any failure. In practice if we count for number of occurrences of
%  success runs of length k under this counting scheme, the counting
%  of consecutive success runs has to be restarted when the desired
%  run of length k is reached.
%
%  N_(n,k_i)^i :
%  The number of non-overlapping i-run of length k_i in the n base
%  pairs in the sense of Feller's(1968) counting. According to this
%  counting schemes once consecutive k_i times i's  are observed,
%  it is counted as one non-overlapping i-run of length k_i and the
%  enumeration procedure starts a new from scratch.
%
%  Example:
%
%  Input:
%  z = [1,0,1,1,1,1,1,0,1,1,1,0,0,0,1,1,1,0,1,1];
%  statistic  = Runs_N(z,1,20,3,0)
%  statistic1 = Runs_N(z,1,20,3,1)
%
%  output:
%  statistic = 3
%  statistic1 = 4
%
%  Input:
%  z = binornd(1,0.65,200,20);
%  statistic = Runs_N(z,1,20,3,0);
%  m = describe(statistic)
%  m.Empirical_CDF
%
%  output:
%
%  m =
%
%           Mean: 2.6350
%        Minimum: 0
%        Maximum: 6
%           Mode: 2
%         Median: 3
%          Range: 6
%          Stdev: 1.3155
%       Variance: 1.7304
%  Empirical_CDF: [7x3 double]
%           Diag: 174.0022
%
%  ans =
%
%       0    6.0000    0.0300
%  1.0000   38.0000    0.1900
%  2.0000   98.0000    0.4900
%  3.0000  155.0000    0.7750
%  4.0000  182.0000    0.9100
%  5.0000  194.0000    0.9700
%  6.0000  200.0000    1.0000
%
%  References:
%  Feller, W. (1968). An Introduction to Probability Theory and
%    Its Applications, Vol. I (3rd ed.), John Wiley & Sons, New York.
%
%  See also:
%  Runs_M, Runs_G, Runs_E and Runs_X
%
% ----------------------------------------------


% total=length(samples);
% if k>n
%  no=0;
% else
%  for i=1:total-n+1
%  samples1=samples(i:i+n-1);
%  j=1;no(i)=0;
%  while j<=n-k+1
%  temp=min(samples1(j:j+k-1)==ch);
%  no(i)= no(i)+temp;
%  j=j+1+(k-1)*temp;
%  end
%  end
% end
% no=tabulate(no);

if nargin<4
    error('Runs:Runs_N:TooFewInputs','Input arguments are undefined.');
elseif nargin<5
    c=0;
end

[nrows,ncols]=size(samples);

if ncols<n
    error('Runs:Runs_N:WrongInputs','Column size and sequence length are not matching');
elseif nrows==1 && mod(ncols,n)==0
    samples=vec2mat(samples,ncols);
end

r=length(k);
for d=1:r
    if c==1
        tpsamples=[samples samples(:,[1:k(d)-1])];
    else
        tpsamples=samples;
    end
    [nrows,ncols]=size(tpsamples);

    if k(d)>n
        no=0;
    else

        for i=1:nrows
            ncols_temp=ncols;
            temp = tpsamples(i,:);
            j=k(d);
            no(i)=0;

            while j<=ncols_temp
                if min(temp(j-k(d)+1:j)==ch)==1
                    no(i)=no(i)+1;j=j+k(d);
                else
                    j=j+1;
                end
            end
        end
        clear temp j ncols_temp
    end
    Stats(:,d)=no';

    clear no tpsamples;
end
end



function Stats=Runs_E(samples,ch,n,k,c)
% ----------------------------------------------
%  Enk = Runs_E(samples,ch,n,k,c)
%
%  This function returns the number of E(n,k) of character/state 'ch'
%  in samples for the 'n' trials 'k' run length of character/state 'ch'.
%
%  samples = Matrix of size m*n, where 'm' sample sequences of length 'n' should be arranged in rows.
%  ch      = State or Character for which runs to be calculated.
%  n       = Number of trials/ Length of the sequence.
%  k       = length of 'ch'-run to calculate in n trials.
%  c       = 0 for linear sequnces and 1 for circular sequences.
%
%  Description:
%  Mood (1940) introduced this counting scheme of runs.
%  In this counting scheme, a run (consecutive occurrences)
%  of successes of length k followed and preceded by the
%  failure is considered to be the run of exact length k. Thus
%  this classical definition of runs asserts that the consecutive
%  runs must be separated by one or more failures. This
%  scheme of counting runs is the oldest counting scheme.
%
%  E(n,k)^i:
%  The number of i-runs of exact length k followed by any other
%  character other than i in sense of Mood's (1940) counting. In this
%  counting scheme, i-run of length k followed (except the run
%  that completes at the last) and preceded (except the run
%  that starts at the first) by any other other
%  than i is considered to be the run of exact length k. Thus the
%  classical definition of runs asserts that the consecutive i-runs
%  must be separated by one or more state other than i.
%
%  Example:
%  Input:
%  z = [1,0,1,1,1,1,1,0,1,1,1,0,0,0,1,1,1,0,1,1];
%  statistic  = Runs_E(z,1,20,3,0)   % Linear Sequence
%  statistic1 = Runs_E(z,1,20,3,1)   % Circular Sequence
%
%  output:
%  statistic = 2
%  statistic1 = 3
%
%  z = binornd(1,0.65,200,20);
%  statistic = Runs_E(z,1,20,3,0);   % Run Statistic for each sequence
%  m = describe(statistic)           % Descriptive Statistics
%  m.Empirical_CDF
%
%  Output:
%
%  m =
%
%           Mean: 0.7200
%        Minimum: 0
%        Maximum: 3
%           Mode: 0
%         Median: 1
%          Range: 3
%          Stdev: 0.7840
%       Variance: 0.6147
%  Empirical_CDF: [4x3 double]
%           Diag: 174.0054
%
%  ans =
%
%       0   91.0000    0.4550
%  1.0000  171.0000    0.8550
%  2.0000  194.0000    0.9700
%  3.0000  200.0000    1.0000
%
%  Reference:
%  Mood, A. M. (1940). The Distribution Theory of Runs, Annals
%  of Mathematical Statistics, 11, 367-392.
%
%  See also:
%  Runs_N, Runs_M, Runs_G and Runs_X
% ----------------------------------------------
if nargin<4
    error('Runs:Runs_E:TooFewInputs','Input arguments are undefined.');
elseif nargin<5
    c=0;
end
[nrows,ncols]=size(samples);

if ncols<n
    error('Runs:Runs_E:WrongInputs','Column size and sequence length are not matching');
elseif nrows==1 && mod(ncols,n)==0
    samples=vec2mat(samples,ncols);
end

r=length(k);
for d=1:r
    if c==1
        tpsamples=[samples samples(:,[1:k(d)-1])];
    else
        tpsamples=samples;
    end
    [nrows,ncols]=size(tpsamples);

    if k(d)>n
        no=0;
    else
        for i=1:nrows
            tline1=tpsamples(i,:);
            j=1;
            ncols_temp=ncols;no(i)=0;

            if c==0
                no(i)= min(tline1(1:k(d))==ch)*(tline1(k(d)+1)~=ch);
            elseif (tline1(ncols)~=ch)*min(tline1(1:k(d))==ch)*(tline1(k(d)+1)~=ch)==1
                no(i)= 1;
            end

        end
        j=j+1;
        while j<ncols_temp-k(d)+1
            if min(tline1(j:j+k(d)-1)==ch)*min(tline1([j-1,j+k(d)])~=ch)==1
                no(i)= no(i)+1; j=j+k(d)+1;
            else
                j=j+1;
            end
        end
        no(i)= no(i)+min(tline1(ncols_temp-k(d)+1:ncols_temp)==ch)*(tline1(k(d))~=ch);
    end
    Stats(:,d)=no';
    clear no tpsamples
end
end

function Stats=Runs_G(samples,ch,n,k,c)
% ----------------------------------------------
%  Gnk = Runs_G(tline,ch,n,k,c)
%
%   This function returns the number of G(n,k) of char 'ch'
%   in string 'tline' for the 'n' trials 'k' run length of character
%   'ch'.
%  c = 1 for circular sequences
%  Description:
%  In the Classical literature a run of length k meant an
%  un-interrupted sequence of either exactly or at least k
%  successes. Runs counted under this counting scheme
%  are known as runs of length at least k. Goldstein (1990)
%  has introduced this counting scheme of runs.
%
%  G_(n,k_i)^i :
%  The number of i-runs of length greater than or equal to k_i in
%  n base pairs. Such runs are also referred as runs of length at
%  least k_i.
%
%  Example:
%
%  Input:
%  z = [1,0,1,1,1,1,1,0,1,1,1,0,0,0,1,1,1,0,1,1];
%  statistic  = Runs_G(z,1,20,3,0)
%  statistic1 = Runs_G(z,1,20,3,1)
%
%  output:
%  statistic = 3
%  statistic1 = 4
%
%  z = binornd(1,0.65,200,20);
%  statistic = Runs_G(z,1,20,3,0);
%  m = describe(statistic)
%  m.Empirical_CDF
%
%  Output:
%  m =
%
%               Mean: 1.9250
%            Minimum: 0
%            Maximum: 4
%               Mode: 2
%             Median: 2
%              Range: 4
%              Stdev: 0.8444
%           Variance: 0.7129
%      Empirical_CDF: [5x3 double]
%               Diag: 174.0016
%
%  ans =
%
%           0    6.0000    0.0300
%      1.0000   61.0000    0.3050
%      2.0000  154.0000    0.7700
%      3.0000  194.0000    0.9700
%      4.0000  200.0000    1.0000
%
%  Reference:
%  Goldstein, L. (1990). Poisson approximation and DNA
%  sequence matching, Communications in Statistics -Theory
%  and Methods, 19(11), 4167-4179.
%
%  See also:
%  Runs_N, Runs_M, Runs_E, Runs_X and Runs_Mn
% ----------------------------------------------
if nargin<4
    error('Runs:Runs_N:TooFewInputs','Input arguments are undefined.');
elseif nargin<5
    c=0;
end

[nrows,ncols]=size(samples);

if ncols<n
    error('Runs:Runs_N:WrongInputs','Column size and sequence length are not matching');
elseif nrows==1 && mod(ncols,n)==0
    samples=vec2mat(samples,ncols);
end

r=length(k);
for d=1:r
    if c==1
        tpsamples=[samples samples(:,[1:k(d)-1])];
    else
        tpsamples=samples;
    end
     [nrows,ncols]=size(tpsamples);

    if k(d)>n
        no=zeros(1,nrows);
    else
        for i=1:nrows
            clear tline1 ncols
            tline1=samples(i,:);
            ncols=length(tline1);
            if c==1
                ik=0;
                while ik<ncols
                    ik=ik+1;
                    if tline1(ik)~=ch
                        tline2= [tline1(ik:ncols) tline1(1:ik-1) tline1(ik:ik+k(d)-2)];
                        ik=ncols;
                    end
                end
                tline1=tline2;
                ncols=length(tline1);
            end

            j=1;
            if min(tline1(j:j+k(d)-1)==ch)==1
                no(i)= 1;            j=j+k(d);
            else
                no(i)=0;             j=j+1;
            end
            while j<=n-k(d)+1
                if min(tline1(j:j+k(d)-1)==ch)*(tline1(j-1)~=ch)==1
                    no(i)= no(i)+1;
                    j=j+k(d)+1;
                else
                    j=j+1;
                end
            end
        end
    end
    Stats(:,d)=no';

clear no tpsamples;
end
end

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

r=length(k);
for d=1:r
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

function Stats=Runs_X(samples,ch,n,k,l,c)
% ----------------------------------------------
%
%  Xnkl = Runs_X(samples,ch,n,k,l,c)
%
%  This function returns the number of Runs_N(n,k) of char 'ch'
%  in string 'samples' for the 'n' trials 'k' run length of character
%  'ch'.
%
%  Description:
%
%  If 0<=l<=k-1
%  l-overlapping runs of length  (0<=l<=k-1): Generalizing the
%  overlapping counting scheme of runs, Aki and Hirano (2000)
%  introduced l -overlapping counting scheme of runs for
%  (0<=l<=k-1). The l-overlapping number of success runs of
%  length k is the number of success runs each of which may
%  have an overlapping part of length at most l with the
%  previous success run of length k that has been counted.
%
%  	X_(n,k_i,l_i)^(i+):
%  The number of l_i-overlapping (0<=l_i<=k_i-1) i-runs of length
%  k_i in n base pairs according to the generalized overlapping
%  counting scheme introduced by Aki and Hirano (2000) i.e. the
%  number of i-runs of length k_i which may have overlapping
%  part of length l_i with the previous i-runs of length k_i that
%  has been counted.
%
%  Example:
%  z = [1,0,1,1,1,1,1,0,1,1,1,0,0,0,1,1,1,0,1,1];
%  statistic  = Runs_X(z,1,20,3,1,0)
%  statistic1  = Runs_X(z,1,20,3,1,1)
%
%  output:
%  statistic = 4
%  statistic1 = 5
%
%  Input:
%  z = binornd(1,0.65,200,20);
%  statistic = Runs_X(z,1,20,3,1,0);
%  m = describe(statistic)
%  m.Empirical_CDF
%
%  output:
%  m =
%
%           Mean: 3.0050
%        Minimum: 0
%        Maximum: 8
%           Mode: 2
%         Median: 3
%          Range: 8
%          Stdev: 1.5154
%       Variance: 2.2965
%  Empirical_CDF: [9x3 double]
%           Diag: 174.0028
%
%  ans =
%
%       0    3.0000    0.0150
%  1.0000   32.0000    0.1600
%  2.0000   83.0000    0.4150
%  3.0000  128.0000    0.6400
%  4.0000  170.0000    0.8500
%  5.0000  190.0000    0.9500
%  6.0000  194.0000    0.9700
%  7.0000  199.0000    0.9950
%  8.0000  200.0000    1.0000
%
%
%  Reference:
%  Aki, S. and Hirano, K. (2000). Number of success runs of
%  specified length until certain stopping time rules and
%  generalized binomial distributions of order k, Annals of
%  the Institute of Statistical Mathematics, 52, 767-777.
%
%
%  If l<=0
%  l-overlapping runs of length k (l<=0): Han and Aki (2000)
%  introduced the l -overlapping counting scheme for l<=0. It
%  is intuitively assumed that there is a |l| trials difference in
%  two success runs of length k. This means that start to count
%  a success run of length k at an interval of |l| trials apart.
%
%  X_(n,k_i,l_i)^(i-):
%  Denotes the number of l_i-overlapping (l_i<0) i-runs of length
%  k_i in n base pairs according to Han and Aki (2000) i.e. the
%  number of i-runs of length k_i which are at least |l_i | base
%  pairs apart from each other.
%
%  References:
%  Han, S. and Aki, S. (2000). A unified approach to binomial-type
%  distributions of order k, Communications in Statistics- Theory
%  and Methods, 29(8), 1929-1943.
%
%  See also:
%  Runs_M, Runs_G, Runs_E and Runs_X
%
% ----------------------------------------------

% disp('_')
% total=length(tline);
% if k>n
%  no=0;
% else
%  for i=1:total-n+1
%  tline1=tline(i:i+n-1);
%  j=1;no(i)=0;
%  while j<=n-k+1
%  no(i)= no(i)+min(tline1(j:j+k-1)==ch);
%  j=j+1+(k-l-1)*min(tline1(j:j+k-1)==ch);% For l-overlapping part of length l with previous success run of length k
%  end
%  end
% end
% no=tabulate(no);

if nargin<4
    error('Runs:Runs_N:TooFewInputs','Input arguments are undefined.');
elseif nargin<5
    c=0;
end
[nrows,ncols]=size(samples);

if ncols<n
    error('Runs:Runs_N:WrongInputs','Column size and sequence length are not matching');
elseif nrows==1 && mod(ncols,n)==0
    samples=vec2mat(samples,ncols);
end


r=length(k);
for d=1:r
    if c==1
        tpsamples=[samples samples(:,[1:k(d)-1])];
    else
        tpsamples=samples;
    end
    [nrows,ncols]=size(tpsamples);

    if k(d)>n
        no=0;
    else
        for i=1:nrows
            clear tline1 ncols
            tline1=samples(i,:);
            ncols=length(tline1);
            if c==1
                ik=0;
                while ik<ncols
                    ik=ik+1;
                    if tline1(ik)~=ch
                        tline2= [tline1(ik:ncols) tline1(1:ik-1) tline1(ik:ik+k(d)-2)];
                        ik=ncols;
                    end
                end
                tline1=tline2;
                ncols=length(tline1);
            end
            j=1;    no(i)=0;
            while j<=n-k(d)+1
                if min(tline1(j:j+k(d)-1)==ch)==1
                    no(i)= no(i)+1;
                    j=j+k(d)-l(d); % For l-overlapping part of length l with previous success run of length k
                else
                    j=j+1;
                end
            end
        end
    end
    Stats(:,d)=no';

clear no tpsamples
end
end
