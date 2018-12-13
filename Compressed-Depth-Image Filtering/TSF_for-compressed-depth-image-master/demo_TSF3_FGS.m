% demo for " Two-stage filtering of compressed depth images with Markov Random Field"
%%
% REFER(1): Zhao, L., Bai, H., Wang, A., Zhao, Y., & Zeng, B. (2017). 
% Two-stage filtering of compressed depth images with Markov Random Field. 
% Signal Processing: Image Communication, 54, 11-22.
%%
% REDER(2): Fast Global Image Smoothing based on Weighted Least Squares
%    D. Min, S. Choi, J. Lu, B. Ham, K. Sohn, and M. N. Do,
%    IEEE Trans. Image Processing, vol. no. pp., 2014.
%%

%%  % if you use this code, please cite two paper above:
%input image(im)
im=imread('book_depth_08_41.bmp');
%filtering window size(r)
r=8;
filtered = TSF3_FGS(double(im(:,:,1)),r);
imshow([im(:,:,1) filtered])
