%%%%%%%%%%%%%  Function zero %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Set up an MxN image full of zeros 
%
% Input Variables:
%      M, N    rows (M) and columns (N) in f
%      x       x coordinate of a pixel
%      y       y coordinate of a pixel
%      
% Returned Results:
%      fzero   new image full of all zeros
%
% Processing Flow:  
%      Cycle through MxN array and fill with 0
% 
%
%  The following functions are called:
%      NONE
%
%  Author:      Yijie Tong
%  Date:        09/09/2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [zero] = zero(M,N)
for x = 1 : M        
    for y = 1 : N    
        zero(x,y) = 0;
    end
end