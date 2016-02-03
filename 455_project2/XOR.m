%   XOR(a,b) is the logical symmetric difference of elements a and b.
%   The result is logical 1 (TRUE) where either a or b, but not both, is 
%   nonzero. The result is logical 0 (FALSE) where a and b are both zero 
%   or nonzero. a and b must have the same dimensions (or one can be a 
%   scalar).
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
%	2. If either, but not both, input array contains a non-zero element
%	   at the same array location, set the corresponding element of the 
%	   output array to 1
%	3. Otherwise set the corresponding element of the output array to 0
%
%   Author: Jiachen Chen, Yijie Tong, Lyuzhou Zhuang
%   Date: Sept 23, 2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [oops]=XOR(a,b)
[M,N] = size(a);
for x = 1:M
    for y = 1:N
        if a(x,y)~=b(x,y)%compare every pixel values
            oops(x,y)=1;
        else oops(x,y)=0;
        end
    end
end
