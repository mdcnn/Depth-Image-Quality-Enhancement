%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function Name: BilateralFilter
%Aim: Use the bilateral filter to upsample the depth map
%Output: 
%   Result      -   The output depth map after bilateral filtering
%Input: 
%   color       -   Color image
%   depth 		-   Depth map
%   sigma_w     -   Coefficient of gaussian kernel for spatial
%   sigma_c     -   Coefficient of gaussian kernel for range
%   w           -   Window size
%Code Author:
%   Liu Junyi, Zhejiang University
%   Version 1: June 2012
%   Version 2: May 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result = BilateralFilter(color,depth,sigma_w,sigma_c,w)
    if( size(color,3) ~= 3 ),
		error( 'color data must be of 3 channel' );
	end
	
	color = double(color);
	inputHeight = size( color, 1 );
	inputWidth  = size( color, 2 );
    [mx,my] = meshgrid(-w:w,-w:w);
    spatial = exp( -(mx.^2 + my.^2) / (2*sigma_w^2) );  
    result = zeros(inputHeight,inputWidth);
	
    for i = 1:inputHeight
        for j = 1:inputWidth
             % Extract local region.
             iMin = max(i-w,1);
             iMax = min(i+w,inputHeight);
             jMin = max(j-w,1);
             jMax = min(j+w,inputWidth);
			 
             color_sec = color(iMin:iMax,jMin:jMax,:);
             depth_sec = depth(iMin:iMax,jMin:jMax);
			 
             % Compute Gaussian range weights.
             dR = color_sec(:,:,1)-color(i,j,1);
             dG = color_sec(:,:,2)-color(i,j,2);
             dB = color_sec(:,:,3)-color(i,j,3);
             range = exp( -(dR.^2 + dG.^2 + dB.^2) / (2*sigma_c^2));

             % Calculate bilateral filter response.
             depth_weight = (depth_sec>0) .* range .* spatial((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
             depth_sum = depth_sec .* depth_weight;
             result(i,j) = sum(depth_sum(:)) / sum(depth_weight(:));
             if(isnan(result(i,j)))
                 result(i,j) = 0;
             end
        end
    end
    
end