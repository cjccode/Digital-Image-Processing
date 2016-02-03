%%%%%%%%%%%%% bilint.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Scale a 64x64 image to 256x256 image using bilinear interpolation
%
% Input Variables:
%       im64   input 64x64 2D image
%      
% Returned Results:
%       1. upcon  zoomed image
%      
% Processing Flow:
%       1. Create a 256x256 zero matrix
%       2. Assign pixel values from the input image to the zero matrix with each
%       location 4 pixels apart
%       3. Start from the top left, find values for all pixels inside a 5x5
%       block formed by four known pixels at corners
%       4. Repeat until all points in the 256x256 matrix are filled (except
%       for the ones near the edges that are inside a block which is
%       partially out of the matrix
%       5. Return the matrix to main function
%
%  Restrictions/Notes:
%      No border handling method is specified; pixels near edges maybe discarded
%
%  Author:      Yijie Tong
%  Date:        09/09/2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ upcon ] = bilint( im64 )
%first we need to create a 256*256 matrix and filled with im64 values
upcon=zero(256,256); %define a zero valued 256*256 matrix
i=1;%initializing index
j=1;
for x=1:4:256 %the spatial difference between two assigned pixels in terms of row is 4
    for y=1:4:256 %the spatial differen%ce between two assigned pixels in terms of col is 4
        upcon(x,y)=im64(i,j);
        j=j+1;%read pixel values col by col
    end
    i=i+1;%move to the next row of im64
    j=1;%move the index back to the first col
end

for x=1:4:256
    for y=1:4:256
        y1=y;  %locating four known values of each block, the size of one block is 5*5
        y2=y+4;
        x1=x;
        x2=x+4;
        if (y2<256 && x2<256) %ignore the blocks at the edge, since no border handling method is specified
            for a=x1:x2
                for b=y1:y2
                    f1=((y2-b)/(y2-y1))*upcon(x1,y1)+((b-y1)/(y2-y1))*upcon(x1,y2); %use bilinear interpolation to calculate
                    f2=((y2-b)/(y2-y1))*upcon(x2,y1)+((b-y1)/(y2-y1))*upcon(x2,y2); %unknown pixels
                    upcon(a,b)=((x2-a)/(x2-x1))*f1+((a-x1)/(x2-x1))*f2;
                end
            end
        end
    end
end
end

%%%%%%%%%%%%%%%%End for the funciton%%%%%%%%%%%%%%%%%%%%%%%%%