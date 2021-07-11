close all;
clear all;
clc;
%%
% Kianoush Aqabakee student ID: 9512103311
%%
img=imread('2.png');
img_gray=im2gray(img);
img_gray=img_gray(round(size(img_gray,1)/10):...
    size(img_gray,1)-round(size(img_gray,1)/10),...
    round(size(img_gray,2)/2.7):size(img_gray,2));
% zero
window=15;
img_z=zeros([size(img_gray,1)+...
    mod(window-mod(size(img_gray,1),window),window),...
    size(img_gray,2)+mod(window...
    -mod(size(img_gray,2),window),window)]);
img_z(1:size(img_gray,1),1:size(img_gray,2))=img_gray;
imnew=zeros([size(img_z,1)/window,size(img_z,2)/window]);
for i=1:size(imnew,1)
    for j=1:size(imnew,2)
        imnew(i,j)=sum(sum(img_z(window*(i-1)+1:window*i...
            ,window*(j-1)+1:window*j)))/window^2;
    end
end
imnew=cast(imnew,'uint8');
figure(1)
subplot(1,3,1)
imshow(img_gray')
title('main image')
subplot(1,3,2)
imshow(imnew')
title('Part I')
n=64;
imnew2=cast(img_gray,'double')/n;
imnew2=cast(imnew2,'uint8');
imnew2=imnew2*n;
subplot(1,3,3)
imshow(imnew2')
title('Part II')