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

klength = length(k);

for d = 1:klength
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


