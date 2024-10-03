function Stats=Runs_X(samples,ch,n,k,l,c)
if nargin<5
    error('Runs:Runs_N:TooFewInputs','Input arguments are undefined.');
elseif nargin<6
    c=0;
end

[nrows,ncols]=size(samples);

if ncols<n
    error('Runs:Runs_N:WrongInputs','Column size and sequence length are not matching');
elseif nrows==1 && mod(ncols,n)==0
    samples=vec2mat(samples,ncols);
end

klength=length(k);
for d=1:klength
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
                    no(i)=no(i)+1;j=j+k(d)-l;
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