function list = ColorSmoothnessList(color,sigma)
%Calculate the smoothness list of a 3 - channel color image
%Output: 
%   output      -   the output list
%Input: 
%   color       -   Input color image
%   sigma       -   Coefficient of gaussian kernel for color similarity
%Code Author:
%   Liu Junyi, Zhejiang University
%   May. 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
list = zeros(4*numel(color),1);
height = size(color,1);
width = size(color,2);
pixelNum = height * width;
color2 = double(reshape(color,[pixelNum,3]));
count = 1;
for i = 1:pixelNum
    if(mod(i+1,height) ~= 1)
       list(count) = AdjacentWeight(i,i+1,color2,sigma);
       count = count + 1;
    end
    if(mod(i-1,height) ~= 0)
        list(count) = AdjacentWeight(i,i-1,color2,sigma);
       count = count + 1;
    end
    if(i + height < pixelNum)
       list(count) = AdjacentWeight(i,i+height,color2,sigma);
       count = count + 1;
    end
    if(i - height > 0)
       list(count) = AdjacentWeight(i,i- height,color2,sigma);
       count = count + 1;
    end
end
list = list(1:count-1);
end


function output = AdjacentWeight(i,j,color,sigma)
    temp1 = sum((color(i,:) - color(j,:)).^2);
    output = sqrt(exp(-1/(2*sigma^2)*temp1));
end