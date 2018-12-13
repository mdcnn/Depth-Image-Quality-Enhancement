%demo of LAD-AD for " Local Activity-Driven Structural-Preserving Filtering for Noise Removal and Image Smoothing"
%IF p=1, it is TLAD-AD;IF p=10, it is PLAD-AD;IF p=21, it is FLAD-AD;


niter=21;%iterative numner
kappa=30;%diffusion parameter
p=1;%updating intervel 
r0=1;%t_l
r1=30;%t_h
im=imread('book_depth_08_41.bmp');%input image(im)
filtered=LAD_AD(im(:,:,1), niter, kappa,p,r0,r1);
imshow([im(:,:,1) filtered])
