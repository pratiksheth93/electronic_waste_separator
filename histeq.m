clear all;
clc;
close all;
a=double(rgb2gray(imread('D:\a.jpg')));
 [row col]=size(a);
num=row*col;
h=zeros(4,256);

for i=1:row
    for j=1:col
        h(1,a(i,j)+1) = h(1,a(i,j)+1) + 1;
    end
end

c=0;
for i=1:256
    h(2,i)=h(1,i)/num;
    c=c+h(2,i);
    h(3,i)=c;
    h(4,i)=round(c*255);
end
b=zeros(row,col);

for i=1:row
    for j=1:col
        b(i,j)=h(4,a(i,j)+1);
    end
end

subplot(1,2,1);
imshow(uint8(a));
title('Original Image');

subplot(1,2,2);
imshow(uint8(b));	
title('Histogram Equalized image');
