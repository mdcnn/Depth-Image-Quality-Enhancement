%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function Name: NoiseAwareFilter
%Aim: Use the NoiseAware bilateral filter to upsample the depth map
%Output: 
%   Result      -   The output depth map after bilateral filtering
%Input: 
%   color       -   Color image
%   depth 		-   Depth map
%   sigma_w     -   Coefficient of gaussian kernel for spatial
%   sigma_c     -   Coefficient of gaussian kernel for range1
%   sigma_d     -   Coefficient of gaussian kernel for range2
%   w           -   Window size
%Code Author:
%   Liu Junyi, Zhejiang University
%   Version 1: June 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result = NoiseAwareFilter(color,depth,factor,sigma_w,sigma_c,sigma_d,w,epsilon,tau)
    if( size(color,3) ~= 3 ),
		error( 'color data must be of 3 channel' );
    end
    if ~exist( 'epsilon', 'var' ),
        epsilon = 0.5;
    end
    if ~exist( 'tau', 'var' ),
        tau = 20;
    end
	
    depth = double(depth);
	color = double(color);
	highHeight = size( color, 1 );
	highWidth  = size( color, 2 );
    lowHeight = size(depth,1);
    lowWidth = size(depth,2);
    highDepth = imresize(depth,[highHeight,highWidth]);
    
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
            
            % Compute joint bilateral range weights.
            dR = color_sec(:,:,1)-color(i,j,1);
            dG = color_sec(:,:,2)-color(i,j,2);
            dB = color_sec(:,:,3)-color(i,j,3);
            range1 = exp( -(dR.^2 + dG.^2 + dB.^2) / (2*sigma_c^2));
            % Compute standard bilateral range weights.
            Ip = highDepth(i,j);
            range2 = exp( -(depth_sec - Ip).^2 / (2*sigma_d^2));
            
            % Compute spatial weights
            iw = (iMin:iMax) - id;
            jw = (jMin:jMax) - jd;
            [mx,my] = meshgrid(jw,iw);
            spatial = exp( -(mx.^2 + my.^2) / (2*sigma_w^2) );
            
            % Compute the blending function
%             deltaRegion = max(depth_sec(:)) - min(depth_sec(:));
            % epsilon controls how wide the transition area (in terms of the min-max difference) 
            % tau controls at what min-max difference the blending interval shall be centered
%             alpha = 1/(1+exp( -epsilon * (deltaRegion - tau)));
            alpha = 1 - tau / (var(depth_sec(:)) + tau);

            % Calculate bilateral filter response.
            depth_weight = (depth_sec>0) .* (alpha * range1 + (1 - alpha) * range2).* spatial;
            depth_sum = depth_sec .* depth_weight;
            result(i,j) = sum(depth_sum(:)) / sum(depth_weight(:));
        end
    end
end