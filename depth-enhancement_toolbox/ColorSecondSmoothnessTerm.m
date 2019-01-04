function output = ColorSecondSmoothnessTerm(color,sigma)
color=double(color);
height = size(color,1);
width = size(color,2);
Rx=zeros(1,width * height * 9);
Ry=zeros(1,width * height * 9);
RW=zeros(1,width * height * 9);
kernel = zeros(5);
kernel(3,3) = 1;
color_large = imfilter(color,kernel,'full','replicate');
precount = 1;
for i=1:height*width
    %在color图中的横纵坐标
    [x y] = ind2sub([height,width],i);
    
    x = x + 2;
    y = y + 2;
    
    Templ1 = color_large(x,y-1,:) - color_large(x,y,:);
    Templ2 = Templ1(:,:,1).^2+Templ1(:,:,2).^2+Templ1(:,:,3).^2;
    Templ13 = sqrt(exp(-1/(2*sigma^2)*Templ2));
    Tempr1 = color_large(x,y+1,:) - color_large(x,y,:);
    Tempr2 = Tempr1(:,:,1).^2+Tempr1(:,:,2).^2+Tempr1(:,:,3).^2;
    Tempr13 = sqrt(exp(-1/(2*sigma^2)*Tempr2));
    Tempu1 = color_large(x-1,y,:) - color_large(x,y,:);
    Tempu2 = Tempu1(:,:,1).^2+Tempu1(:,:,2).^2+Tempu1(:,:,3).^2;
    Tempu13 = sqrt(exp(-1/(2*sigma^2)*Tempu2));
    Tempd1 = color_large(x+1,y,:) - color_large(x,y,:);
    Tempd2 = Tempd1(:,:,1).^2+Tempd1(:,:,2).^2+Tempd1(:,:,3).^2;
    Tempd13 = sqrt(exp(-1/(2*sigma^2)*Tempd2));
    
    Templ1 = color_large(x,y-1,:) - color_large(x,y-2,:);
    Templ2 = Templ1(:,:,1).^2+Templ1(:,:,2).^2+Templ1(:,:,3).^2;
    Templ23 = sqrt(exp(-1/(2*sigma^2)*Templ2));
    Tempr1 = color_large(x,y+1,:) - color_large(x,y+2,:);
    Tempr2 = Tempr1(:,:,1).^2+Tempr1(:,:,2).^2+Tempr1(:,:,3).^2;
    Tempr23 = sqrt(exp(-1/(2*sigma^2)*Tempr2));
    Tempu1 = color_large(x-1,y,:) - color_large(x-2,y,:);
    Tempu2 = Tempu1(:,:,1).^2+Tempu1(:,:,2).^2+Tempu1(:,:,3).^2;
    Tempu23 = sqrt(exp(-1/(2*sigma^2)*Tempu2));
    Tempd1 = color_large(x+1,y,:) - color_large(x+2,y,:);
    Tempd2 = Tempd1(:,:,1).^2+Tempd1(:,:,2).^2+Tempd1(:,:,3).^2;
    Tempd23 = sqrt(exp(-1/(2*sigma^2)*Tempd2));
    
    Wmh=Templ13 * Tempr13;
    Wl =Templ23 * Templ13 * (1-Wmh);
    Wr =Tempr23 * Tempr13 * (1-Wmh);
    Wmv=Tempu13 * Tempd13;
    Wu =Tempu23 * Tempu13 * (1-Wmv);
    Wd =Tempd23 * Tempd23 * (1-Wmv);

    neighborPos = [i-height*2;i-height;i-2;i-1;i;i+1;i+2;i+height;i+height*2];
    invalid = (neighborPos > 0) & (neighborPos <= height*width);
    if(mod(neighborPos(3),height) == 0 || mod(neighborPos(3),height) == height - 1)
        invalid(3) = 0;
    end
    if(mod(neighborPos(4),height) == 0)
        invalid(4) = 0;
    end
    if(mod(neighborPos(6),height) == 1)
        invalid(6) = 0;
    end
    if(mod(neighborPos(7),height) == 1 || mod(neighborPos(7),height) == 2)
        invalid(7) = 0;
    end
    curcount = precount + sum(invalid);
    indexRange = precount: curcount - 1;
    precount = curcount;
    
    Rx(indexRange) = i;
    
    Ry(indexRange) = neighborPos(invalid);
    
    weight = [-Wl;(2*Wl+0.5*Wmh);-Wu;(2*Wu+0.5*Wmv);-1;(2*Wd+0.5*Wmv);-Wd;(2*Wr+0.5*Wmh);-Wr];
    invalidN = invalid;
    invalidN(5) = 0;
    weight(invalidN) = weight(invalidN)/sum(weight(invalidN));
    RW(indexRange) = weight(invalid);
    if(mod(i,floor(height*width/10)) == 0)
        fprintf('.');
    end
end
fprintf('\n');
Rx = Rx(1:curcount - 1);
Ry = Ry(1:curcount - 1);
RW = RW(1:curcount - 1);
output=sparse(Rx,Ry,RW,width*height,height*width);

    
    
    
    
    