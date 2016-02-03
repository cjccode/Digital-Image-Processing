%%%%%%%%%%%%%%%%%%%Function save256%%%%%%%%%%%%%%%%%%%%
%This function is used to save smaller pixel version to 256x256 pixel
%versions
%
%Input Variables
%         f       The file will be changed
%         pixels  The pixel of the version who is needed  to be changed
%         time    Times we need to change between final version(256) to
%         original version
%         i       Value of the interger times of rows
%         j       Value of the interger times of columns
%
%Returned Results
%         Save original images to 256x256 version
%
%Processing follow:
%         1. Calculate the times
%         2. exterd each value to a sqaure which size is the time and each
%         value in the square equals to origin one. 
%         3. Use these new values to make a new image.
%
%Author: Jiachen Chen
%Date: 09/09/2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[save] = save256(f,pixels)  
time = 256/pixels;
for x = 1 : pixels 
    for y = 1 : pixels
%Follwing we make the value extend to a square in right and down direction 
%and its size is the amount of time. 
        i = (x-1)*time+1;
        j = (y-1)*time+1;
        for m = i:(i+time-1)
            for n = j:(j+time-1)
                save(m,n) = f(x,y);
            end
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%End of the funciton.