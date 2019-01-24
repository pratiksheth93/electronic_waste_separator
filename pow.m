clear;
clc;
img=double(rgb2gray(imread('d:\a.jpg')));
[x y]=size(img);
for i=1:x
for j=1:y
gamma=1.1;
d=img(i,j)^gamma;
end
end

subplot(5,1,1);
imshow(uint8(img))
title('Original image');

subplot(5,1,2);
imshow(uint8(d))
title('Power Law with gamma=1.1');
for i=1:x
for j=1:y
gamma=0.9;
d1=img(i,j)^gamma;
end
end
subplot(5,1,3);
imshow(uint8(d1))
title('Power Law with gamma=0.9');

for i=1:x
for j=1:y
gamma=2;
d1=img(i,j)^gamma;
end
end
subplot(5,1,4);
imshow(uint8(d1))
title('Power Law with gamma=2');

for i=1:x
for j=1:y
gamma=0.5;
d1=img(i,j)^gamma;
end
end
subplot(5,1,4);
imshow(uint8(d1))
title('Power Law with gamma=0.5');


