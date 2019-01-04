function output = DepthKernelTerm(depth,sigma,w)
% Calculate the depth kernel data term matrix of a sparse depth map
% Output size is equal to [valid depth number * edge number,N]
%Output: 
%   output      -   the output sparse matrix
%Input: 
%   color       -   Input depth map
%   sigma       -   Coefficient of gaussian kernel for depth measurement
%   w           -   Window size of the gaussian kernel
%Code Author:
%   Liu Junyi, Zhejiang University
%   June. 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if( size(depth,3) ~= 1 ),
		error( 'depth data must be of 1 channel' );
    end
    inputHeight = size( depth, 1 );
    inputWidth  = size( depth, 2 );
    pixelNumber = inputHeight * inputWidth;
    [mx,my] = meshgrid(-w:w,-w:w);
    spatial = exp( -(mx.^2 + my.^2) / (2*sigma^2) );
    z = reshape(depth,pixelNumber,1);
    idx = find(z>0);
    validNum = length(idx);
    kernelNum = numel(spatial);
    x=zeros(1,validNum * kernelNum);
    y=zeros(1,validNum * kernelNum);
    s=zeros(1,validNum * kernelNum);
    for i = 1:length(idx)
        x( (i - 1) * kernelNum + 1: i * kernelNum ) = (i - 1) * kernelNum + 1: i * kernelNum;
        y( (i - 1) * kernelNum + 1: i * kernelNum ) = idx(i);
        s( (i - 1) * kernelNum + 1: i * kernelNum ) = spatial(:);
    end
    output=sparse(x,y,s,validNum * kernelNum, pixelNumber);
end