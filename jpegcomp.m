function varargout = jpegcomp(varargin)
% JPEGCOMP MATLAB code for jpegcomp.fig
%      JPEGCOMP, by itself, creates a new JPEGCOMP or raises the existing
%      singleton*.
%
%      H = JPEGCOMP returns the handle to a new JPEGCOMP or the handle to
%      the existing singleton*.
%
%      JPEGCOMP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JPEGCOMP.M with the given input arguments.
%
%      JPEGCOMP('Property','Value',...) creates a new JPEGCOMP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before jpegcomp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to jpegcomp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help jpegcomp

% Last Modified by GUIDE v2.5 13-May-2018 12:36:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @jpegcomp_OpeningFcn, ...
                   'gui_OutputFcn',  @jpegcomp_OutputFcn, ...
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


% --- Executes just before jpegcomp is made visible.
function jpegcomp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to jpegcomp (see VARARGIN)

% Choose default command line output for jpegcomp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes jpegcomp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = jpegcomp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- close.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
msgbox('File not saved.')


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A jpegcomp
[filename,pathname]=uiputfile('*.jpg','save as');
name=fullfile(pathname,filename);
if isequal(filename,0)
   msgbox('No file saved. If you need help saving a file, please contact your system administrator.');
else
imwrite(A,name,'jpg','Quality',jpegcomp);
closereq;
msgbox('File saved.');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A jpegcomp
jpegcomp = get(hObject,'Value');
set(handles.text5, 'String', num2str(jpegcomp));
drawnow;



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
