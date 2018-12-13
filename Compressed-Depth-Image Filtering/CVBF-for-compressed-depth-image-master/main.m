%input image(im)
im=imread('book_depth_08_41.bmp');
%filtering window radium(r)
r=8
filtered=cvbf(im(:,:,1),r);
imshow([im(:,:,1) filtered])
