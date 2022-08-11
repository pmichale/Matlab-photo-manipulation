function varargout = paint(varargin)
% PAINT MATLAB code for paint.fig
%      PAINT, by itself, creates a new PAINT or raises the existing
%      singleton*.
%
%      H = PAINT returns the handle to a new PAINT or the handle to
%      the existing singleton*.
%
%      PAINT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAINT.M with the given input arguments.
%
%      PAINT('Property','Value',...) creates a new PAINT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before paint_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to paint_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help paint

% Last Modified by GUIDE v2.5 13-May-2018 19:25:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @paint_OpeningFcn, ...
                   'gui_OutputFcn',  @paint_OutputFcn, ...
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


% --- Executes just before paint is made visible.
function paint_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to paint (see VARARGIN)



% Choose default command line output for paint
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global A x BrushON slidr mouseX mouseY maxX maxY maxZ clickmouse;
global RedValue GreenValue BlueValue
imshow(A);
BrushON=0;
clickmouse=0;
RedValue=0;
BlueValue=0;
GreenValue=0;
RedValue=double(RedValue);
BlueValue=double(BlueValue);
GreenValue=double(GreenValue);
handles.slider2.Visible = 'off';
handles.slider3.Visible = 'off';
handles.slider6.Visible = 'off';
handles.slider7.Visible = 'off';
handles.text5.Visible = 'off';
handles.text6.Visible = 'off';
handles.text7.Visible = 'off';
handles.text8.Visible = 'off';
handles.uipanel3.Visible = 'off';
set (gcf, 'WindowButtonDownFcn',@mouseClick);
set (gcf, 'WindowButtonMotionFcn', @mouseMove);




% UIWAIT makes paint wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = paint_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in Surf_pushbutton.
function Surf_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Surf_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Mesh_pushbutton.
function Mesh_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Mesh_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in Contour_pushbutton.
function Contour_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Contour_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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
global maxX maxY maxZ
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
   disp('User selected Cancel');
else
    
A = imread(fullfile(path,file));
image(A)
axis image;
end

% --------------------------------------------------------------------
function File_menu_save_Callback(hObject, eventdata, handles)
% hObject    handle to File_menu_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function File_menu_saveas_Callback(hObject, eventdata, handles)
% hObject    handle to File_menu_saveas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
   disp('User selected Cancel');
else
A = imread(fullfile(path,file));
image(A);
axis image;
end


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A 
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
imshow(A);
axis image;
end


% --- Executes on button press in pushbutton_onetoone.
function pushbutton_onetoone_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_onetoone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x
t=A;
x=im2bw(t);
imshow(x);
A=x;


% --------------------------------------------------------------------
function menu_filter_Callback(hObject, eventdata, handles)
% hObject    handle to menu_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function filter_menu_grayscale_Callback(hObject, eventdata, handles)
% hObject    handle to filter_menu_grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x
t=A;
x=rgb2gray(t);
imshow(x)
A=x;


% --------------------------------------------------------------------
function filter_menu_binarize_Callback(hObject, eventdata, handles)
% hObject    handle to filter_menu_binarize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x
t=A;
x=im2bw(t);
imshow(x);
A=x;


% --------------------------------------------------------------------
function edit_menu_rotate90_Callback(hObject, eventdata, handles)
% hObject    handle to edit_menu_rotate90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x
t=A;
x=imrotate(t,90);
imshow(x);
A=x;


% --------------------------------------------------------------------
function edit_menu_rotateL90_Callback(hObject, eventdata, handles)
% hObject    handle to edit_menu_rotateL90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x
t=A;
x=imrotate(t,-90);
imshow(x);
A=x;


% --------------------------------------------------------------------
function edit_menu_rotate180_Callback(hObject, eventdata, handles)
% hObject    handle to edit_menu_rotate180 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x
t=A;
x=imrotate(t,180);
imshow(x);
A=x;


% --------------------------------------------------------------------
function edit_menu_crop_Callback(hObject, eventdata, handles)
% hObject    handle to edit_menu_crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x
t=A;
x=imcrop(t);
imshow(x);
A=x;


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global BrushON
global slidr maxX maxY maxZ A
[maxY maxX maxZ] = size(A);
if BrushON==1
set(gcf,'Pointer','arrow')
handles.slider2.Visible = 'off';
handles.slider3.Visible = 'off';
handles.slider6.Visible = 'off';
handles.slider7.Visible = 'off';
handles.text5.Visible = 'off';
handles.text6.Visible = 'off';
handles.text7.Visible = 'off';
handles.text8.Visible = 'off';
handles.uipanel3.Visible = 'off';
BrushON=0;
elseif BrushON==0
handles.slider2.Visible = 'on';
handles.slider3.Visible = 'on';
handles.slider6.Visible = 'on';
handles.slider7.Visible = 'on';
handles.text5.Visible = 'on';
handles.text6.Visible = 'on';
handles.text7.Visible = 'on';
handles.text8.Visible = 'on';
handles.uipanel3.Visible = 'on';
brushicon=imread('Brush.bmp');
brushicon=double(brushicon);
brushicon(brushicon == 0) = NaN;
set(gcf,'Pointer','custom','PointerShapeCData',brushicon,'PointerShapeHotSpot',[1 1]);
BrushON=1;

end

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global slidr
slidr=get(hObject,'Value');
slidr=round(slidr);
switch slidr
        case 2
            brushicon=imread('Brush2.bmp');
        case 3
            brushicon=imread('Brush3.bmp');
        case 4
            brushicon=imread('Brush4.bmp');
        case 5
            brushicon=imread('Brush5.bmp');
        case 6
            brushicon=imread('Brush6.bmp');
        case 7
            brushicon=imread('Brush7.bmp');
        case 8
            brushicon=imread('Brush8.bmp');
        otherwise
            brushicon=imread('Brush.bmp');
            brushicon=double(brushicon);
brushicon(brushicon == 0) = NaN;
set(gcf,'Pointer','custom','PointerShapeCData',brushicon,'PointerShapeHotSpot',[1 1]);
end
    if slidr>=2
brushicon=double(brushicon);
brushicon(brushicon == 0) = NaN;
set(gcf,'Pointer','custom','PointerShapeCData',brushicon,'PointerShapeHotSpot',[8 8]);
    end
slidr = round(slidr);


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function mouseMove (object, eventdata)
global mouseX mouseY A maxX maxY maxZ clickmouse slidr BrushON
global RedValue GreenValue BlueValue
mouseC = get (gca, 'CurrentPoint');
mouseX=mouseC(1,1);
mouseX=round(mouseX);
mouseY=mouseC(1,2);
mouseY=round(mouseY);
if BrushON==1
if clickmouse == 1
if mouseX > slidr
if mouseY > slidr
if mouseX < maxX-slidr
if mouseY < maxY-slidr
mouseI = getimage;
    if BrushON==1
        if slidr<2
            A(mouseY-slidr:mouseY, mouseX-slidr:mouseX, 1) = RedValue;
            A(mouseY-slidr:mouseY, mouseX-slidr:mouseX, 2) = GreenValue;
            A(mouseY-slidr:mouseY, mouseX-slidr:mouseX, 3) = BlueValue;
        else
            A(mouseY-slidr:mouseY+slidr, mouseX-slidr:mouseX+slidr, 1) = RedValue;
            A(mouseY-slidr:mouseY+slidr, mouseX-slidr:mouseX+slidr, 2) = GreenValue;
            A(mouseY-slidr:mouseY+slidr, mouseX-slidr:mouseX+slidr, 3) = BlueValue; 
    end
image(A);
axis image;
    end
end
end
end
end
end
end


function mouseClick(hObject,~)
global mouseX mouseY BrushON A slidr clickmouse
clickmouse=~clickmouse;
if BrushON==1
mouseX=round(mouseX);
mouseY=round(mouseY);
image(A);
axis image;
end
drawnow; % Force it to paint right now


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global RedValue GreenValue BlueValue
RedValue=get(hObject,'Value');
RedValue=round(RedValue);
if RedValue > 1
RedValue=RedValue/255;
end
if GreenValue > 1
GreenValue=GreenValue/255;
end
if BlueValue > 1
BlueValue=BlueValue/255;
end
set ( handles.uipanel3, 'BackgroundColor', [RedValue GreenValue BlueValue] )
set ( handles.uipanel3, 'ForegroundColor', [1-RedValue 1-GreenValue 1-BlueValue] )
RedValue=255*RedValue;
GreenValue=255*GreenValue;
BlueValue=255*BlueValue;

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global RedValue GreenValue BlueValue
GreenValue=get(hObject,'Value');
GreenValue=round(GreenValue);
if RedValue > 1
RedValue=RedValue/255;
end
if GreenValue > 1
GreenValue=GreenValue/255;
end
if BlueValue > 1
BlueValue=BlueValue/255;
end
set ( handles.uipanel3, 'BackgroundColor', [RedValue GreenValue BlueValue] )
set ( handles.uipanel3, 'ForegroundColor', [1-RedValue 1-GreenValue 1-BlueValue] )
RedValue=255*RedValue;
GreenValue=255*GreenValue;
BlueValue=255*BlueValue;



% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'Color',[.9 .9 .9]);
end



% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global RedValue GreenValue BlueValue
BlueValue=get(hObject,'Value');
BlueValue=round(BlueValue);
if RedValue > 1
RedValue=RedValue/255;
end
if GreenValue > 1
GreenValue=GreenValue/255;
end
if BlueValue > 1
BlueValue=BlueValue/255;
end
set ( handles.uipanel3, 'ForegroundColor', [1-RedValue 1-GreenValue 1-BlueValue] )
set ( handles.uipanel3, 'BackgroundColor', [RedValue GreenValue BlueValue] )
RedValue=255*RedValue;
GreenValue=255*GreenValue;
BlueValue=255*BlueValue;




% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A undoall
closereq;
A=undoall;
imshow(A);


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A
closereq;
imshow(A);
