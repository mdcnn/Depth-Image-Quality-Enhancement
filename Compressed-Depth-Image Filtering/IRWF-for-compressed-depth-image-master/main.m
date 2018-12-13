im=imread('book_depth_08_41.bmp');
%filtering window radium(r)
r=8;
filtered0=IRWFs(im(:,:,1),r);%skip mode
filtered1=IRWF(im(:,:,1),r);
imshow([im(:,:,1) filtered0 filtered1])
