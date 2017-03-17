% gaussian 3X3 sigma 0.3
original = imread('thinker_gray_noised.jpg');
img = im2double(original);
[rows , cols] = size(img);
gamask = fspecial('gaussian',3,0.3);
fimg = zeros(rows+2,cols+2);
fimg(2:rows+1,2:cols+1)=img(:,:);
fimgre = zeros(rows,cols);

for i=1:rows
   for j=1:cols
       pixel = fimg(i:i+2,j:j+2).*gamask;
       value = sum(pixel(:));
       fimgre(i,j) = value;
   end
end

imwrite(fimgre,'ta_gaus3X3.jpg');

clear all

% gaussian 9X9 sigma 1
original = imread('thinker_gray_noised.jpg');
img = im2double(original);
[rows , cols] = size(img);
gamask = fspecial('gaussian',9,1);
fimg = zeros(rows+8,cols+8);
fimg(5:rows+4,5:cols+4)=img(:,:);
fimgre = zeros(rows,cols);

for i=1:rows
   for j=1:cols
       pixel = fimg(i:i+8,j:j+8).*gamask;
       value = sum(pixel(:));
       fimgre(i,j) = value;
   end
end

imwrite(fimgre,'ta_gaus9X9.jpg');
clear all

% median 3X3
original = imread('thinker_gray_noised.jpg');
img = im2double(original);
[rows , cols] = size(img);
fimg = zeros(rows+2,cols+2);
fimg(2:rows+1,2:cols+1)=img(:,:);
fimgre = zeros(rows,cols);

for i=1:rows
   for j=1:cols
       pixel = fimg(i:i+2,j:j+2);
       value = sort(pixel(:));
       fimgre(i,j) = value(5);
   end
end

imwrite(fimgre,'ta_med3X3.jpg');
clear all

% median 9X9
original = imread('thinker_gray_noised.jpg');
img = im2double(original);
[rows , cols] = size(img);
fimg = zeros(rows+8,cols+8);
fimg(5:rows+4,5:cols+4)=img(:,:);
fimgre = zeros(rows,cols);

for i=1:rows
   for j=1:cols
       pixel = fimg(i:i+8,j:j+8);
       value = sort(pixel(:));
       fimgre(i,j) = value(41);
   end
end

imwrite(fimgre,'ta_med9X9.jpg');