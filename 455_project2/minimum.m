%   minimum(a,b) is to compare the value of 2 corresponding pixels
%   of input images a and b, and set the corresponding pixel of the output image
%   to the smaller one of these two.
%
%   Variables 
%	a	input image
%	b	input image
%	M, N	number of rows and columns of the input images
%	x       	x coordinate of a pixel
%	y     	y coordinate of a pixel
%
%   Returned Results
%	oops	output image
%
%   Processing follow:
%	1. Scan every pixel of the input images
%	2. If the value of the pixel in image a is smaller than the corresponding %	pixel value in image b, set the value of the corresponding pixel of 
%	the output image to that of image a.
%	3. Otherwise set the value of the corresponding pixel of the output
%	image to that of image b.
%
%   Author: Jiachen Chen, Yijie Tong, Lyuzhou Zhuang
%   Date: Sept 23, 2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [oops]=minimum(a,b)
[M,N] = size(a);
for x = 1:M
    for y = 1:N
        if a(x,y)<=b(x,y) %compare every pixel values
            oops(x,y)=a(x,y);
        else oops(x,y)=b(x,y);
        end
    end
end
