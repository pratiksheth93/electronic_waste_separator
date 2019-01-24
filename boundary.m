a=double(rgb2gray(imread('d:\a.jpg')));
s=strel('square',11);
b=imerode(a,s);
img=a-b;
subplot(2,1,1);
imshow(uint8(a));
title('Original');
subplot(2,1,2);
imshow(uint8(img));
title('Boundary Detection');


