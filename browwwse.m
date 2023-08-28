function varargout = browwwse(varargin)
% BROWWWSE MATLAB code for browwwse.fig
%      BROWWWSE, by itself, creates a new BROWWWSE or raises the existing
%      singleton*.
%
%      H = BROWWWSE returns the handle to a new BROWWWSE or the handle to
%      the existing singleton*.
%
%      BROWWWSE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BROWWWSE.M with the given input arguments.
%
%      BROWWWSE('Property','Value',...) creates a new BROWWWSE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before browwwse_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to browwwse_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help browwwse

% Last Modified by GUIDE v2.5 28-Dec-2022 13:39:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @browwwse_OpeningFcn, ...
                   'gui_OutputFcn',  @browwwse_OutputFcn, ...
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


% --- Executes just before browwwse is made visible.
function browwwse_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to browwwse (see VARARGIN)

% Choose default command line output for browwwse
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes browwwse wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = browwwse_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename,pathname]=uigetfile('*,*','File selector');
name=strcat(pathname,filename);
set(handles.edit1,'string',name);
x=imread(name);
axes(handles.axes1)
imshow(x);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
import java.awt.Robot
import java.awt.event.*
img=get(handles.edit1,'string');
x=imread(img);
robot=Robot();
robot.delay(500);
bl=[1104 66];
rd=[968 65];
blk=[886 70];
yelw=[1023 68];
gr=[1049 68];
x=imresize(x,0.5);
red=x;
blue=x;
yellow=x;
black=x;
green=x;
%red filtering
for a=1:size(x,1)
     for b=1:size(x,2)
            if ( x(a,b,1)<193 || x(a,b,2)>51 || x(a,b,3)> 46)
             gris = 255,299*x(a,b,1) +255,587 * x(a,b,2) +255,114*x(a,b,3);
          red(a,b,:)=[gris,gris,gris];
            end
     end
end  

   %yellow filtering
 for a=1:size(x,1)
      for b=1:size(x,2)
         if ( x(a,b,1)<160|| x(a,b,2)<110 || x(a,b,3)>90 )
            gris = 255,299*x(a,b,1) +255,587 * x(a,b,2) +255,114*x(a,b,3);
             yellow(a,b,:)=[gris,gris,gris];
         end
      end
 end

% black filtering
 for a=1:size(x,1)
      for b=1:size(x,2)
         if ( x(a,b,1)>0 || x(a,b,2)>0 || x(a,b,3)>0 )
            gris = 255,299*x(a,b,1) +255,587 * x(a,b,2) +255,114*x(a,b,3);
            black(a,b,:)=[gris,gris,gris];
         end
      end
 end
 %green filtering
 for a=1:size(x,1)
     for b=1:size(x,2)
            if ( x(a,b,1)>110 || x(a,b,2)<110|| x(a,b,3)>90)
             gris = 255,299*x(a,b,1) +255,587*x(a,b,2) +0,114*x(a,b,3);
          green(a,b,:)=[gris,gris,gris];
            end
     end
 end  

%blue filtering
 for a=1:size(x,1)
     for b=1:size(x,2)
if ( x(a,b,1)>90 || x(a,b,2)<30 || x(a,b,3)>200 )
             gris = 255,299*x(a,b,1) +255,587 * x(a,b,2) +255,114*x(a,b,3);
             blue(a,b,:)=[gris,gris,gris];
         end
      end
 end
%switching to binary
img1= im2bw (rgb2gray(red),0.5);
img2= im2bw (rgb2gray(yellow),0.7);
img3= im2bw (rgb2gray(black),0.5);
img4= im2bw(rgb2gray(green),0.5);
img5= im2bw(rgb2gray(blue),0.5);
%switch tabs
robot.keyPress(KeyEvent.VK_ALT);
robot.keyPress(KeyEvent.VK_TAB);
robot.keyRelease(KeyEvent.VK_ALT);
robot.keyRelease(KeyEvent.VK_TAB);
 pen=[281 87]
robot.mouseMove(pen(1),pen(2));
robot.mouseMove(pen(1),pen(2));
robot.mouseMove(pen(1),pen(2));

robot.delay(100);
robot.mousePress(InputEvent.BUTTON1_MASK);
robot.delay(100);
robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.delay(200);

robot.mouseMove(rd(1),rd(2));
robot.mouseMove(rd(1),rd(2));
robot.mouseMove(rd(1),rd(2));
robot.delay(100);
robot.mousePress(InputEvent.BUTTON1_MASK);
robot.delay(100);
robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.delay(200);

start=[406 220];
%paint red
robot.mouseMove(start(1),start(2));
robot.mouseMove(start(1),start(2));
robot.mouseMove(start(1),start(2));
for i=1:size(img1,1)
    robot.mouseMove(start(1),start(2)+i);
for j=1:size(img1,2)
        robot.mouseMove(start(1)+j,start(2)+i);
if (img1(i,j)==0)
    robot.mousePress(InputEvent.BUTTON1_MASK);
    robot.delay(1);
else
      robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.delay(1);
end
end
   robot.mouseRelease(InputEvent.BUTTON1_MASK);

end
 %paint yellow
robot.mouseMove(yelw(1),yelw(2));
robot.mouseMove(yelw(1),yelw(2));
robot.mouseMove(yelw(1),yelw(2));
robot.delay(100);
robot.mousePress(InputEvent.BUTTON1_MASK);
robot.delay(100);
robot.mouseRelease(InputEvent.BUTTON1_MASK);

robot.delay(200);



robot.mouseMove(start(1),start(2));

for i=1:size(img2,1)
    robot.mouseMove(start(1),start(2)+i);
for j=1:size(img2,2)
        robot.mouseMove(start(1)+j,start(2)+i);
if (img2(i,j)==0)
    robot.mousePress(InputEvent.BUTTON1_MASK);
    robot.delay(1);
else
      robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.delay(1);
end
end
   robot.mouseRelease(InputEvent.BUTTON1_MASK);

end
%paint black
    robot.mouseMove(blk(1),blk(2));
robot.mouseMove(blk(1),blk(2));
robot.mouseMove(blk(1),blk(2));
robot.delay(100);
robot.mousePress(InputEvent.BUTTON1_MASK);
robot.delay(500);
robot.mouseRelease(InputEvent.BUTTON1_MASK);

robot.delay(200);


robot.mouseMove(start(1),start(2));

for i=1:size(img3,1)
    robot.mouseMove(start(1),start(2)+i);
for j=1:size(img3,2)
        robot.mouseMove(start(1)+j,start(2)+i);
if (img3(i,j)==0)
    robot.mousePress(InputEvent.BUTTON1_MASK);
    robot.delay(1);
else
      robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.delay(1);
end
end
   robot.mouseRelease(InputEvent.BUTTON1_MASK);

end

%paint green

  robot.mouseMove(gr(1),gr(2));
  robot.mouseMove(gr(1),gr(2));
  robot.mouseMove(gr(1),gr(2));
  robot.delay(100);
  robot.mousePress(InputEvent.BUTTON1_MASK);
robot.delay(500);
robot.mouseRelease(InputEvent.BUTTON1_MASK);

robot.delay(200);



robot.mouseMove(start(1),start(2));

for i=1:size(img4,1)
    robot.mouseMove(start(1),start(2)+i);
for j=1:size(img4,2)
        robot.mouseMove(start(1)+j,start(2)+i);
if (img4(i,j)==0)
    robot.mousePress(InputEvent.BUTTON1_MASK);
    robot.delay(1);
else
      robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.delay(1);
end
end
   robot.mouseRelease(InputEvent.BUTTON1_MASK);

end

% paint blue
robot.mouseMove(bl(1),bl(2));
robot.mouseMove(bl(1),bl(2));
robot.mouseMove(bl(1),bl(2));
robot.delay(200);
robot.mousePress(InputEvent.BUTTON1_MASK);
robot.delay(200);
robot.mouseRelease(InputEvent.BUTTON1_MASK);

robot.delay(200);


robot.mouseMove(start(1),start(2));

for i=1:size(img5,1)
    robot.mouseMove(start(1),start(2)+i);
for j=1:size(img5,2)
        robot.mouseMove(start(1)+j,start(2)+i);
if (img5(i,j)==0)
    robot.mousePress(InputEvent.BUTTON1_MASK);
    robot.delay(1);
else
      robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.delay(1);
end
end
   robot.mouseRelease(InputEvent.BUTTON1_MASK);

end

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
