clc
clear
close all 
band_1 = imread('testb1.bmp');
[m,n] = size(band_1);
image(m,n,12)=0;
image(:,:,1) = band_1;
band_2 = imread('testb2.bmp');image(:,:,2) = band_2;
band_3 = imread('testb3.bmp');image(:,:,3) = band_3;
band_4 = imread('testb4.bmp');image(:,:,4) = band_4;
band_5 = imread('testb5.bmp');image(:,:,5) = band_5;
band_6 = imread('testb6.bmp');image(:,:,6) = band_6;
band_7 = imread('testb7.bmp');image(:,:,7) = band_7;
band_8 = imread('testb8.bmp');image(:,:,8) = band_8;
band_9 = imread('testb9.bmp');image(:,:,9) = band_9;
band_10 = imread('testb10.bmp');image(:,:,10) = band_10;
band_11 = imread('testb11.bmp');image(:,:,11) = band_11;
band_12 = imread('testb12.bmp');image(:,:,12) = band_12;
figure
subplot(3,4,1)
imshow(band_1,[0,255]);
subplot(3,4,2)
imshow(band_2,[0,255]);
subplot(3,4,3)
imshow(band_3,[0,255]);
subplot(3,4,4)
imshow(band_4,[0,255]);
subplot(3,4,5)
imshow(band_5,[0,255]);
subplot(3,4,6)
imshow(band_6,[0,255]);
subplot(3,4,7)
imshow(band_7,[0,255]);
subplot(3,4,8)
imshow(band_8,[0,255]);
subplot(3,4,9)
imshow(band_9,[0,255]);
subplot(3,4,10)
imshow(band_10,[0,255]);
subplot(3,4,11)
imshow(band_11,[0,255]);
subplot(3,4,12)
imshow(band_12,[0,255]);
X = reshape(image,[m*n,12]);
cov_12 = cov(X);
[V, D] = eig(cov_12);
[sorted,idx] = sort(sum(D),'descend');
V_sorted = V(:,idx);
PCS = X*V_sorted;
image_PC = im2uint8(mat2gray(reshape(PCS,[m,n,12])));
figure
subplot(3,4,1)
imshow(image_PC(:,:,1),[0,255]);
subplot(3,4,2)
imshow(image_PC(:,:,2),[0,255]);
subplot(3,4,3)
imshow(image_PC(:,:,3),[0,255]);
subplot(3,4,4)
imshow(image_PC(:,:,4),[0,255]);
subplot(3,4,5)
imshow(image_PC(:,:,5),[0,255]);
subplot(3,4,6)
imshow(image_PC(:,:,6),[0,255]);
subplot(3,4,7)
imshow(image_PC(:,:,7),[0,255]);
subplot(3,4,8)
imshow(image_PC(:,:,8),[0,255]);
subplot(3,4,9)
imshow(image_PC(:,:,9),[0,255]);
subplot(3,4,10)
imshow(image_PC(:,:,10),[0,255]);
subplot(3,4,11)
imshow(image_PC(:,:,11),[0,255]);
subplot(3,4,12)
imshow(image_PC(:,:,12),[0,255]);


figure
title("bands histogram")
subplot(3,4,1)
imhist(band_1);
subplot(3,4,2)
imhist(band_2);
subplot(3,4,3)
imhist(band_3);
subplot(3,4,4)
imhist(band_4);
subplot(3,4,5)
imhist(band_5);
subplot(3,4,6)
imhist(band_6);
subplot(3,4,7)
imhist(band_7);
subplot(3,4,8)
imhist(band_8);
subplot(3,4,9)
imhist(band_9);
subplot(3,4,10)
imhist(band_10);
subplot(3,4,11)
imhist(band_11);
subplot(3,4,12)
imhist(band_12);


figure
subplot(3,4,1)
imhist(image_PC(:,:,1));
subplot(3,4,2)
imhist(image_PC(:,:,2));
subplot(3,4,3)
imhist(image_PC(:,:,3));
subplot(3,4,4)
imhist(image_PC(:,:,4));
subplot(3,4,5)
imhist(image_PC(:,:,5));
subplot(3,4,6)
imhist(image_PC(:,:,6));
subplot(3,4,7)
imhist(image_PC(:,:,7));
subplot(3,4,8)
imhist(image_PC(:,:,8));
subplot(3,4,9)
imhist(image_PC(:,:,9));
subplot(3,4,10)
imhist(image_PC(:,:,10));
subplot(3,4,11)
imhist(image_PC(:,:,11));
subplot(3,4,12)
imhist(image_PC(:,:,12));


rgb_PCS = cat(3,image_PC(:,:,3),image_PC(:,:,2),image_PC(:,:,1));
figure
imshow(rgb_PCS)
figure
histogram2(image_PC(:,:,1),image_PC(:,:,2));
figure
histogram2(image_PC(:,:,1),image_PC(:,:,3));
figure
histogram2(image_PC(:,:,2),image_PC(:,:,3));
figure
subplot(1,3,1)
h = bar3(rgb_PCS(:,:,1)); set(h, 'EdgeColor', 'none'); title('red')
subplot(1,3,2)
h = bar3(rgb_PCS(:,:,2)); set(h, 'EdgeColor', 'none'); title('blue')
subplot(1,3,3)
h = bar3(rgb_PCS(:,:,3)); set(h, 'EdgeColor', 'none'); title('green')


