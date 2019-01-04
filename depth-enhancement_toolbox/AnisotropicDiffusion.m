%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function Name: AnisotropicDiffusion
%Aim: Guided depth upsample based on anisotropic diffusion 
%Output: 
%   Result      -   The output depth map
%Input: 
%   color       -   Color image
%   depth 		-   Sparse depth map 
%   sigma_w     -   Coefficient of gaussian kernel for spatial
%   data_weight -   weight of the measurements
%Code Author:
%   Liu Junyi, Zhejiang University
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result = AnisotropicDiffusion(color,depth,sigma_w,data_weight)
    if( size(color,3) ~= 3 ),
		error( 'color data must be of 3 channel' );
    end
    if ~exist( 'data_weight', 'var' ),
        data_weight = 100;
    end
    height = size(color,1);
    width = size(color,2);
    pixelNumber = height * width;
    
    tic;
    depth = double(depth);
    Z = sparse(reshape(depth,pixelNumber,1)) * data_weight;
   
    color = double(color);
    S = ADMatrix(color,depth,sigma_w,data_weight);
    
    fprintf('    The running time of getting A and b is %.5f s\n',toc);
    Result = S\Z;
    BackslashTime=toc;
    fprintf('    The running time of solving Ax=b by Backslash is %.5f s\n',BackslashTime)
    
    result = full(reshape(double(Result),height,width));
    fprintf('    Done!\n')