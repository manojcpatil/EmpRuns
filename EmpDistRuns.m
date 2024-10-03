function varargout = EmpDistRuns(varargin)
% EMPDISTRUNS M-file for EmpDistRuns.fig
%      EMPDISTRUNS, by itself, creates a new EMPDISTRUNS or raises the existing
%      singleton*.
%
%      H = EMPDISTRUNS returns the handle to a new EMPDISTRUNS or the handle to
%      the existing singleton*.
%
%      EMPDISTRUNS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EMPDISTRUNS.M with the given input arguments.
%
%      EMPDISTRUNS('Property','Value',...) creates a new EMPDISTRUNS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EmpDistRuns_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EmpDistRuns_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EmpDistRuns

% Last Modified by GUIDE v2.5 24-Dec-2023 16:07:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @EmpDistRuns_OpeningFcn, ...
    'gui_OutputFcn',  @EmpDistRuns_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before EmpDistRuns is made visible.
function EmpDistRuns_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EmpDistRuns (see VARARGIN)

% Choose default command line output for EmpDistRuns
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EmpDistRuns wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EmpDistRuns_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Allow users to pick CSV or TXT files
% Allow users to pick CSV or TXT files
% Allow users to pick CSV or TXT files
fileFilter = {'*.csv;*.txt', 'CSV or TXT Files (*.csv, *.txt)'};
a = uigetfile(fileFilter, 'Pick a file from Examples');

if strcmpi(a(length(a)-3:length(a)), '.csv')
    % Read CSV file using csvread
    samples = csvread(a);
elseif strcmpi(a(length(a)-3:length(a)), '.txt')
    % Read text file using load
    samples = load(a);
else
    error('Unsupported file format. Please select a CSV or TXT file.');
end

val=get(handles.listbox4,'value');
ch=str2num(get(handles.edit1,'String'));
n=str2num(get(handles.edit2,'String'));
k=str2num(get(handles.edit3,'String'));
c=0;
if val==1
    table=Runs_N(samples,ch,n,k,c);
elseif val==2
    table=Runs_M(samples,ch,n,k,c);
elseif val==3
    table=Runs_G(samples,ch,n,k,c);
elseif val==4
    table=Runs_E(samples,ch,n,k,c);
elseif val==5
    l=str2num(get(handles.edit4,'String'));
    table=Runs_X(samples,ch,n,k,l,c);
elseif val==6
    l=str2num(get(handles.edit4,'String'));
    table=Runs_X(samples,ch,n,k,l,c);
elseif val==7
    r=str2num(get(handles.edit5,'String'));
    table=Runs_WN(samples,ch,k,r,c);
elseif val==8
    r=str2num(get(handles.edit5,'String'));
    table=Runs_WM(samples,ch,k,r,c);
elseif val==9
    r=str2num(get(handles.edit5,'String'));
    table=Runs_WG(samples,ch,k,r,c);
elseif val==10
    r=str2num(get(handles.edit5,'String'));
    table=Runs_WE(samples,ch,k,r,c);
end
disp(table)
if length(k)==1
    set(handles.text11, 'String', 'Emirical CDF of selected run statistic');    
    axes(handles.axes1);
    hist(table);  % Adjust the column index based on your data

    % Add labels and title if needed
    xlabel('Run Statistic');
    ylabel('Frequency');
    title('Histogram');
else
    set(handles.text11, 'String', 'Correlation of selected run statistics');
    % Calculate the correlation matrix
    correlationMatrix = corr(table);

    % Plot the heatmap in axes4 using imagesc
    axes(handles.axes1);
    imagesc(correlationMatrix);
    colormap('jet');  % You can change the colormap as needed

    % Add colorbar if needed
    colorbar;

    % Add title
    title('Heatmap of Table');

end
    
    
    

% table(:,3)=cumsum(table(:,2))./sum(table(:,2));
% plot(table(:,1),table(:,3));
% [m,n]=size(table);
% fprintf('\nX=x\tFreq\t\tF(x)\n');
% for i=1:m
%     fprintf('%d\t%6.0f\t%6.4f\n',table(i,1),table(i,2),table(i,3));
% end

function no=N(tline,ch,n,k)
% no=N(tline,ch,n,k) This function returns the number of N(n,k) of char 'ch'
% in string 'tline' for the 'n' trials 'k' run length of character 'ch'.
total=length(tline);
if k>n
    no=0;
else
    for i=1:total-n+1
        tline1=tline(i:i+n-1);
        j=1;no(i)=0;
        while j<=n-k+1
            temp=min(tline1(j:j+k-1)==ch);
            no(i)= no(i)+temp;
            j=j+1+(k-1)*temp;
        end
    end
end
no=tabulate(no);
function no=M(tline,ch,n,k,r)
% no=M(tline,ch,n,k) This function returns the number of M(n,k) of char 'ch'
% in string 'tline' for the 'n' trials 'k' run length of character 'ch'.
run=repmat(ch,1,k);
total=length(tline);
if k>n
    no=0;
else
    for i=1:total-n+1
        no(i)= length(strfind(tline(i:i+n-1),run));
    end
end
no=tabulate(no);
function no=G(tline,ch,n,k)
% no=G(tline,ch,n,k) This function returns the number of G(n,k) of char 'ch'
% in string 'tline' for the 'n' trials 'k' run length of character 'ch'.
total=length(tline);
if k>n
    no=0;
else
    for i=1:total-n+1
        tline1=tline(i:i+n-1);
        j=1;no(i)=0;
        no(i)= no(i)+min(tline1(j:j+k-1)==ch);
        j=j+1+(k-1)*min(tline1(j:j+k-1)==ch);
        while j<=n-k+1
            no(i)= no(i)+min(tline1(j:j+k-1)==ch)*(tline1(j-1)~=ch);
            j=j+1;
        end
    end
    no=no';
end
no=tabulate(no);
function no=X(tline,ch,n,k,l)
% no=N(tline,ch,n,k) This function returns the number of N(n,k) of char 'ch'
% in string 'tline'
total=length(tline);
if k>n
    no=0;
else
    for i=1:total-n+1
        tline1=tline(i:i+n-1);
        j=1;no(i)=0;
        while j<=n-k+1
            no(i)= no(i)+min(tline1(j:j+k-1)==ch);
            j=j+1+(k-l-1)*min(tline1(j:j+k-1)==ch);% For l-overlapping part of length l with previous success run of length k
        end
    end
end
no=tabulate(no);
function no=E(tline,ch,n,k)
% no=E(tline,ch,n,k) This function returns the number of E(n,k) of char 'ch'
% in string 'tline' for the 'n' trials 'k' run length of character 'ch'.
total=length(tline);
run=repmat(ch,1,k);
if k>n
    no=0;
else
    for i=1:total-n+1
        tline1=tline(i:i+n-1);
        j=1;no(i)=0;
        no(i)= no(i)+min(tline1(j:j+k-1)==ch)*(tline1(j+k)~=ch);
        j=j+1;
        while j<n-k+1
            no(i)= no(i)+min(tline1(j:j+k-1)==ch)*min(tline1([j-1,j+k])~=ch);
            j=j+1;
        end
        no(i)= no(i)+min(tline1(j:j+k-1)==ch)*(tline1(j-1)~=ch);
    end
end
no=tabulate(no);
function s=add(x,int)
if nargin<2
    int=1;
end
[m,n]=size(x);
if m==1|n==1
    s=0;
    for i=1:m
        for j=1:n
            s=s+x(i,j);
        end
    end
else
    if int==1
        for i=1:m
            s(i)=0;
            for j=1:n
                s(i)=s(i)+x(i,j);
            end
        end
        s=s';
    else
        for j=1:n
            s(j)=0;
            for i=1:m
                s(j)=s(j)+x(i,j);
            end
        end
    end
end
function no=WN(tline,ch,n,k,r)
% no=WN(tline,ch,n,k) This function returns the number of N(n,k) of char 'ch'
% in string 'tline'
run=repmat(ch,1,k);
run1=strcat(run,ch);
total=length(tline);
if k>n
    no=0;
else
    for i=1:total-n+1
        tline1=tline(i:i+n-1);
        j=1;rth=0;no(i)=0;
        while j<=n-k+1&rth<r
            rth= rth+min(tline1(j:j+k-1)==ch);
            j=j+1+(k-1)*min(tline1(j:j+k-1)==ch);
        end
        if rth==r
            no(i)=(j-1);
        else
            no(i)=(n+1);
        end
    end
end
no=tabulate(no);
function no=WM(tline,ch,n,k,r)
% no=WM(tline,ch,n,k) This function returns the number of WM(n,k,r) of char 'ch'
% in string 'tline'
run=repmat(ch,1,k);
total=length(tline);
if k>n
    no=0;
else
    for i=1:total-n+1
        a=strfind(tline(i:i+n-1),run)+(k-1);
        if length(a)<r
            no(i)=n+1;
        else
            no(i)= a(r);
        end
    end
end
no=tabulate(no);
function no=WG(tline,ch,n,k,r)
% no=WG(tline,ch,n,k,r) This function returns the number of WG(n,k,r) of char 'ch'
% in string 'tline'
total=length(tline);
run=repmat(ch,1,k);
if k>n
    no=0;
else
    for i=1:total-n+1
        tline1=tline(i:i+n-1);
        j=1;no(i)=0;rth=0;
        rth= min(tline1(j:j+k-1)==ch);
        j=j+1+(k-1)*rth;
        while j<=n-k+1&rth<r
            rth = rth + min(tline1(j:j+k-1)==ch)*(tline1(j-1)~=ch);
            if rth==r
                no(i)=j+k-1;
            end
            j=j+1;
        end
        if rth<r
            no(i)=n+1;
        end
    end
end
no=tabulate(no);
function no=WE(tline,ch,n,k,r)
% no=WE(tline,ch,n,k,r) This function returns the number of WE(n,k,r) of char 'ch'
% in string 'tline'
total=length(tline);
if k>n
    no=0;
else
    for i=1:total-n+1
        tline1=tline(i:i+n-1);
        no(i)=0;rth=0;
        j=1;rth=min(tline1(j:j+k-1)==ch)*(tline1(j+k)~=ch);
        j=j+1;
        while j<n-k+1&rth<r
            rth=rth+min(tline1(j:j+k-1)==ch)*min(tline1([j-1,j+k])~=ch);
            j=j+1;
        end
        if rth<r
            x=(min(tline1(j:j+k-1)==ch)*(tline1(j-1)~=ch));
            no(i)=n+(rth+x<r);
        else
            no(i)=j+k-1;
        end
    end
end
no=tabulate(no);
function mat=allposs(r)
% ALLPOSS All Possible permutations of 1,2,3,4
% MAT=ALLPOSS(r), where r is non negative integer.
% It returns all possible permutations of 1,2,3,4 of length r+1
% which is useful for checking the rth order markov dependency.
mat=[1:4]';
while r>0
    [m,n]=size(mat);
    diff=[ones(m,1) mat([1:m],:)];
    for i=2:4
        diff=[diff
            i*ones(m,1) mat([1:m],:)];
    end
    mat=diff;
    r=r-1;
end


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


