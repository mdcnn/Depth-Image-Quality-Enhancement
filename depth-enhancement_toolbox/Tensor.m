function T2=Tensor(color,lamda)
    height = size(color,1);
    width = size(color,2);
    tic;
    color = double(color);
    [Ix,Iy]=gradient(color);
    Ix=sqrt(Ix(:,:,1).^2+Ix(:,:,2).^2+Ix(:,:,3).^2);
    Iy=sqrt(Iy(:,:,1).^2+Iy(:,:,2).^2+Iy(:,:,3).^2);
    fprintf('    The running time of computing Ix,Iy is %.5f s\n',toc)
    tic;
    % Generate Tensor
    V=cell(height,width);
    T1=cell(height,width);
    T2=cell(height,width);
    for i=1:width     
        for j=1:height     
            V(j,i)={[Ix(j,i);Iy(j,i);lamda*color(j,i,1);lamda*color(j,i,2);lamda*color(j,i,3)]};%
            T1(j,i)={V{j,i}*V{j,i}'+diag(exp(-20)*ones(5,1))}; % % Here the correction term has effects on the upsampling result
        end
    end
    % Gaussian Filter
    sigma_w = 0.8;
    w = 2 ;
    G=fspecial('gaussian',[2*w + 1,2*w + 1],sigma_w);
    
    for i=1:height    
        for j=1:width
            F = zeros(5,5);
            iMin = max(i-w,1);
            iMax = min(i+w,height);
            jMin = max(j-w,1);
            jMax = min(j+w,width);
            TTemp = T1(iMin:iMax,jMin:jMax);
            GTemp = G((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
            w_i = iMax-iMin+1;
            w_j = jMax-jMin+1;
            for m=1:w_i
                for n=1:w_j
                    F = F + TTemp{m,n}.*GTemp(m,n);
                end
            end
            T2(i,j)={F/sum(GTemp(:))};
        end
    end
    TensorTime=toc;
    fprintf('    The running time of generating tensors is %.5f s\n',TensorTime)
end