function [ output ] = dct2d( input )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
trans = zeros(8);
    for i = 0:7
       for j = 0:7
          if i==0
              a = sqrt(1/8);
          else
              a = sqrt(2/8);
          end
          trans(i+1,j+1) = a*cos((j+0.5)*pi*i/8);
       end    
    end
output = trans*input*trans';

end

