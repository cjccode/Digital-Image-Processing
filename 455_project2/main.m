%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%    1. Choose a threshhold and save the thresholded image. Then find the
%       4-connected fields through function bwlabel and display the labeled
%       image with function fGRB. Furthermore, save the 3 largest components
%       of the labeled image and delete other components to 0.
%    2. build the OR (set union) and XOR (exclusive-or) binary-image 
%       operators and NOT (set complement) unary-image operator. Let A be 
%       the \bear" image and B be the \castles" image. Apply
%       image-algebra operations, as requested below:
%       i. Compute A OR B 
%       ii. Compute A XOR B.
%       iii. Compute [NOT(A)] XOR [NOT(B)].
%      (b) Build the minimum operator and compute E = min(C;D); where 
%       image C is "mandrill_gray" and image D is "cameraman".
%       For each pair of pixels (x; y) in the two input images, the
%       minimum operator assigns the minimum of the two values (C(x; y)
%       and D(x; y)) to the output E(x; y).
%
% Input Variables:
%       f, A, B, C, D    input 2D image
%       M, N             rows (M) and columns in f
%       x                x coordinate of a pixel
%       y                y coordinate of a pixel
%
% Returned Results:
%       f1        set a threshold and save the values in f1
%       flabel    all 4-connected fileds                                         
%       fRGB      use label2rgb function to display the labeled image with
%       colored components
%       f_select  find the 3 largest components of labeled image and delete
%       the other components to 0.
%       AorB      result of A OR B
%       AxorB     result of A XOR B
%       NAxorNB   result of [NOT(A)] XOR [NOT(B)]
%
% Processing Flow:
%      Problem#1:                                                            
%       1. Choose the threshold 127 and save the thresholded image.
%       2. Find the 4-connected components of thresholded image using
%       bwlabel function, and then display this labeled image with colored
%       components with label2rgb function.
%       3. Save the 3 largest components of the labeled image and delete
%       other components to 0.
%      Problem#2:                                                            
%       1. input image A, B 
%       2. Compute A OR B and output the result
%       3. Compute A XOR B and output the result
%       4. Compute [NOT(A)] XOR [NOT(B)] and output the result
%       5. input image C, D 
%       6. Compute E = min(C,D) and output the result
%
%  Restrictions/Notes:
%       This function requires an 8-bit image as input.  
%
%  The following functions are called:
%       select     find the 3 largest components of input image and delete
%       the other components to 0.
%       bwlabel    find all the connected components of the image
%       label2rgb  convert the labeledimage to colored components
%       OR         set union
%       XOR        exclusive-or
%       NOT        set complement
%       minimum    For each pair of pixels (x; y) in the two input images, 
%                  the minimum operator assigns the minimum of the two 
%                  values (C(x; y) and D(x; y)) to the output E(x; y).
%       
%  Author:      Jiachen Chen, Yijie Tong, Lyuzhou Zhuang
%  Date:        09/23/2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;      % Clear out all memory 

%Following is the code for problem1.
%Read in image "boat.gif" into array "f", get its 2D dimensions,and 
%display it on the screen.
f = imread('boat.gif');
[M,N] = size(f);
imtool(f);

%Following is to set a threshold and save it.
for x = 1:M
    for y = 1:N
        if f(x,y)>127
            %We choose the threshold as 127 here.
            f1(x,y) = 1;
        else
            f1(x,y) = 0;
        end
    end
end
% we need to map binary vaules to gray scale image
imwrite(uint8(f1),colormap([0,0,0;1,1,1]),'thresh.gif');
imtool(f1);

%Create a labeled image called "flabel" from the input thresholded
flabel = bwlabel(f1,4);

%Display the labeled image with colored components. 
fRGB = label2rgb(flabel);
imtool(fRGB);

%Use function select to save the 3 largest components of the labeled image 
%and delete other components to 0, return the result.
f_select = select(flabel);
imwrite(uint8(f_select),'select.gif');
imtool(f_select);

%Following is the code for problem2.

A = imread('bear.gif');
%imtool(A);
B = imread('castles.gif');
%imtool(B);

%OR: set union
AorB = uint8(OR(A,B));
imtool(AorB*256);
imwrite(AorB,colormap([0,0,0;1,1,1]),'AorB.gif');

%XOR: exclusive-or
AxorB = uint8(XOR(A,B));
imtool(AxorB*256);
imwrite(AxorB,colormap([0,0,0;1,1,1]),'AxorB.gif');

%NOT: set complement. Then apply XOR
NAxorNB = uint8(XOR(NOT(A),NOT(B)));
imtool(NAxorNB*256);
imwrite(NAxorNB,colormap([0,0,0;1,1,1]),'NAxorNB.gif');

C = imread('mandril_gray.tif');
D = imread('cameraman.tif');
imtool(C);
imtool(D);

%minimum: For each pair of pixels (x; y) in the two input images, 
%the minimum operator assigns the minimum of the two 
%values (C(x; y) and D(x; y)) to the output E(x; y).
E=minimum(C,D);
imtool(E);
imwrite(E,'E.gif');

%%%%%%%%%%%%%%%%%%%End of the main.m file%%%%%%%%%%%%%%%
                    
        
