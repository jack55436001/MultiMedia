function [ output ] = encode( input,n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [rows,cols,heights] = size(input);
    r = input(:,:,1);
    g = input(:,:,2);
    b = input(:,:,3);
    
    for i=1:8:rows
        for j=1:8:cols
             r(i:i+7,j:j+7) = dct2d(r(i:i+7,j:j+7));
             g(i:i+7,j:j+7) = dct2d(g(i:i+7,j:j+7));
             b(i:i+7,j:j+7) = dct2d(b(i:i+7,j:j+7));
        end    
    end
    
    mask = zeros(8);
    mask(1:n,1:n) = ones(n);
    
    for i=1:8:rows
        for j=1:8:cols
             r(i:i+7,j:j+7) = r(i:i+7,j:j+7).*mask;
             g(i:i+7,j:j+7) = g(i:i+7,j:j+7).*mask;
             b(i:i+7,j:j+7) = b(i:i+7,j:j+7).*mask;
        end    
    end    
    
    output = cat(3,r,g,b);
end

