TRI=imread('shapes\TRI.bmp');STA=imread('shapes\STA.bmp');
CIR=imread('shapes\CIR.bmp');REC=imread('shapes\REC.bmp');
TRI=clip(TRI);CIR=clip(CIR);STA=clip(STA);
TRI=imresize(TRI,[42 24]);CIR=imresize(CIR,[42 24]);
STA=imresize(STA,[42 24]);
%*-*-*-*-*-*-*-*-*-*-*-
letter=[TRI STA CIR REC];
character=letter;
templates=mat2cell(character,42,[24 24 24 24]);
save ('templates','templates')