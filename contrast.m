clear all;
clc;
close all;
a=double(rgb2gray(imread('D:\a.jpg')));
[row col]=size(a);
r1=input('Enter r1: '); 
r2=input('Enter r2: ');
s1=input('Enter s1: ');
s2=input('Enter s2: ');
A=s1/r1;
B=(s2-s1)/(r2-r1);
C=(255-s2)/(255-r2);
for x=1:row
   for y=1:col
        if a(x,y)<r1
            b(x,y)=s1;
        elseif  a(x,y)>r1 &&  a(x,y)<r2 
            b(x,y)=B*(a(x,y)-r1)+s1;
        else b(x,y)=C*(a(x,y)-r2)+s2;
        end
    end
end
subplot(1,2,1)
imshow(uint8(a));
title('Original Image')

subplot(1,2,2)
imshow(uint8(b));
title ('Contrast Adjusted Image');










