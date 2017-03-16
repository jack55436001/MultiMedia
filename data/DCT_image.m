% n = 2 RGB
original = imread('lalaland.png');
i = im2double(original);
i = encode(i,2);
i = decode(i);
i = im2uint8(i);
imwrite(i,'a2.png');
psnr_1 = PSNR(original,i);
fprintf('RGB n=2 PSNR = %f\n',psnr_1);

clear all

% n = 4 RGB
original = imread('lalaland.png');
i = im2double(original);
i = encode(i,4);
i = decode(i);
i = im2uint8(i);
imwrite(i,'a4.png');
psnr_1 = PSNR(original,i);
fprintf('RGB n=4 PSNR = %f\n',psnr_1);

clear all

% n = 8 RGB
original = imread('lalaland.png');
i = im2double(original);
i = encode(i,8);
i = decode(i);
i = im2uint8(i);
imwrite(i,'a8.png');
psnr_1 = PSNR(original,i);
fprintf('RGB n=8 PSNR = %f\n',psnr_1);

clear all

% n = 2 YIQ
original = imread('lalaland.png');
ORI = original;
ORI = im2double(ORI);
YIQ = double(zeros(size(original)));

for i=1:size(original,1)
    for j=1:size(original,2)
        YIQ(i,j,1)=0.299*ORI(i,j,1)+0.587*ORI(i,j,2)+0.114*ORI(i,j,3);
        YIQ(i,j,2)=0.596*ORI(i,j,1)-0.274*ORI(i,j,2)-0.322*ORI(i,j,3);
        YIQ(i,j,3)=0.211*ORI(i,j,1)-0.523*ORI(i,j,2)+0.312*ORI(i,j,3);
    end
end

YIQ = encode(YIQ,2);
YIQ = decode(YIQ);
RGB = YIQ;
for i=1:size(original,1)
    for j=1:size(original,2)
        RGB(i,j,1)=1.0*YIQ(i,j,1)+0.956*YIQ(i,j,2)+0.621*YIQ(i,j,3);
        RGB(i,j,2)=1.0*YIQ(i,j,1)-0.272*YIQ(i,j,2)-0.647*YIQ(i,j,3);
        RGB(i,j,3)=1.0*YIQ(i,j,1)-1.106*YIQ(i,j,2)+1.703*YIQ(i,j,3);
    end
end

RGB = im2uint8(RGB);
imwrite(RGB,'b2.png');
psnr_1 = PSNR(original,RGB);
fprintf('YIQ n=2 PSNR = %f\n',psnr_1);
clear all

% n = 4 YIQ
original = imread('lalaland.png');
ORI = original;
ORI = im2double(ORI);
YIQ = double(zeros(size(original)));

for i=1:size(original,1)
    for j=1:size(original,2)
        YIQ(i,j,1)=0.299*ORI(i,j,1)+0.587*ORI(i,j,2)+0.114*ORI(i,j,3);
        YIQ(i,j,2)=0.596*ORI(i,j,1)-0.274*ORI(i,j,2)-0.322*ORI(i,j,3);
        YIQ(i,j,3)=0.211*ORI(i,j,1)-0.523*ORI(i,j,2)+0.312*ORI(i,j,3);
    end
end

YIQ = encode(YIQ,4);
YIQ = decode(YIQ);
RGB = YIQ;
for i=1:size(original,1)
    for j=1:size(original,2)
        RGB(i,j,1)=1.0*YIQ(i,j,1)+0.956*YIQ(i,j,2)+0.621*YIQ(i,j,3);
        RGB(i,j,2)=1.0*YIQ(i,j,1)-0.272*YIQ(i,j,2)-0.647*YIQ(i,j,3);
        RGB(i,j,3)=1.0*YIQ(i,j,1)-1.106*YIQ(i,j,2)+1.703*YIQ(i,j,3);
    end
end

RGB = im2uint8(RGB);
imwrite(RGB,'b4.png');
psnr_1 = PSNR(original,RGB);
fprintf('YIQ n=4 PSNR = %f\n',psnr_1);
clear all

% n = 8 YIQ
original = imread('lalaland.png');
ORI = original;
ORI = im2double(ORI);
YIQ = double(zeros(size(original)));

for i=1:size(original,1)
    for j=1:size(original,2)
        YIQ(i,j,1)=0.299*ORI(i,j,1)+0.587*ORI(i,j,2)+0.114*ORI(i,j,3);
        YIQ(i,j,2)=0.596*ORI(i,j,1)-0.274*ORI(i,j,2)-0.322*ORI(i,j,3);
        YIQ(i,j,3)=0.211*ORI(i,j,1)-0.523*ORI(i,j,2)+0.312*ORI(i,j,3);
    end
end

YIQ = encode(YIQ,8);
YIQ = decode(YIQ);
RGB = YIQ;
for i=1:size(original,1)
    for j=1:size(original,2)
        RGB(i,j,1)=1.0*YIQ(i,j,1)+0.956*YIQ(i,j,2)+0.621*YIQ(i,j,3);
        RGB(i,j,2)=1.0*YIQ(i,j,1)-0.272*YIQ(i,j,2)-0.647*YIQ(i,j,3);
        RGB(i,j,3)=1.0*YIQ(i,j,1)-1.106*YIQ(i,j,2)+1.703*YIQ(i,j,3);
    end
end

RGB = im2uint8(RGB);
imwrite(RGB,'b8.png');
psnr_1 = PSNR(original,RGB);
fprintf('YIQ n=8 PSNR = %f\n',psnr_1);
clear all