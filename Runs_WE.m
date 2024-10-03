function Stats = Runs_WE(samples, ch, k,r,c)
if nargin<4
    error('Runs:Runs_E:TooFewInputs','Input arguments are undefined.');
elseif nargin<5
    c=0;
end
[nrows,ncols]=size(samples);

if nrows==1
    samples=vec2mat(samples,ncols);
end

klength=length(k);
Stats=repmat(ncols+1,nrows,klength);
for d=1:klength
    if c==1
        tpsamples=[samples samples(:,[1:k(d)-1])];
    else
        tpsamples=samples;
    end
    [nrows,ncols]=size(tpsamples);

    for i=1:nrows
        run_count=0;
        tline1=tpsamples(i,:);
        run_count=all(tline1(1:k(d))==ch) && (tline1(k(d)+1)~=ch);
        if run_count==r
            Stats(i,d)=k(d);
        end
        idx=k(d)*run_count+2;
        while idx<=(ncols-k(d)-1)
            if (tline1(idx-1)~=ch) && all(tline1(idx:idx+k(d)-1)==ch) && (tline1(idx+k(d))~=ch)
                run_count=run_count+1;
                if run_count==r
                    Stats(i,d)=idx+k(d)-1;break;
                end
                idx=idx+k(d);
            else
                idx=idx+1;
            end
        end
        if (tline1(idx-1)~=ch) && all(tline1(idx:idx+k(d)-1)==ch)
            run_count=run_count+1;
            if run_count==r
                Stats(i,d)=idx+k(d)-1;break;
            end
        end
    end
end
