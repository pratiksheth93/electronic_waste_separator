
a=double(rgb2gray(imread('d:\a.jpg')));
se = strel('square',11) ;
e=imdilate(a,se);
f=imerode(e,se);

subplot(2,1,1);
imshow(uint8(a));
title('original');
subplot(2,1,2);
imshow(uint8(f));
title('closing');






