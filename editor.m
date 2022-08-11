function varargout = editor(varargin)
% EDITOR MATLAB code for editor.fig
%      EDITOR, by itself, creates a new EDITOR or raises the existing
%      singleton*.
%
%      H = EDITOR returns the handle to a new EDITOR or the handle to
%      the existing singleton*.
%
%      EDITOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDITOR.M with the given input arguments.
%
%      EDITOR('Property','Value',...) creates a new EDITOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before editor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to editor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help editor

% Last Modified by GUIDE v2.5 15-May-2018 11:25:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @editor_OpeningFcn, ...
                   'gui_OutputFcn',  @editor_OutputFcn, ...
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


% --- Executes just before editor is made visible.
function editor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to editor (see VARARGIN)

%zobrazi soubor


% Choose default command line output for editor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global A x undo undoall redo jpegcomp;
A=' ';
jpegcomp=75;

% UIWAIT makes editor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = editor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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



% --------------------------------------------------------------------
function Exit_menu_Callback(hObject, eventdata, handles)
% hObject    handle to Exit_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function menu_file_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_edit_Callback(hObject, eventdata, handles)
% hObject    handle to menu_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_layer_Callback(hObject, eventdata, handles)
% hObject    handle to menu_layer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_select_Callback(hObject, eventdata, handles)
% hObject    handle to menu_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_window_Callback(hObject, eventdata, handles)
% hObject    handle to menu_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_help_Callback(hObject, eventdata, handles)
% hObject    handle to menu_help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function File_menu_exit_Callback(hObject, eventdata, handles)
% hObject    handle to File_menu_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;


% --------------------------------------------------------------------
function File_menu_new_Callback(hObject, eventdata, handles)
% hObject    handle to File_menu_new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function File_menu_open_Callback(hObject, eventdata, handles)
% hObject    handle to File_menu_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%[file,path]=uigetfile({'*.png';'*.jpg';'*.bmp';'*.*'},'File Selector');
global A undoall
[file,path] = uigetfile({...
'*.png;*.jpg;*.gif;*.bmp;*.tiff;*.',...
   'All image files (*.png,*.jpg,*.gif,*.bmp,*.tiff)'; ...
   '*.png','Portable Network Graphics  (*.png)'; ...
   '*.jpg;*.jpeg','JPEG (*.jpg, *.jpeg)'; ...
   '*.gif','Graphics Interchange Format (*.gif)'; ...
   '*.bmp','Windows Bitmap (*.bmp)'; ...
   '*.tiff;*.tif','Tagged Image File Format (*.tiff, *.tif)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Select a File');
if isequal(file,0)
   msgbox('No file selected. If you need help selecting a file, please contact your system administrator.');
   
else
A = imread(fullfile(path,file));
undoall=A;
undo=0;
imshow(A);
axis image;
end

% --------------------------------------------------------------------
function File_menu_save_Callback(hObject, eventdata, handles)
% hObject    handle to File_menu_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% -SAVE JPEG COMPRESSED-----------------------------------------------------------
function File_menu_saveas_Callback(hObject, eventdata, handles)
% hObject    handle to File_menu_saveas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure(jpegcomp);


% --------------------------------------------------------------------
function File_menu_closefile_Callback(hObject, eventdata, handles)
% hObject    handle to File_menu_closefile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.File_menu_open,'reset')

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set( gca, 'DataAspectRatioMode', 'manual' )
    set(gca,'Position',[0.06, 0.22, 0.78 0.74]); 
    %value 1 is 100 percents? Vector is [left bottom width height]
    %set(gca, 'XLim',[-2,2]);
    %set(gca, 'YLim',[-2,2]);


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% OPEN
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undoall
[file,path] = uigetfile({...
'*.png;*.jpg;*.gif;*.bmp;*.tiff;*.',...
   'All image files (*.png,*.jpg,*.gif,*.bmp,*.tiff)'; ...
   '*.png','Portable Network Graphics  (*.png)'; ...
   '*.jpg;*.jpeg','JPEG (*.jpg, *.jpeg)'; ...
   '*.gif','Graphics Interchange Format (*.gif)'; ...
   '*.bmp','Windows Bitmap (*.bmp)'; ...
   '*.tiff;*.tif','Tagged Image File Format (*.tiff, *.tif)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Select a File');
if isequal(file,0)
   msgbox('No file selected. If you need help selecting a file, please contact your system administrator.');
   
else
A = imread(fullfile(path,file));
undoall=A;
imshow(A);
axis image;
end


% Open-toolbar---------------------------------------------------------------
function toolbar_open_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to toolbar_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undoall
[file,path] = uigetfile({...
'*.png;*.jpg;*.gif;*.bmp;*.tiff;*.',...
   'All image files (*.png,*.jpg,*.gif,*.bmp,*.tiff)'; ...
   '*.png','Portable Network Graphics  (*.png)'; ...
   '*.jpg;*.jpeg','JPEG (*.jpg, *.jpeg)'; ...
   '*.gif','Graphics Interchange Format (*.gif)'; ...
   '*.bmp','Windows Bitmap (*.bmp)'; ...
   '*.tiff;*.tif','Tagged Image File Format (*.tiff, *.tif)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Select a File');
if isequal(file,0)
   msgbox('No file selected. If you need help selecting a file, please contact your system administrator.');
   
else
A = imread(fullfile(path,file));
undoall=A;
imshow(A);
axis image;
end


% filter-nic--------------------------------------------------------------
function menu_filter_Callback(hObject, eventdata, handles)
% hObject    handle to menu_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% -GRAYSCALE------------------------------------------------------------
function filter_menu_grayscale_Callback(hObject, eventdata, handles)
% hObject    handle to filter_menu_grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undo
t=A;
undo=A;
x=cast(rgb2gray(t),'uint8');
imshow(x)
A=x;


% -BINARIZE------------------------------------------------------------
function filter_menu_binarize_Callback(hObject, eventdata, handles)
% hObject    handle to filter_menu_binarize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undo
t=A;
undo=A;
x=im2bw(t);
imshow(x);
A=x;


% -ROTACEVPRAVO--------------------------------------------------------------
function edit_menu_rotate90_Callback(hObject, eventdata, handles)
% hObject    handle to edit_menu_rotate90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undo
t=A;
undo=A;
x=imrotate(t,90);
imshow(x);
A=x;


% -ROTACEVLEVO-----------------------------------------------------------
function edit_menu_rotateL90_Callback(hObject, eventdata, handles)
% hObject    handle to edit_menu_rotateL90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undo
t=A;
undo=A;
x=imrotate(t,-90);
imshow(x);
A=x;


% -ROTACE180--------------------------------------------------------------
function edit_menu_rotate180_Callback(hObject, eventdata, handles)
% hObject    handle to edit_menu_rotate180 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undo
t=A;
undo=A;
x=imrotate(t,180);
imshow(x);
A=x;


% -CROP-------------------------------------------------------------
function edit_menu_crop_Callback(hObject, eventdata, handles)
% hObject    handle to edit_menu_crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undo
t=A;
undo=A;
x=imcrop(t);
imshow(x);
A=x;


% -UNDO-toolbar-------------------------------------------------------------
function toolbar_undo_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to toolbar_undo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A undo redo
tf = isequal(A,undo);
if undo==0
   msgbox('Nothing to undo.');
elseif tf==1
        msgbox('Nothing to undo.');
else
redo=A;
A=undo;
imshow(A);
end


% UNDO---------------------------------------------------------------
function edit_menu_undo_Callback(hObject, eventdata, handles)
% hObject    handle to edit_menu_undo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A undo redo
tf = isequal(A,undo);
if undo==0
   msgbox('Nothing to undo.');
elseif tf==1
        msgbox('Nothing to undo.');
else
redo=A;
A=undo;
imshow(A);
end


% UNDO--ALL-------------------------------------------------------------
function edit_menu_undoall_Callback(hObject, eventdata, handles)
% hObject    handle to edit_menu_undoall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A undoall redo
if A==undoall
   msgbox('Nothing to undo.');
else
redo=A;
A=undoall;
imshow(A);
end

% REDO-------------------------------------------------------------
function edit_menu_redo_Callback(hObject, eventdata, handles)
% hObject    handle to edit_menu_redo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A undo redo
if undo==0
   msgbox('Nothing to redo.');
else
A=redo;
imshow(A);
end


% -NEW-toolbar-------------------------------------------------------------
function toolbar_new_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to toolbar_new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% REDO-------------------------------------------------------
function toolbar_redo_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to toolbar_redo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A undo redo
if undo==0
   msgbox('Nothing to redo.');
else
A=redo;
imshow(A);
end


% OTEVRE RESIZE OKNO---------------------------------------------------------------
function edit_menu_resizescale_Callback(hObject, eventdata, handles)
% hObject    handle to edit_menu_resizescale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% otevre nove okno
figure(resize);


% -NEGATIVE-----------------------------------------------------------------
function filter_menu_negative_Callback(hObject, eventdata, handles)
% hObject    handle to filter_menu_negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undo
t=A;
undo=A;
x=imcomplement(t);
imshow(x);
A=x;


% --GAUSS---------------------------------------------------------------
function filter_menu_gaussian_blur_Callback(hObject, eventdata, handles)
% hObject    handle to filter_menu_gaussian_blur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure(gauss_blur);


% SAVE-TLACITKO--------------------------------------------------------------
function toolbar_save_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to toolbar_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A jpegcomp
[filename,pathname,filterindex] = uiputfile({...
   '*.png','Portable Network Graphics  (*.png)'; ...
   '*.jpg;*.jpeg','JPEG (*.jpg, *.jpeg)'; ...
   '*.bmp','Windows Bitmap (*.bmp)'}, ...
   'Save As');
name=fullfile(pathname,filename);
% png = isequal(indx,1);
% jpg = isequal(indx,2);
% gif = isequal(indx,3);
% bmp = isequal(indx,4);
if isequal(filename,0)
   msgbox('No file saved. If you need help saving a file, please contact your system administrator.');
elseif filterindex==1
imwrite(A,name,'png');
elseif filterindex==2
imwrite(A,name,'jpg','Quality',jpegcomp);
elseif filterindex==3
imwrite(A,name,'bmp');
end


% --------------------------------------------------------------------
function Stylize_Callback(hObject, eventdata, handles)
% hObject    handle to Stylize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function filter_menu_stylizemenu_negativeout_Callback(hObject, eventdata, handles)
% hObject    handle to filter_menu_stylizemenu_negativeout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undo
x=A;
undo=A;
%filtr
x = entropyfilt(A,getnhood(strel('diamond',6)));
%
x = x/max(x(:));
%kontrast
x = imadjust(x,[0.20; 0.9],[0.80; 0.00], 1.00);
A=x;
imshow(A)


% --------------------------------------------------------------------
function uipushtool8_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure(jpegcomp);


% --------------------------------------------------------------------
function help_menu_about_Callback(hObject, eventdata, handles)
% hObject    handle to help_menu_about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Matlab Image Editor. Made by Petr Michalek, Sara Sujova, Karel.');


% --------------------------------------------------------------------
function help_menu_egg_Callback(hObject, eventdata, handles)
% hObject    handle to help_menu_egg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Just use Gimp, mspaint, Paint.NET or Photoshop.');


% --------------------------------------------------------------------
function filter_menu_stylize_sunset_Callback(hObject, eventdata, handles)
% hObject    handle to filter_menu_stylize_sunset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undo
undo=A;
x=A;
x=imadjust(A,[0.2 0.3 0; 0.6 0.7 1.0],[]);
imshow(x);
A=x;


% --------------------------------------------------------------------
function filter_menu_stylize_sea_Callback(hObject, eventdata, handles)
% hObject    handle to filter_menu_stylize_sea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undo
undo=A;
x=A;
x=imadjust(A,[0.4 0.5 0; 0.8 0.9 1.0],[]);
imshow(x);
A=x;


% --------------------------------------------------------------------
function filter_menu_stylize_darken_Callback(hObject, eventdata, handles)
% hObject    handle to filter_menu_stylize_darken (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undo
undo=A;
x=A;
x=imadjust(A,[0.1 0.1 0.1; 1 1 1],[]);
imshow(x);
A=x;


% --------------------------------------------------------------------
function filter_menu_stylize_d_Callback(hObject, eventdata, handles)
% hObject    handle to filter_menu_stylize_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undo
undo=A;
x=A;
x=A+10;
imshow(x);
A=x;


% --------------------------------------------------------------------
function filter_menu_deblur_Callback(hObject, eventdata, handles)
% hObject    handle to filter_menu_deblur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undo
undo=A;
x=A;
q=21;
w=11;
filterparameters = fspecial('motion',q,w);
noise=0;
x = deconvwnr(A,filterparameters, noise);
imshow(x)
A=x;


% --------------------------------------------------------------------
function filter_menu_motion_blur_Callback(hObject, eventdata, handles)
% hObject    handle to filter_menu_motion_blur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x undo
undo=A;
x=A;
q=21;
w=11;
filterparameters = fspecial('motion',q,w);
blurred = imfilter(x,filterparameters, 'conv', 'circular');
imshow(x)
A=x;


% -Paint---------------------------------------------------------------
function uipushtool9_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure(paint);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function filter_menu_dof_Callback(hObject, eventdata, handles)
% hObject    handle to filter_menu_dof (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure(dof);


% --------------------------------------------------------------------
function filter_menu_sharpen_Callback(hObject, eventdata, handles)
% hObject    handle to filter_menu_sharpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure(sharpen);
