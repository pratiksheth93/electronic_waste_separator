clear;
clc;
a=double(rgb2gray(imread('d:\d.bmp')));
[x y]=size(a);
r1=input('Enter range1:');
r2=input('Enter range2:');
for i=1:x
    for j=1:y
        if a(i,j)>=r1 && a(i,j)<=r2
            b(i,j)=255;
            c(i,j)=255;
        else
            b(i,j)=a(i,j);
            c(i,j)=0;
        end
    end
end
subplot(3,3,1)
imshow(uint8(a));
title('Original Image')

subplot(3,2,2)
imshow(uint8(b));
title('Gray sliced image with background');
subplot(3,1,3)
imshow(uint8(c));
title('Gray sliced image without background');

