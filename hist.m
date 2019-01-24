clear all;
clc;
a=double(rgb2gray(imread('d:\a.jpg')));
[row col]=size(a);
h=zeros(1,255);
for i=1:1:row
    for j=1:1:col
        if a(i,j)<1
            continue;
        else
            t=a(i,j);
            h(t)=h(t)+1;
        end
    end
end

subplot(2,1,1);
imshow(uint8(a))
title('Original image');

subplot(2,1,2);
bar(h)
title('Histogram');

