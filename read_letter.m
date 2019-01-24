function [letter vd]=read_letter(imagn)

comp=[];
load templates
for n=1:4 
    sem=corr2(templates{1,n},imagn);
    comp=[comp sem];
end
comp=abs(comp);
vd=find(comp==max(comp));
%*-*-*-*-*-*-*-*-*-*-*-*-*-
if     vd==1
    letter='TRIANGLE';   
elseif vd==2
    letter='STAR';
elseif vd==3
    letter='CIRCLE';
else
    letter='RECTANGLE';
end

