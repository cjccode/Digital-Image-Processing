%   NOT(a) performs a logical NOT of input array a, and returns an array
%   containing elements set to either logical 1 (TRUE) or logical 0 (FALSE).
%   An element of the output array is set to 1 if a contains a zero value
%   element at that same array location. Otherwise, that element is set to
%   0.
%
%   Variables 
%	a	input image
%	M, N	number of rows and columns of the input images
%	x       	x coordinate of a pixel
%	y     	y coordinate of a pixel
%
%   Returned Results
%	oops	output image
%
%   Processing follow:
%	1. Scan every pixel of the input images
%	2. Apply ~a(x,y)
%
%   Author: Jiachen Chen, Yijie Tong, Lyuzhou Zhuang
%   Date: Sept 23, 2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [oops]=NOT(a)
[M,N] = size(a);
for x = 1:M
    for y = 1:N
        if a(x,y)==1%compare every pixel values
            a(x,y)=0;
        else
            a(x,y)=1;
        end
    end
end
oops=a;