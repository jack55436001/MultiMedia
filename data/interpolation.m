% nearest-neighbor
original = imread('img_LR.png');
test = imread('img_HR.png');
img = im2double(original);
[rows , cols , heights] = size(original);
R_4x = zeros(4*rows,4*cols);
G_4x = zeros(4*rows,4*cols);
B_4x = zeros(4*rows,4*cols);

for i=1:4*rows
    for j=1:4*cols
        ori_i = uint16(round(i/4));
        ori_j = uint16(round(j/4));
        if ori_i==0
            ori_i = 1;
        end
        if ori_j==0
            ori_j = 1;
        end
        R_4x(i,j) = img (ori_i,ori_j,1);
        G_4x(i,j) = img (ori_i,ori_j,2);
        B_4x(i,j) = img (ori_i,ori_j,3);
    end
end

RGB = cat(3,R_4x,G_4x,B_4x);

RGB = im2uint8(RGB);

imwrite(RGB,'a_4X.png');
psnr_nb = PSNR(RGB,test);
fprintf ('nearest-neighbor PSNR :%f\n',psnr_nb);

clear all

% bilinear
original = imread('img_LR.png');
test = imread('img_HR.png');
img = im2double(original);
[rows , cols , heights] = size(original);

RBB_4X = zeros(rows*4,cols*4,heights);

for i=1:4*rows
    x = i/4;
    f_x = floor(x);
    c_x = ceil(x);
    if f_x==0
            f_x = 1;
    end

    x_rat = rem(i/4,1);
    for j=1:4*cols

        y = j/4;
        f_y = floor(y);
        c_y = ceil(y);        
        if f_y ==0
           f_y = 1;
        end
        y_rat = rem(j/4,1);
        imagelt = img(f_x,f_y,:); 
        imagert = img(f_x,c_y,:);
        imagelb = img(c_x,f_y,:);
        imagerb = img(c_x,c_y,:);
        
        tt = (imagelt*(1-y_rat)) + (imagert*y_rat); %exchange ratio
        bb = (imagelb*(1-y_rat)) + (imagerb*y_rat);
        
        RGB_4X(i,j,:) = (tt*(1-x_rat)) + (bb*x_rat);
    end
end


RGB_4X = im2uint8(RGB_4X);

imwrite(RGB_4X,'aa_4X.png');
psnr_bi = PSNR(RGB_4X,test);
fprintf ('bilinear PSNR :%f\n',psnr_bi);

clear all