
clear;
clc;
img=double(rgb2gray(imread('D:\a.jpg')));
[x y]=size(img);
d=input('Enter threshold point');
for i=1:x
for j=1:y
if img(i,j)<=d
newimg(i,j)=0;
else
newimg(i,j)=255;
end 
end
end

subplot(2,1,1);
imshow(uint8(img))
title('Original image');

subplot(2,1,2);
imshow(uint8(newimg))
title('Threshold image');
o