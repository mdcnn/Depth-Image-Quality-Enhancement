function Result = LayeredBilateralFilter(color,depth,sigma_w,sigma_c,w,DepthInteval,IterativeTime)
    %% Initialization
    L=10000;
    k=1;
    D(:,:,1) = double(depth);
    CandidateD = 0:DepthInteval:255;
    height = size(color,1);
    width = size(color,2);
    color = double(color);
    CostVolume=zeros(height,width,length(CandidateD));
    CostCW=zeros(height,width,length(CandidateD));

    %% Iterative Module
    while 1
        for i=1:length(CandidateD)
            CostVolume(:,:,i) = min(L,(CandidateD(i)-D(:,:,k)).^2);                   %Cost Volume C(i)
            CostCW(:,:,i) = BilateralFilter(color,CostVolume(:,:,i),sigma_w,sigma_c,w);   %A bilateral filtering is performed throughout each slice of the cost volume to produce the new cost volume 
            % Compare with the reference, the color space is different  
        end
        [BestCost,BestDepthLocation] = min(CostCW,[],3);                          %Selecting the depth hypothesis with the minimal cost

        % Sub-pixel estimation
        CostUpper = zeros(height,width);
        CostLower = zeros(height,width);
        for i = 1:length(CandidateD) 
            CostUpper = CostUpper + CostCW(:,:,i).*((BestDepthLocation+1)==i);
            CostLower = CostLower + CostCW(:,:,i).*((BestDepthLocation-1)==i);
        end
        k = k + 1;
        D(:,:,k) = CandidateD(BestDepthLocation) - DepthInteval * (CostUpper-CostLower) ./ (2*(CostUpper+CostLower-2*BestCost));  
        % end of sub-pixel estimation   

        if IterativeTime==k
            break;
        end
    end
    Result = D(:,:,IterativeTime);
end