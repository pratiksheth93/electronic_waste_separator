clc;
clear all;
img1=rgb2gray(imread('D:\d.jpg'));
img=double(img1);
[row, col]=size(img);
n=input('Enter odd size of n for mask nXn : ');
r=input('Enter size of omega: ');
%mask generation
cn=floor(n/2);
S=0;
r2=2*(r*r);
t=1;
for x=-cn:1:cn 
for y=-cn:1:cn
a=((x*x)+(y*y))/r2;
q=-a;
w(t)=exp(q);
S=S+w(t);
t=t+1;
end
end

tmp=1;
for i=1:1:n
    for j=1:1:n
mask(i,j)=w(tmp)/S;
tmp=tmp+1;
end
end

%mask rotation by 180 degree

m=n*n;
for i=1:m
    rmask(i)=mask(m);
    m=m-1;
end

%applying mask

x=floor(n/2);  
for i=x+1:row-x
     for j=x+1:col-x
      sum=0; 
      k=1;
      for l=i-x:i+x
      for m=j-x:j+x    
          sum=sum+(rmask(k)*img(l,m));
          k=k+1;
      end
      end
      b(i,j)=[sum];
  end
end
subplot(2,1,1);
imshow(uint8(img));
title('ORIGINAL IMAGE');
subplot(2,1,2);
imshow(uint8(b));
title('FILTERED IMAGE');






