function result = MRFUpsamplingCG(color,depth,sigma,alpha)
%Solve the original MRF upsamling model by fminunc using preconditioned conjugate gradient
%Output: 
%   result      -   the output depth data
%Input: 
%   color       -   Input color image
%   depth       -   Depth map
%   sigma       -   Coefficient of gaussian kernel for color similarity
%   alpha       -   The balance factor between data term and smoothness term
%Reference
%   NIPS2005_An Application of Markov Random Fields to Range Sensing
%   James Diebel and Sebastian Thrun
%Code Author:
%   Liu Junyi, Zhejiang University
%   May 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    height = size(color,1);
    width = size(color,2);
    pixelNumber = height * width;
    depthSec = depth;
    depthSec = depthSec(depthSec > 0);
    smallWidth = sum(sum(depth,1)>0);
    smallHeight = sum(sum(depth,2)>0);
    if(smallWidth * smallHeight ~= length(depthSec))
        error('Only support the grid sampled depth map now...');
    end
    smallDepth = reshape(depthSec,smallHeight,smallWidth);
    
    bicubicDepth = imresize(smallDepth,[height,width]);
    initialDepth = reshape(bicubicDepth,pixelNumber,1);
    list = ColorSmoothnessList(color,sigma);
    [cost, grad] = MRFCostFunction(initialDepth, depth, list, alpha);
    
%     % Now we can use it to check your cost function and derivative calculations
%     % for the sparse autoencoder.  
%     numgrad = computeNumericalGradient( @(x) MRfCostFunction(x, depth,...
%                                                               list, alpha),... 
%                                                               initialDepth);
% %     disp([numgrad1 grad]);
%     diff = norm(numgrad-grad)/norm(numgrad+grad);
%     disp(diff); % Should be small. 

    
    %  Set options for fminunc
    options = optimset('GradObj', 'on', 'MaxIter', 400);

    %  Run fminunc to obtain the optimal theta
    %  This function will return theta and the cost 
    [result, cost] = ...
        fminunc(@(x)(MRFCostFunction(x, depth, list, alpha)),initialDepth, options);
    
    fprintf('    Cost at theta found by fminunc: %f\n', cost);
    
    result = reshape(result, height, width); 