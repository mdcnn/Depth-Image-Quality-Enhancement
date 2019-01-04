%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function Name: ADMatrix
%Aim: Calculate the N * N matrix (A) for anisotropic difffusion model
%Output: 
%   output      -   the output sparse matrix
%Input: 
%   color       -   Input color image
%   depth       -   Input sparse depth map
%   sigma       -   Coefficient of gaussian kernel for color similarity
%   data_weight -   weight of the measurements
%Code Author:
%   Liu Junyi, Zhejiang University
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function output = ADMatrix(color,depth,sigma,data_weight)
    height = size(color,1);
    width = size(color,2);
    number = height * width;
    x = zeros(height * width * 5,1);
    y = zeros(height * width * 5,1);
    s = zeros(height * width * 5,1);
    count = 1;
    colorN3 = reshape(color,number,3);
    for i = 1:height 
        for j = 1:width
            
            pos = height*(j-1)+i;
           
            temp = [pos - 1, pos + 1, pos - height, pos + height];
            judge = zeros(4,1);
            judge(1) = mod(temp(1),height) ~= 0;
            judge(2) = mod(temp(2),height) ~= 1;
            judge(3) = temp(3) - height > 0;
            judge(4) = temp(4) + height < number;
            judge = logical(judge);
            validNumber = sum(judge);
            
            w = exp(-1/(2*sigma^2)*sum(( repmat(colorN3(pos,:),validNumber,1) - colorN3(temp(judge),:)).^2,2)); 

            x(count:count+validNumber-1) = pos*ones(validNumber,1);
            y(count:count+validNumber-1) = temp(judge);
            s(count:count+validNumber-1) = -w/sum(w);
            count = count + validNumber;
            x(count) = pos;
            y(count) = pos;
            if depth(i,j)==0
                s(count) = 1;
            else
                s(count) = data_weight + 1;
            end
            count = count + 1;
        end
    end
    x = x(1:count-1);
    y = y(1:count-1);
    s = s(1:count-1);
    output = sparse(x,y,s,number,number);
end
