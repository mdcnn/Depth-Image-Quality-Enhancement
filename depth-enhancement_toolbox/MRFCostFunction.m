function [J, grad] = MRFCostFunction(depth, measuredDepth, colorList, alpha)
%Compute cost and gradient for MRF upsample
%Output: 
%   J               -   Cost
%   Grad            -   Gradient
%Input: 
%   depth           -   Input depth map
%   measuredDepth   -   The depth map having measured information
%   smooothMatrix   -   Smooth Matrix computed by color image
%Code Author:
%   Liu Junyi, Zhejiang University
%   May 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

J_dataTerm = sum((depth(measuredDepth > 0) - measuredDepth(measuredDepth > 0)).^2);
height = size(measuredDepth,1);
width = size(measuredDepth,2);
pixelNum = height * width;
% depthMap = reshape(depth,height,width);
J_smoothTerm = 0;
grad = zeros(pixelNum,1);
count = 1;
for i = 1:length(depth)
    if(mod(i+1,height) ~= 1)
        J_smoothTerm = J_smoothTerm + alpha * colorList(count) * (depth(i) - depth(i+1))^2;
        grad(i) = grad(i) + alpha * 2 * colorList(count) * (depth(i) - depth(i+1));
        grad(i+1) = grad(i+1) - alpha * 2 * colorList(count) * (depth(i) - depth(i+1));
        count = count + 1;
    end
    if(mod(i-1,height) ~= 0)
        J_smoothTerm = J_smoothTerm + alpha * colorList(count) * (depth(i) - depth(i-1))^2;
        grad(i) = grad(i) + alpha * 2 * colorList(count) * (depth(i) - depth(i-1));
        grad(i-1) = grad(i-1) - alpha * 2 * colorList(count) * (depth(i) - depth(i-1));
        count = count + 1;
    end
    if(i + height < pixelNum)
        J_smoothTerm = J_smoothTerm + alpha * colorList(count) * (depth(i) - depth(i + height))^2;
        grad(i) = grad(i) + alpha * 2 * colorList(count) * (depth(i) - depth(i + height));
        grad(i+ height) = grad(i+ height) - alpha * 2 * colorList(count) * (depth(i) - depth(i+ height));
        count = count + 1;
    end
    if(i - height > 0)
        J_smoothTerm = J_smoothTerm + alpha * colorList(count) * (depth(i) - depth(i - height))^2;
        grad(i) = grad(i) + alpha * 2 * colorList(count) * (depth(i) - depth(i - height));
        grad(i - height) = grad(i - height) - alpha * 2 * colorList(count) * (depth(i) - depth(i - height));
        count = count + 1;
    end
    if(measuredDepth(i) > 0)
        grad(i) = grad(i) + 2 * (depth(i) - measuredDepth(i));
    end
        
end
J = J_dataTerm + J_smoothTerm;
% =============================================================

end
