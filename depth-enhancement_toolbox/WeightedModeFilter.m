%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function Name: WeightedModeFilter
%Aim: Use the weighted mode filter to upsample the depth map
%Output: 
%   Result      -   The output depth map
%Input: 
%   color       -   Color image
%   depth 		-   Depth map (the same size as the color image)
%   sigma_w     -   Coefficient of gaussian kernel for spatial
%   sigma_c     -   Coefficient of gaussian kernel for range
%   sigma_d     -   Coefficient of gaussian kernel for relaxed bins
%   w           -   Window size
%Code Author:
%   Liu Junyi, Zhejiang University
%   Version 1: June 2012
%   Version 2: May 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result = WeightedModeFilter(color,depth,sigma_w,sigma_c,w,sigma_d)
    if( size(color,3) ~= 3 ),
		error( 'color data must be of 3 channel' );
	end
	if ~exist( 'sigma_d', 'var' ),
        sigma_d = 3;
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
             local_spatial = spatial((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
             
             % Generate the histogram
             bins = zeros(1,256);
             idx = find(depth_sec > 0);
             for m = 1:length(idx)
                 tmp = exp( - ((0:255) - depth_sec(idx(m))).^2 / (2*sigma_d^2));
                 bins = bins + range(idx(m)) * local_spatial(idx(m)) * tmp;
             end
             
             % Calculate mode response.
             [~,result(i,j)] = max(bins);
             result(i,j) = result(i,j) - 1;
        end
    end
    
end