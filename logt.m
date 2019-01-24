clear;
clc;
img=double(rgb2gray(imread('d:\a.jpg')));
[x y]=size(img);
L=255;
c=L/log10(1+L);
for i=1:x
for j=1:y
newimg(i,j)=c*(log10(1+img(i,j)));
end 
end
subplot(2,1,1);
imshow(uint8(img))
title('Original image');
subplot(2,1,2);
imshow(uint8(newimg))
title('Log transformation');


