function varargout = sharpen(varargin)
% SHARPEN MATLAB code for sharpen.fig
%      SHARPEN, by itself, creates a new SHARPEN or raises the existing
%      singleton*.
%
%      H = SHARPEN returns the handle to a new SHARPEN or the handle to
%      the existing singleton*.
%
%      SHARPEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHARPEN.M with the given input arguments.
%
%      SHARPEN('Property','Value',...) creates a new SHARPEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sharpen_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sharpen_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sharpen

% Last Modified by GUIDE v2.5 15-May-2018 10:56:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sharpen_OpeningFcn, ...
                   'gui_OutputFcn',  @sharpen_OutputFcn, ...
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


% --- Executes just before sharpen is made visible.
function sharpen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sharpen (see VARARGIN)

% Choose default command line output for sharpen
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sharpen wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sharpen_OutputFcn(hObject, eventdata, handles) 
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
A = undo;
closereq;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ostre A
A = ostre;
closereq;
imshow(A);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%sharpen

global A undo x ostre
undo = A;
a = im2double(A); %prevede na double pro vetsi rozsah
% a = cast(obr,'double');
laplacian = [-1 -1 -1; -1 8 -1; -1 -1 -1]; %matice pro filtrovani

%% konvoluce pomoci imfilter - mela by byt daleko rychlejsi (pouziva Intel Performance Primitives Library)
% resp = imfilter(a, lap, 'conv'); 
%% 

%% konvoluce "rucne"
for i=1:size(a,1)-2
    for j=1:size(a,2)-2
       
        filtrovane(i,j)=sum(sum(laplacian.*a(i:i+2,j:j+2)));
       
    end
end
%%

% normalizace rozsahu filtrovaneho obrazku
minFiltrovane = min(filtrovane(:));
maxFiltovane = max(filtrovane(:));
filtrovane = (filtrovane - minFiltrovane) / (maxFiltovane - minFiltrovane);

% secteni filtrovaneho a puvodniho
filtrovane = padarray(filtrovane,[1,1]); % pridame nuly na okraje matice kvuli rozmerum
ostre = a + filtrovane; %secteni

% normalizace zostreneho obrazku
minOstre = min(ostre(:));
maxOstre = max(ostre(:));
ostre = (ostre - minOstre) / (maxOstre - minOstre);

% pokus o opraveni kontrastu
ostre = imadjust(ostre, [55/255 200/255], [0 1]);

imshow(ostre);
