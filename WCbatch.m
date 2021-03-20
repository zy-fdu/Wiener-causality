function varargout = WCbatch(varargin)
% WCBATCH MATLAB code for WCbatch.fig
%      WCBATCH, by itself, creates a new WCBATCH or raises the existing
%      singleton*.
%
%      H = WCBATCH returns the handle to a new WCBATCH or the handle to
%      the existing singleton*.
%
%      WCBATCH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WCBATCH.M with the given input arguments.
%
%      WCBATCH('Property','Value',...) creates a new WCBATCH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WCbatch_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WCbatch_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WCbatch

% Last Modified by GUIDE v2.5 20-Mar-2021 23:26:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WCbatch_OpeningFcn, ...
                   'gui_OutputFcn',  @WCbatch_OutputFcn, ...
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


% --- Executes just before WCbatch is made visible.
function WCbatch_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WCbatch (see VARARGIN)

% Choose default command line output for WCbatch
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global TCmat

% UIWAIT makes WCbatch wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WCbatch_OutputFcn(hObject, eventdata, handles) 
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
global TCmat
[filename_TCmat,filepath_TCmat] = uigetfile('*.*');
TCmat = load([filepath_TCmat,filename_TCmat]);
set(handles.edit3,'string',['Click "Calculate Wiener Causality" to continue'],'ForegroundColor','black')

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global TCmat
global p
global d_KL
global f_JR
global f_AR
global ks_estimation_range
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
[d_KL,p,f_AR,f_JR,ks_estimation_range] = Wienermain_batch(TCmat);
p_set = p;
p_set(p>0.05) = 1;
p_set(p<0.05) = 0;
p_set = 1-p_set;
axes(handles.axes1)
imagesc(p_set)
grid on
colormap([1 1 1;1 0 0])
set(gca,'xtick',[1,2,3],'ytick',[1,2,3])
set(handles.edit3,'string',['Click "Statistics" to check the detail statistics'],'ForegroundColor','black')




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


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TCmat
global p
global d_KL
global f_JR
global f_AR
global ks_estimation_range
[y,x] = ginput(1);
x = round(x);y = round(y);
set(handles.edit1,'string',d_KL(x,y))
set(handles.edit2,'string',p(x,y))

axes(handles.axes2)
plot(ks_estimation_range{x,y},f_AR{x,y},'red')
hold on
plot(ks_estimation_range{x,y},f_JR{x,y},'blue')
legend({'AR model','JR model'},'FontSize',8,'Location','best')
legend('boxoff')
hold off

if p(y,x)<0.05
    set(handles.edit3,'string',['Time series ' num2str(x) ' is causally correlated to time series ' num2str(y)],'ForegroundColor','green')
else
    set(handles.edit3,'string',['Time series ' num2str(x) ' is not causally correlated to time series ' num2str(y)],'ForegroundColor','red')
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
