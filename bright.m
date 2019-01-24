clear all;
clc;
close all;
a=imread('D:\a.jpg');
a=double(rgb2gray(a));
[row col]=size(a);
bt=input('Enter level of brightness to increase: - ');

for x=1:row
   for y=1:col
       b(x,y)=a(x,y)+bt;
    end
end
subplot(2,1,1)
imshow(uint8(a));
title('Original Image')

subplot(2,1,2)
imshow(uint8(b));
title ('Brightness Adjusted image');

