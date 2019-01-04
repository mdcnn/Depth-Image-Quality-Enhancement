function output = ColorSmoothnessTerm(color,sigma)
%Calculate the smoothness term matrix of MRF model for a 3-channel color image
%Output: 
%   output      -   the output sparse matrix
%Input: 
%   color       -   Input color image
%   sigma       -   Coefficient of gaussian kernel for color similarity
%Code Author:
%   Liu Junyi, Zhejiang University
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
height = size(color,1);
width = size(color,2);
x=zeros(1,width * (height-1) * 2 + (width-1) * height * 2);
y=zeros(1,width * (height-1) * 2 + (width-1) * height * 2);
s=zeros(1,width * (height-1) * 2 + (width-1) * height * 2);
colorUp = [color;zeros(1,width,3)]; 
colorUp = colorUp(2:height+1,:,:);         % 整个矩阵上移动一行，最后一行用0填充
colorLeft = [color,zeros(height,1,3)]; 
colorLeft = colorLeft(:,2:width+1,:);      % 整个矩阵左移动一列，最后一列用0填充
CompareColor{1}=colorUp;
CompareColor{2}=colorLeft;

% 不对边缘的像素进行操作
rowRange{1} = 1:height-1;       %  上下连接关系的条数为 width * (height-1)
colRange{1} = 1:width;
rowRange{2} = 1:height;         %  左右连接关系的条数为 (width-1) * height
colRange{2} = 1:width-1;
indexRange{1} = 1 : width * (height-1);
indexRange{2} = width * (height-1) + 1 : width * (height-1) + (width-1) * height;
nodeNumber{1} = width * (height-1);
nodeNumber{2} = (width-1) * height;
offset{1} = 1;                  %  上下连接关系的行列偏移为1
offset{2} = height;             %  左右连接关系的行列偏移为height

[mu,mv] = meshgrid(1:height, 1:width);
mu = mu';
mv = mv';
indexPtr = 0;
for i=1:2 % 针对四幅相减图像进行操作
    % 针对指定图像对进行像素Smoothness项的计算
    Temp1 = color(rowRange{i},colRange{i},:) - CompareColor{i}(rowRange{i},colRange{i},:);
    Temp2 = Temp1(:,:,1).^2+Temp1(:,:,2).^2+Temp1(:,:,3).^2;
    Temp3 = sqrt(exp(-1/(2*sigma^2)*Temp2));
    
    % 第一部分:原图
    indexRangePart = indexPtr + 1:indexPtr + nodeNumber{i};
    indexPtr = indexRangePart(end);
    xTemp = indexRange{i};
    x(indexRangePart) = xTemp;
    
    muTemp = mu(rowRange{i},colRange{i});
    mvTemp = mv(rowRange{i},colRange{i});
    pu = reshape(muTemp,length(rowRange{i})*length(colRange{i}),1);
    pv = reshape(mvTemp,length(rowRange{i})*length(colRange{i}),1);
    yTemp = pu + (pv - 1) * height;
    y(indexRangePart) = yTemp;

    sTemp = reshape(Temp3,numel(Temp3),1);
    s(indexRangePart) = sTemp;

    % 第二部分:比较图
    indexRangePart = indexPtr + 1:indexPtr + nodeNumber{i};
    indexPtr = indexRangePart(end);
    
    x(indexRangePart) = xTemp;

    y(indexRangePart) = yTemp + offset{i};

    s(indexRangePart) = -sTemp;
end
output=sparse(x,y,s,indexRange{2}(end),height*width);

