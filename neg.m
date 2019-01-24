clear;
clc;
img=double(rgb2gray(imread('d:\a.jpg')));
[x y]=size(img);
d=255;

for i=1:x
    for j=1:y
        if img(i,j)<=d
            newimg(i,j)=d-img(i,j);
        else
            newimg(i,j)=img(i,j);
        end 
    end
end

subplot(2,1,1);
imshow(uint8(img))
title('Original image');

subplot(2,1,2);
imshow(uint8(newimg))
title('negation');
