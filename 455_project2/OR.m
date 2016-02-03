%   OR(A,B) performs a logical OR of arrays A and B and returns an array
%   containing elements set to either logical 1 (TRUE) or logical 0
%   (FALSE).  An element of the output array is set to 1 if either input
%   array contains a non-zero element at that same array location.
%   Otherwise, that element is set to 0.  A and B must have the same 
%   dimensions unless one is a scalar.
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
%	2. If either input array contains a non-zero element at that same 
%	array location, set the corresponding element of the output array to 1
%	3. Otherwise set the corresponding element of the output array to 0
%
%   Author: Jiachen Chen, Yijie Tong, Lyuzhou Zhuang
%   Date: Sept 23, 2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [oops]=OR(a,b)
[M,N] = size(a);
for x = 1:M
    for y = 1:N
        if a(x,y)+b(x,y)>=1%compare every pixel values
            oops(x,y)=1;
        else oops(x,y)=0;
        end
    end
end
