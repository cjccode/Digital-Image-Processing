%%%%%%%%%%%%%%%%%%%Function convert%%%%%%%%%%%%%%%%%%%%
%This function is used to change the gray-level quantization 
%by reducing the number of bits per pixel to any bits/pixel.
%Input Variables
%         f         The file will be converted
%         greylevel The number of grey levels needed to be converted to
%         factor    The range of grey levels in the original photo that
%                   will be converted into one grey level in the new photo. 
%         x         Value of the number of rows
%         y         Value of the number of columns
%         i         Value of the number of the new grey levels
%
%Returned Results
%         convert   New images with desired grey levels
%
%Processing follow:
%         1. Count the number of rows and columns of the picture.
%         2. Scan and assign new grey values to every pixel to make a new image.
%
%Author: Lyuzhou Zhuang
%Date: 09/09/2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [grey] = greyconvert(f,greylevel)
factor = 256/greylevel;
[M,N] = size(f);
for x = 1 : M
    for y = 1 : N
        for i = 1:greylevel
            if (f(x,y)>=(i-1)*factor)&&(f(x,y)<i*factor) 
                grey(x,y)=((i*factor)+((i-1)*factor))/2;
            end
        end
    end
end