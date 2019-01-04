function output = ColorSmoothnessN_N(color,sigma)
%Calculate the N * N smoothness term matrix of a 3-channel color image
%Output: 
%   output      -   the output sparse matrix
%Input: 
%   color       -   Input color image
%   sigma       -   Coefficient of gaussian kernel for color similarity
%Code Author:
%   Liu Junyi, Zhejiang University
%   Mar. 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
height = size(color,1);
width = size(color,2);
color = double(color);
% 为x,y,z提前分配空间,个数为连接关系的总数,可提升运行速度,
x=zeros(1,width * (height-1) + (width-1) * height);
y=zeros(1,width * (height-1) + (width-1) * height);
s=zeros(1,width * (height-1) + (width-1) * height);
colorUp = [color;zeros(1,width,3)]; 
colorUp = colorUp(2:height+1,:,:);         % 整个矩阵上移动一行，最后一行用0填充
colorLeft = [color,zeros(height,1,3)]; 
colorLeft = colorLeft(:,2:width+1,:);      % 整个矩阵左移动一列，最后一列用0填充充
CompareColor{1}=colorUp;
CompareColor{2}=colorLeft;

rowRange{1} = 1:height-1;       %  上下连接关系的条数为 width * (height-1)
colRange{1} = 1:width;
rowRange{2} = 1:height;         %  左右连接关系的条数为 (width-1) * height
colRange{2} = 1:width-1;
indexRange{1} = 1 : width * (height-1);
indexRange{2} = width * (height-1) + 1 : width * (height-1) + (width-1) * height;
offset{1} = 1;                  %  上下连接关系的行列偏移为1
offset{2} = height;             %  左右连接关系的行列偏移为height

[mu,mv] = meshgrid(1:height, 1:width);
mu = mu';
mv = mv';
for i=1:2 % 针对四幅相减图像进行操作
    % 针对指定图像对进行像素Smoothness项的计算
    Temp1 = color(rowRange{i},colRange{i},:) - CompareColor{i}(rowRange{i},colRange{i},:);
    Temp2 = Temp1(:,:,1).^2+Temp1(:,:,2).^2+Temp1(:,:,3).^2;
    Temp3 = sqrt(exp(-1/(2*sigma^2)*Temp2));
    
    % 计算出行的位置
    muTemp = mu(rowRange{i},colRange{i});
    mvTemp = mv(rowRange{i},colRange{i});
    pu = reshape(muTemp,length(rowRange{i})*length(colRange{i}),1);
    pv = reshape(mvTemp,length(rowRange{i})*length(colRange{i}),1);
    xTemp = pu + (pv - 1) * height;
    x(indexRange{i}) = xTemp;
    
    % 通过行的位置计算出列的位置
    y(indexRange{i}) = xTemp + offset{i};
    
    % 颜色的相似度
    sTemp = reshape(Temp3,numel(Temp3),1);
    s(indexRange{i}) = sTemp;
    
end
upDiag = sparse(x,y,s,height*width,height*width);
output = upDiag' + upDiag;  % 在此并没有将对角线上的元素设为1

