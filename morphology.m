a=double(rgb2gray(imread('d:\a.jpg')));
se=strel('disk',2);
c=imdilate(a,se);
b=imerode(a,se);
m=c-b;
subplot(2,2,1);
imshow(uint8(a));
title('original');
subplot(2,2,2);
imshow(uint8(m));
title('morphological gradient');
subplot(2,2,3);
imshow(uint8(c));
title('Dialation');
subplot(2,2,4);
imshow(uint8(b));
title('Erosion');






