%%%%%%%%%%%%%%%%%%%Function convert%%%%%%%%%%%%%%%%%%%%
%This function is used to change original versions which is 256x256 pixels
%to specific versions, like 128x128 pixels.
%
%Input Variables
%         f       The file will be converted
%         pixels  The version need to be converted to, show in pixels
%         time    Times we need to change between original version(256) to final
%         version
%         i       Value of the interger times of rows
%         j       Value of the interger times of columns
%
%Returned Results
%         convert  New images with need pixel size
%
%Processing follow:
%         1. Calculate the times
%         2. Take the values of interger times of columns and rows.
%         3. Use these new values to make a new image.
%
%Author: Jiachen Chen
%Date: 09/09/2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [convert] = convert(f,pixels)
time = 256/pixels;
for x = 1 :time: 256
    for y = 1 :time: 256
        i = (x-1)/time + 1;
        j = (y-1)/time + 1;
        convert(i,j) = f(x,y);           
        end
    end
end

%%%%%%%%%%%%%%%%End for the funciton%%%%%%%%%%%%%%%%%%%%%%%%%