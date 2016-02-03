%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      1.Write a program to change the spatial resolution to 128x128,64x64
%      and 32x32 images, and then save these three images as 256x256
%      images.
%      2.Using bilinear interpolation to create a 256x256 image from 64x64
%      image.
%      3.Change grey-level quantization.
%
% Input Variables:
%      f   input 2D image
%      
% Returned Results:
%      f_128 is the original picture change to 128x128 pixels image.
%      f_128_256 is the 128x128 pixels image save as 256x256 image. 
%      f_64 is the original picture change to 64x64 pixels image.
%      f_64_256 is the 128x128 pixels image save as 256x256 image. 
%      f_32 is the original picture change to 128x128 pixels image.
%      f_32_256 is the 128x128 pixels image save as 256x256 image.
%      fb_64_256 is a 256x256 image created from 64x64 image through
%           bilinear interpolation
%      grey2 is an image with 2 grey levels
%      grey4 is an image with 4 grey levels
%      grey16 is an image with 16 grey levels
%      grey64 is an image with 64 grey levels
%      grey256 is an image with 256 grey levels
%      
% Processing Flow:
%      Problem#1:                                                            
%       1.Load and display input image
%       2.Convert the original image to specific image through convert
%         function. and then save this image.
%       3.Save the specific as 256x256 pixels image through function save256.
%      Problem#2:
%       1. Pass the 64x64 image needs to be zoomed to function bilint
%       2. Read and assign the new 256x256 retured from bilint function to
%          f_64_256
%       3. Save the transformed image to fb_64_256.gif
%      Problem#3:
%       1.Change the gray-level quantization by reducing the number of bits per 
%         pixel to 8 bits/pixel and save the image. 
%       2.Change the gray-level quantization by reducing the number of bits per 
%         pixel to 6 bits/pixel and save the image. 
%       3.Change the gray-level quantization by reducing the number of bits per 
%         pixel to 4 bits/pixel and save the image. 
%       4.Change the gray-level quantization by reducing the number of bits per 
%         pixel to 2 bits/pixel and save the image. 
%       5.Change the gray-level quantization by reducing the number of bits per 
%         pixel to 1 bits/pixel and save the image. 
%
%  Restrictions/Notes:
%      This function requires an 8-bit image as input.  
%
%  The following functions are called:
%      convert.m        convert the image to specific image
%      save256.m        convert the image to 256x256 pixel image.
%      billint.m        create a 256x256 image from 64x64 image.
%      zero.m           Set up an MxN image full of zeros
%      greyconvert.m    To change the gray-level quantization of the
%                       original image and return a new image
%  Author:      Jiachen Chen, Yijie Tong, Lyuzhou Zhuang
%  Date:        09/09/2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;      % Clear out all memory 

%  Read in image "lake.gif" into array "f", get its 2D dimensions,
%  and display it on the screen

f=imread('boat.gif');
imtool(f);

% Following is the code for problem#1.
% Convert the array f to 128x128, 64x64 and 32x32 pixels images.

f_128 = convert(f, 128);  
imwrite(f_128,'f_128.gif');
f_128_256 = save256(f_128, 128); 
imwrite(f_128_256,'f_128_256.gif');

f_64 = convert(f, 64);  
imwrite(f_64,'f_64.gif');
f_64_256 = save256(f_64, 64); 
imwrite(f_64_256,'f_64_256.gif');

f_32 = convert(f, 32);  
imwrite(f_32,'f_32.gif');
f_32_256 = save256(f_32, 32); 
imwrite(f_32_256,'f_32_256.gif');


% Following is the code for problem#2.
fb_64_256 = bilint(f_64); %call function bilint for interpolation
imwrite(uint8(fb_64_256), 'fb_64_256.gif');
% imnew=interp2(double(f_64),2);
% imwrite(uint8(imnew),'interp2_result.gif');% line 91&92 are for testing
% and comparision purpose


% Following is the code for problem#3.
% To change the gray-level quantization by reducing the number of bits per pixel
% from 8 to 6, 4, 2 and 1 bits/pixel.

% Change the gray-level quantization by reducing the number of bits per pixel to 8 bits/pixel.
% Note that the original picture has exactly 256 grey levels.
imwrite(f,'grey256.gif');

% Change the gray-level quantization by reducing the number of bits per pixel to 6 bits/pixel.
f1=greyconvert(f,64);
imwrite(f1,'grey64.gif');

% Change the gray-level quantization by reducing the number of bits per pixel to 4 bits/pixel.
f1=greyconvert(f,16);
imwrite(f1,'grey16.gif');

% Change the gray-level quantization by reducing the number of bits per pixel to 2 bits/pixel.
f1=greyconvert(f,4);
imwrite(f1,'grey4.gif');

% Change the gray-level quantization by reducing the number of bits per pixel to 1 bits/pixel.
f1=greyconvert(f,2);
imwrite(f1,'grey2.gif');


%%%%%%%%%%%%%%%%%%%End of the main.m file%%%%%%%%%%%%%%%


