%%%%%%%%%%%%%%%%%%%Function save256%%%%%%%%%%%%%%%%%%%%
%This function is used to find the 3 largest components of labeled image 
%and delete the other components to 0.
%
%Input Variables
%         f       The file will be changed
%         t       A zero function with the length of 65536.
%         M, N    rows (M) and columns in f
%         x       x coordinate of a pixel
%         y       y coordinate of a pixel
%         max     A matrix with 4 values to save the components' size. Only 
%         if there are three valuable number in it,and the max(4) is 0, it 
%         shows that we find the 3 largest components.
%         cnt     It is used to count the valuable variables in max. 
%         If it is larger than 4, we should break out the for loop and 
%         increase the value of 'compare', then begin a new while loop.
%         compare It is used to judge whether the current value should be 
%         put into the max matrix. It will add 1 after each while loop. 
%         judge   It is to judge whether the max is useful: it only has 
%         three valuable numbers and max(4) is 0. Only if we find the 3
%         (it must be 3, cannot be 2 or 4) largest componets, 'judge' will 
%         help finish the while loop.
%
%
%Returned Results
%         A field consisted with the 3 largest components of labeled image
%         and other pixels to 0.
%
%Processing follow:
%         1. Calculate the size of the components, and save the value in
%         t(1,65536).
%         2. Take the value from t(1,y).
%         3. Compare t(1,y) to 'compare', if the value is larger, and the
%         max is not full, put the value into max; if the value is smaller,
%         take next value; If the max is full, initial and restart the for
%         loop.
%         4. If the max(3) is not 0 and max(4) is 0, it means that the 
%         the loop has selected the 3 largest value; else, initial and
%         restart the for loop.
%         5. Look for the corresponding components of the max, save these
%         components and delete othere components to 0.
%
%Author: Jiachen Chen, Yijie Tong, Lyuzhou Zhuang
%Date: 09/22/2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function select = select(f)
[M,N] = size(f);

t = zeros(1,65536);
%Set up a 1-D zero matrix, to store all the components in f. The maximum
%number should be smaller than 256*256;
%Following is to calculate the size of components in each 4-connected
%filed in labeled image.
for x=1:M
    for y=1:N
        if f(x,y) > 0
            t(f(x,y)) = t(f(x,y)) + 1;
        end
    end
end

%Initial the parameters
max = [0,0,0,0];
cnt = 1;
compare = 1;
judge = 1;

%Following is to find the 3 largest components of the labeled image through 
%calculating the number of the same value.
%As we have the number of components of each 4-connected field, we just
%need to compare them to a increasing variable-'compare', to find the 3
%largest componets.
while(judge)
    for y = 1:65536
        if t(1,y) > compare
            if cnt <= 4 
                %If the max is not full.
                max(cnt) = t(1,y);
                cnt = cnt+1;
            else
                cnt = 1;
                %If the max is full, then restart the for loop and
                %find another 3 components.
                break;
            end
        end
    end
    if max(4) == 0 && max(3) ~= 0
        %To ensure there are 3 valuable numbers in the max matrix.
        judge = 0;
        %Finsh the while loop.
        break;
    else
        %If there are 4 valuable numbers in the max, restart the while loop
        %add 1 to 'compare' and reset the parameters.
        judge = 1;
        compare = compare + 1;
        jump = 0;
        max = [0,0,0,0];
       
    end
end

%Following is to find the corresponding value to the 3 largest components. 
for x = 1:65536
    if t(1,x) == max(1)
        p1 = x;
    elseif t(1,x) == max(2)
        p2 = x;
    elseif t(1,x) == max(3)
        p3 = x;
    end
end

%Following is to save the 3 largest components of the labeled image. Other
%components will delete to 0.
for x = 1:M
    for y = 1:N
        if (f(x,y) ~= p1) && (f(x,y) ~= p2) && (f(x,y) ~= p3)
            select(x,y) = 0;
        else
            select(x,y) = f(x,y);
        end
    end
end     

