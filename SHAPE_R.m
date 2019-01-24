
function varargout = SHAPE_R(varargin)
%  SHAPE DETECTION WITH MODULE'S
% TO CAPTURE IMAGE USING WEB CAM
% FOR MATLAB 2009
% -----------------------------------------------------------------------
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @SHAPE_R_OpeningFcn, ...
    'gui_OutputFcn',  @SHAPE_R_OutputFcn, ...
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
% -----------------------------------------------------------------------
function SHAPE_R_OpeningFcn(hObject, eventdata, handles, varargin)
movegui(hObject,'center')
handles.output = hObject;

handles.rgb    = [];
handles.noback = [];
guidata(hObject, handles);

if strcmp(get(hObject,'Visible'),'off')
    try
        handles.vidobj = videoinput('winvideo');
        start(handles.vidobj);
        guidata(hObject, handles);
        vidRes = get(handles.vidobj, 'VideoResolution');
        nBands = get(handles.vidobj, 'NumberOfBands');
        hImage = image(zeros(vidRes(2), vidRes(1), nBands), 'Parent',...
            handles.Web_cam);
        preview(handles.vidobj,hImage);
    catch
        msgbox('NO CAMERA CONECTED. LOAD My_Picture.jpg.')
        hImage = image(imread('My_Picture.jpg'), 'Parent', handles.Web_cam);
    end
end
% -----------------------------------------------------------------------
function varargout = SHAPE_R_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;
function captura_Callback(hObject, eventdata, handles)
try
    handles.rgb = getsnapshot(handles.vidobj);
catch
    handles.rgb = imread('MY_Picture.jpg');   
    % is not connected.
end

guidata(hObject, handles);
image(handles.rgb,'Parent',handles.fotografia);
axes(handles.fotografia)
axis off
% -----------------------------------------------------------------------
function pre_proc_Callback(hObject, eventdata, handles)
img = handles.rgb;        
gris= rgb2gray(img);     
umb = graythresh(gris);  
bw  = im2bw(gris,umb);    
bw  = bwmorph(~bw,'open');
bw  = bwmorph(bw,'close');
bw  = imfill(bw,'holes'); 
axes(handles.fotografia)  
imshow(~bw)               
handles.bw=~bw;            
guidata(hObject,handles)  
% -----------------------------------------------------------------------
function find_obj_Callback(hObject, eventdata, handles)
bw      = handles.bw;   
[ec nec]=bwlabel(~bw);  
Y=[];X=[];              
for n=1:nec
    [f1 c1]=find(ec==n);      
    iz = min(c1);der= max(c1);
    sup= min(f1);inf= max(f1);
    pmx=round((der+iz)/2);    
    pmy=round((inf+sup)/2);     
    X=[X pmy];Y=[Y pmx];      
end
axes(handles.fotografia)      
imshow(handles.rgb);            
hold on                         
plot(Y,X,'*r')                  
hold off           
% -----------------------------------------------------------------------
function count_obj_Callback(hObject, eventdata, handles)
bw=~handles.bw;      
[ec nec]=bwlabel(bw);
T=0;S=0;             
C=0;R=0;             
for n=1:nec
    [f1 c1]=find(ec==n); 
    iz = min(c1);der= max(c1);
    sup= min(f1);inf= max(f1);     
    forma=~bw(sup:inf,iz:der);
    forma(:,1)  = 1;          
    forma(:,end)= 1;          
    forma(1,:)  = 1;          
    forma(end,:)= 1;          
    forma=imresize(forma,[42 24]); 
    [letter vd]=read_letter(forma);
    set(handles.shape_t,'String',letter)
    
ser=serial('COM1');
fopen(ser);
%fprintf(ser,'SERPORT Test');
    
    if  vd==1  %'circular';
        T=T+1;
       fprintf(ser,'1#');        
    elseif vd==2%'cirular';
        S=S+1;
        fprintf(ser,'2#');
    elseif vd==3%'CIRCLular';
        C=C+1;
        fprintf(ser,'3#');
    else        %'circular';
        R=R+1;
        fprintf(ser,'4#');
    end
    fclose(ser);
end

   
   
msgbox({['BUZZER: ',num2str(C)],['INTEGRATED CIRCUIT: ',num2str(R)],...
        [': ',num2str(S)],  [': ',num2str(T)]},...
        'MY_RESULTS >> ')

function figure1_WindowButtonDownFcn(hObject, eventdata, handles)

