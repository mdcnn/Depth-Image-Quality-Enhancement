function result = MRFUpsamplingGC(color,depth,sigma,alpha)
%Solve the original MRF upsamling model by graph cuts
%Output: 
%   result      -   the output depth data
%Input: 
%   color       -   Input color image
%   depth       -   Depth map
%   sigma       -   Coefficient of gaussian kernel for color similarity
%   alpha       -   The balance factor between data term and smoothness term
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
    initialDepth = floor(reshape(bicubicDepth,pixelNumber,1)/1);
    pairwise = ColorSmoothnessN_N(color,sigma);
    [X Y] = meshgrid(0:255, 0:255);
    labelcost = min(10, (X - Y).*(X - Y));
    % compute unary term
    unary = zeros(256,pixelNumber);
    for i=1:width
        for j=1:height
            if(depth(j,i) ~= 0)
                unary(:,j+(i-1)*height)=min((linspace(0,255,256)-floor(depth(j,i)/1)).^2,100);
            end
        end
    end
    tic;
    addpath('.\GCMex');
    [result E Eafter] = GCMex(initialDepth, single(unary), pairwise, single(labelcost),1);
    time = toc;
    fprintf('    The running time of solving Graphcut is %.5f s', time);
    result = reshape(result,height,width);
    result = result * 1;