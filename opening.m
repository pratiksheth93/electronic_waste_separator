a=double(rgb2gray(imread('d:\a.jpg')));
se = strel('square',11) ;
b=imerode(a,se);
c=imdilate(b,se);
subplot(2,1,1);
imshow(uint8(a));
title('original');
subplot(2,1,2);
imshow(uint8(c));
title('opening');
