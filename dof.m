function varargout = dof(varargin)
% DOF MATLAB code for dof.fig
%      DOF, by itself, creates a new DOF or raises the existing
%      singleton*.
%
%      H = DOF returns the handle to a new DOF or the handle to
%      the existing singleton*.
%
%      DOF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DOF.M with the given input arguments.
%
%      DOF('Property','Value',...) creates a new DOF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dof_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dof_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dof

% Last Modified by GUIDE v2.5 14-May-2018 10:58:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dof_OpeningFcn, ...
                   'gui_OutputFcn',  @dof_OutputFcn, ...
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


% --- Executes just before dof is made visible.
function dof_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dof (see VARARGIN)

% Choose default command line output for dof
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dof wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dof_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A undo
A=undo;
closereq;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A undo q sila polomer
undo=A;

q = cast(A,'double'); %cast prevede obrazek na double
[a b c] = size(q); %velikost obrazku
rozmaz=zeros(a,b,c); %naplni nulama

%% maska
spodnilimit=-ceil(3*sila); % spodni limit ovladany silou zaokrouhleny nahoru
hornilimit=ceil(3*sila); % horni limit ovladany silou zaokrouhleny nahoru
x=spodnilimit:hornilimit; %X od min do max
y=spodnilimit:hornilimit; %Y od min do max
for i=1:((hornilimit-spodnilimit)+1) % x
  for j=1:((hornilimit-spodnilimit)+1) % y
    maska(i,j)=(1/(2*pi*sila^2))*exp(-(x(i)^2+y(j)^2)/(2*sila^2)); % GAUSS VZOREC https://en.wikipedia.org/wiki/Gaussian_blur
  end
end
%% konvoluce
[n m] = size(maska); %velikost masky
n = floor(n/2);
m = floor(m/2);

k = maska(n-3:n+3, m-3:m+3);
k = k./(sum(sum(k)));

ram = zeros(a+6,b+6,c);
ram(4:3+a,4:3+b,:) = q;

for i = 4:a+3
  for j = 4:b+3
    m = ram(i-3:i+3, j-3:j+3, :);
    rozmaz(i-3, j-3,1) = sum(dot(k,m(:, :, 1)));
    rozmaz(i-3, j-3,2) = sum(dot(k,m(:, :, 2)));
    rozmaz(i-3, j-3,3) = sum(dot(k,m(:, :, 3)));
  end
end

A = cast(rozmaz,'uint8'); %prevede obrazek zpet na 8-bit integer, aby se zobrazil
imshow(A); %zobrazi


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
global A
imshow(A);


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sila

contents = get(handles.popupmenu1,'String'); 
sila = contents{get(handles.popupmenu1,'Value')};



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global polomer

contents = get(handles.popupmenu2,'String'); 
polomer = contents{get(handles.popupmenu2,'Value')}



% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A
closereq;
imshow(A);
