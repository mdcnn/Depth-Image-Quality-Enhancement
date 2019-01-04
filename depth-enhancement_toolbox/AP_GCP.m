%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function Name: AP_GCP
%Aim: adaptive propagation from sparse ground controls points
%Output: 
%   Result      -   the output depth data
%Input: 
%   Image       -   Input color image
%   SampleDepth -   Depth map need upsampling
%   Height      -   Image height 
%   Width       -   Image width
%   sigma_w     -   Coefficient of gaussian kernel for color similarity
%Reference
%   Global Stereo Matching Leveraged by Sparse Ground Control Points
%   Liang Wang, Ruigang Yang
%Code Author:
%   Liu Junyi, Zhejiang University
%   June 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Result=AP_GCP(Image,SampleDepth,Height,Width,sigma,labels,labelSe)
% Image=ColorSection;
% sigma=10;
    PixelNumber=Height*Width;
    Z=reshape(SampleDepth,PixelNumber,1);
    %S=zeros(PixelNumber,PixelNumber);  
%     S=sparse(PixelNumber,PixelNumber);
    %     ProcessedImage = double(255*rgb2hsv(Image));
%     ProcessedImage=double(Image);
    
    % Compute the L-W matrix
    tic;
%     for i=1:Width      
%         for j=1:Height    
%             Pos=Height*(i-1)+j;
%             w_sum=0;
%             if Z(Pos)==0
%                 if ((i-1)>0)
%                     S(Pos,Height*(i-2)+j)=-exp(-1/(2*sigma^2)*sum((ProcessedImage(j,i,1:3)-ProcessedImage(j,i-1,1:3)).^2)); 
%                     w_sum=w_sum+S(Pos,Height*(i-2)+j);
%                 end
%                 if i+1<=Width
%                     S(Pos,Height*i+j)=-exp(-1/(2*sigma^2)*sum((ProcessedImage(j,i,1:3)-ProcessedImage(j,i+1,1:3)).^2));
%                     w_sum=w_sum+S(Pos,Height*i+j);
%                 end
%                 if j-1>0
%                     S(Pos,Height*(i-1)+j-1)=-exp(-1/(2*sigma^2)*sum((ProcessedImage(j,i,1:3)-ProcessedImage(j-1,i,1:3)).^2));
%                     w_sum=w_sum+S(Pos,Height*(i-1)+j-1);
%                 end
%                 if j+1<=Height
%                     S(Pos,Height*(i-1)+j+1)=-exp(-1/(2*sigma^2)*sum((ProcessedImage(j,i,1:3)-ProcessedImage(j+1,i,1:3)).^2)); 
%                     w_sum=w_sum+S(Pos,Height*(i-1)+j+1);
%                 end
% 
% 
% %                 if (i-1>0)&&(j-1>0)
% %                     S(Pos,Height*(i-2)+j-1)=-exp(-1/(2*sigma^2)*sum((ProcessedImage(j,i,1:3)-ProcessedImage(j-1,i-1,1:3)).^2));
% %                     w_sum=w_sum+S(Pos,Height*(i-2)+j-1);
% %                 end
% %                 if (i-1>0)&&(j+1<=Height)
% %                     S(Pos,Height*(i-2)+j+1)=-exp(-1/(2*sigma^2)*sum((ProcessedImage(j,i,1:3)-ProcessedImage(j+1,i-1,1:3)).^2));
% %                     w_sum=w_sum+S(Pos,Height*(i-2)+j+1);
% %                 end
% % 
% %                 if (i+1<=Width)&&(j+1<=Height)
% %                     S(Pos,Height*i+j+1)=-exp(-1/(2*sigma^2)*sum((ProcessedImage(j,i,1:3)-ProcessedImage(j+1,i+1,1:3)).^2));
% %                     w_sum=w_sum+S(Pos,Height*i+j+1);
% %                 end
% %                 if (i+1<=Width)&&(j-1>0)
% %                     S(Pos,Height*i+j-1)=-exp(-1/(2*sigma^2)*sum((ProcessedImage(j,i,1:3)-ProcessedImage(j-1,i+1,1:3)).^2));
% %                     w_sum=w_sum+S(Pos,Height*i+j-1);
% %                 end
%                 S(Pos,:)=-S(Pos,:)/w_sum;
%             end
%             S(Pos,Pos)=1;
%             Pos
%             S(Pos,:)
%         end
%     end
    x=zeros(Height*Width*5,1);
    y=zeros(Height*Width*5,1);%Height*Width*5-2*Width-2*Height
    s=zeros(Height*Width*5,1);%Height*Width*5-2*Width-2*Height
    count=1;
    for i=1:Width       %Regardless of boundary
        for j=1:Height     %Regardless of boundary
            Pos=Height*(i-1)+j;
            if Z(Pos)==0
%                 w=sqrt(SmoothnessCost(ProcessedImage,j,i,sigma,2)); %labels,labelSe
                w=sqrt(SmoothnessCost(Image,j,i,sigma,2));
                numbers=sum(w>0);
                yTemp=[Height*(i-2)+j Height*i+j Height*(i-1)+j-1 Height*(i-1)+j+1];

                x(count:count+numbers-1)=Pos*ones(numbers,1);
                y(count:count+numbers-1)=yTemp(w>0);
                s(count:count+numbers-1)=-(w(w>0)/sum(w(w>0)))';
                count=count+numbers;
            end
            x(count)=Pos;
            y(count)=Pos;
            s(count)=1;
            count=count+1;
        end
    end
%     recordCount=Height*Width;
%     for i=1:Width       %Regardless of boundary
%         for j=1:Height     %Regardless of boundary
%             Pos=Height*(i-1)+j;
%             if Z(Pos)~=0
%                 recordCount=recordCount+1;
%                 w=sqrt(SmoothnessCost(ProcessedImage,j,i,sigma,3)); %labels,labelSe
%                 numbers=sum(w>0);
%                 yTemp=[Height*(i-2)+j Height*i+j Height*(i-1)+j-1 Height*(i-1)+j+1];
% 
%                 x(count:count+numbers-1)=recordCount*ones(numbers,1);
%                 y(count:count+numbers-1)=yTemp(w>0);
%                 s(count:count+numbers-1)=-(w(w>0)/sum(w(w>0)))';
%                 count=count+numbers;
%                 x(count)=recordCount;
%                 y(count)=Pos;
%                 s(count)=1;
%                 count=count+1;
%             end
%         end
%     end
%     
    x=x(1:count-1);
    y=y(1:count-1);
    s=s(1:count-1);
    S=sparse(x,y,s,PixelNumber,PixelNumber);%recordCount
    WeightCalculationTime=toc;
    fprintf('AP_GCP:The running time of generating the weighting matrix is %.5f s\n',WeightCalculationTime)
%     S_sparse=sparse(S);
    tic;
    %Using Backslash to solve the Ax=b
%     Z1=zeros(size(S,1),1);
%     Z1(1:length(Z))=Z;
%     b=S'*Z1;
%     S=S'*S;
    Result = S\Z;
    BackslashTime=toc;
     fprintf('AP_GCP:The running time of solving Ax=b by Backslash is %.5f s\n',BackslashTime)
end