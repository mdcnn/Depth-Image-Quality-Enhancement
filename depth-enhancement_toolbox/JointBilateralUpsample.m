%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function Name: JointBilateralUpsample
%Aim: Use the joint bilateral upsample method to upsample the depth map
%Output: 
%   Result      -   The output depth map after bilateral filtering
%Input: 
%   color       -   High resolution color image
%   depth 		-   Low resolution depth map
%   factor      -   Upsampling factor
%   sigma_w     -   Coefficient of gaussian kernel for spatial in low-res
%                   Default: 0.5
%   sigma_c     -   Coefficient of gaussian kernel for range
%                   Default: 0.1 for [0,1]
%   w           -   Window size
%                   Default: 2
%Code Author:
%   Liu Junyi, Zhejiang University
%   Version 1: June 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result = JointBilateralUpsample(color,depth,factor,sigma_w,sigma_c,w)
    if( size(color,3) ~= 3 ),
		error( 'color data must be of 3 channel' );
    end
	
    depth = double(depth);
	color = double(color);
	highHeight = size( color, 1 );
	highWidth  = size( color, 2 );
    lowHeight = size(depth,1);
    lowWidth = size(depth,2);
    
%     [mx,my] = meshgrid(-w:w,-w:w);
%     spatial = exp( -(mx.^2 + my.^2) / (2*sigma_w^2) );
    result = zeros(highHeight,highWidth);
    for i = 1:highHeight
        for j = 1:highWidth
            id = i/factor;
            jd = j/factor;
            iMin = ceil(max(id-w,1));
            iMax = floor(min(id+w,lowHeight));
            jMin = ceil(max(jd-w,1));
            jMax = floor(min(jd+w,lowWidth));
            
            depth_sec = depth(iMin:iMax,jMin:jMax);
            color_sec = color(iMin * factor:factor:iMax * factor,jMin * factor:factor:jMax * factor,:);
            
            % Compute Gaussian range weights.
            dR = color_sec(:,:,1)-color(i,j,1);
            dG = color_sec(:,:,2)-color(i,j,2);
            dB = color_sec(:,:,3)-color(i,j,3);
            range = exp( -(dR.^2 + dG.^2 + dB.^2) / (2*sigma_c^2));
            % Calculate bilateral filter response.
            iw = (iMin:iMax) - id;
            jw = (jMin:jMax) - jd;
            [mx,my] = meshgrid(jw,iw);
            spatial = exp( -(mx.^2 + my.^2) / (2*sigma_w^2) );
            depth_weight = (depth_sec>0) .* range .* spatial;
            depth_sum = depth_sec .* depth_weight;
            result(i,j) = sum(depth_sum(:)) / sum(depth_weight(:));
        end
    end
end