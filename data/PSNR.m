function [ psnr ] = PSNR( a,b )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    a = double(a);
    b = double(b);
    [rows, columns] = size(a);
    
    mseImage = double((a-b).^2);
    
    mse = sum(mseImage(:))/(rows*columns);
    psnr = 10*log10(255^2/mse);
end

