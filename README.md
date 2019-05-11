# STATE-OF-THE-ART QUALITY ENHANCEMENT APPROACHES FOR DEPTH IMAGES (Updating)

**A list of depth quality enhancement approaches and the summary of some available codes or projects.**
**This list is maintained by: [[Lijun Zhao]](https://mdcnn.github.io/) (PhD candidate Beijing Jiaotong University). If your paper about [[this topic]](https://www.researchgate.net/project/Depth-Image-Quality-Enhancement?_sg=HmdjiODaWxK16knSMpg145NO57irmDyf9eT89AvdRvGQW0PF7183AyVlmtKWRSpiWeIuHNSZiG_aqkORdaCIlJI06BW-802edcCB) is not listed among them，please contact us（15112084@bjtu.edu.cn）.**
   
# The summary of some available codes or projects 

   * Depth-Enhancement-Toolbox(Thanks to Junyi Liu(Email:shshzaa@zju.edu.cn))[[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/depth-enhancement_toolbox)
      
      * Joint Bilateral Filter[[PDF]](http://vis.berkeley.edu/papers/fnf/fnfSmall.pdf) Digital photography with flash and no-flash image pairs
      * Joint Bilateral Upsampling[[PDF]](http://kops.uni-konstanz.de/bitstream/handle/123456789/5563/Joint_Bilateral_Upsampling.pdf?sequence=1) Joint bilateral upsampling
      
      * Noise-aware Filter[[PDF]](https://www.ixueshu.com/document/72fc6ba0dffd13cf318947a18e7f9386.html) A noise-aware filter for real-time depth upsampling
      
      * Weight Mode Filter[[PDF]](http://ieeexplore.ieee.org/document/5963715/) Depth video enhancement based on weighted mode filtering
      
      * Anisotropic Diffusion[[PDF]](http://link.springer.com/content/pdf/10.1007%2F978-3-319-03731-8_38.pdf) Guided Depth enhancement via Anisotropic Diffusion
      
      * Markov Random Field[[PDF]](http://www.docin.com/p-1500754906.html) An application of markov random fields to range sensing
      
      * Markov Random Field[[PDF]](http://www.springerlink.com/index/lp737451771w1038.pdf) Image and sparse laser fusion for dense scene reconstruction
      
      * Layered Bilateral Filter[[PDF]](http://ieeexplore.ieee.org/xpls/icp.jsp?arnumber=4270236) Spatial-depth super resolution for range images

   * Robust Color Guided Depth Map Restoration[[Code]](https://github.com/wliusjtu/Robust-Color-Guided-Depth-Map-Restoration)

   * Color-guided Depth Recovery from RGB-D Data Using an Adaptive Auto-regressive Model[[Code]](https://github.com/wliusjtu/Color-guided-Depth-Recovery-from-RGB-D-Data-Using-an-Adaptive-Auto-regressive-Model)
   
   * Depth Map Super-Resolution by Deep Multi-Scale Guidance [[Project]](http://mmlab.ie.cuhk.edu.hk/projects/guidance_SR_depth.html) 
[[Code]](https://github.com/twhui/MSG-Net)

   * Deep Joint Image Filtering [[Project]](https://sites.google.com/site/yijunlimaverick/deepjointfilter) 
[[Code]](https://github.com/Yijunmaverick/DeepJointFilter)

   * Fast Guided Global Interpolation for Depth and Motion [[Project]](http://publish.illinois.edu/visual-modeling-and-analytics/fast-guided-global-interpolation/) 
[[Code]](https://github.com/yu-li/fgi)
      
   * Edge guided single depth image super resolution [[Project]](http://www.clairexie.org/depth_superresolution/index.html) 
[[Code]](https://github.com/ClaireXie/edgeGuidedSDSP)
   
   * ATGV-Net: Accurate Depth Super-Resolution [[Code]](https://github.com/griegler/primal-dual-networks)
   
   * A Deep Primal-Dual Network for Guided Depth Super-Resolution [[Code]](https://github.com/griegler/primal-dual-networks)
   
   * Patch based synthesis for single depth image super-resolution[[Project]](http://visual.cs.ucl.ac.uk/pubs/depthSuperRes/) 
[[Code]](http://visual.cs.ucl.ac.uk/pubs/depthSuperRes/depthSuperRes_code.zip)

   * Simultaneous color-depth super-resolution with conditional generative adversarial networks[[Project]](https://github.com/mdcnn/CDcGAN) (including results for HR-color-image-guided depth 4X super-resolution)

   * Local Activity-Driven Structural-Preserving Filtering for Noise Removal and Image Smoothing [[Project]](https://github.com/mdcnn/Local-Activity-Driven-Filtering) [[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering)
   
   * Iterative range-domain weighted filter for structural preserving image smoothing and de-noising [[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering)
   
   * Two-stage filtering of compressed depth images with Markov Random Field [[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering)
   
   * Candidate value-based boundary filtering for compressed depth images [[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering)
   
# A list of depth quality enhancement approaches
   
## Depth Image Super-Resolution

##### CNN-based Methods

   * RDN[[PDF]](https://www.sciencedirect.com/science/article/pii/S0020025519303913): Residual dense network for intensity-guided depth map enhancement (Information Sciences 2019), Yifan Zuo, Qiang Wu, Yuming Fang, Yong Yang, Xiwu Shang, Bin Wang.
   
   * PDDSR[[PDF]](https://arxiv.org/abs/1812.09874): Perceptual deep depth super-resolution (arXiv), Oleg Voinov, Alexey Artemov, Vage Egiazarian, Alexander Notchenko, Gleb Bobrovskikh, Denis Zorin, Evgeny Burnaev.
   
   * MRGPS[[PDF]](https://ieeexplore.ieee.org/document/8703382): Depth Map Super-Resolution via Multilevel Recursive Guidance and Progressive Supervision (IEEE ACCESS 2019), Bolan Yang, Xiaoting Fan, Zexun Zheng, Xiaohuan Liu, Kaiming Zhang, Jianjun Lei.
   
   * MFR[[PDF]](https://ieeexplore.ieee.org/document/8598786): Multi-scale Frequency Reconstruction for Guided
Depth Map Super-resolution via Deep Residual Network (IEEE Trans. on Circuits and Systems for Video Technology 2019), Yifan Zuo, Qiang Wu, Yuming Fang, Ping An, Liqin Huang, Zhifeng Chen.

   * CFCNS[[PDF]](https://ieeexplore.ieee.org/abstract/document/8485321): Deep Color Guided Coarse-to-Fine Convolutional Network Cascade for Depth Image Super-Resolution (IEEE Trans. on Image Processing 2019), Yang Wen, Bin Sheng, Ping Li, Weiyao Lin, David Dagan Feng.

   * DSDSR[[PDF]](https://ieeexplore.ieee.org/abstract/document/8443445): Deeply Supervised Depth Map Super-Resolution as Novel View Synthesis (IEEE Trans. on Circuits and Systems for Video Technology 2019), Xibin Song, Yuchao Dai, Xueying Qin.

   * SDISR[[PDF]](https://ieeexplore.ieee.org/abstract/document/8462043): Single Depth Image Super-Resolution Using Convolutional Neural Networks (ICASSP 2018), Baoliang Chen, Cheolkon Jung.

   * FDMSR[[PDF]](https://ieeexplore.ieee.org/abstract/document/8699247/references#references): Fast Depth Map Super-Resolution Using Deep Neural Network (2018 IEEE International Symposium on Mixed and Augmented Reality Adjunct (ISMAR-Adjunct)), Alisa Korinevskaya, Ilya Makarov.
   
   * GDN[[PDF]](https://ieeexplore.ieee.org/abstract/document/7952398): Guided deep network for depth map super-resolution: How much can color help? (ICASSP 2017), Wentian Zhou, Xin Li, Daryl Reynolds.

   * FEAG[[PDF]](https://ieeexplore.ieee.org/abstract/document/8305055): Depth super-resolution via fully edge-augmented guidance (IEEE Visual Communications and Image Processing 2017), Jingyu Yang, Hao Lan, Xiaolin Song, Kun Li.

   * DSR[[PDF]](https://link.springer.com/chapter/10.1007/978-3-319-54190-7_22): Deep Depth Super-Resolution: Learning Depth Super-Resolution Using Deep Convolutional Neural Network (ACCV 2016), Xibin Song, Yuchao Dai, Xueying Qin.

   * DMSG[[PDF]](https://link.springer.com/chapter/10.1007/978-3-319-46487-9_22)[[Code]](https://github.com/twhui/MSG-Net): Depth Map Super-Resolution by Deep Multi-Scale Guidance (ECCV 2016), Tak-Wai Hui, Chen Change Loy,Xiaoou Tang.

   * DJIF[[PDF]](https://link.springer.com/chapter/10.1007%2F978-3-319-46493-0_10)[[Code]](https://github.com/Yijunmaverick/DeepJointFilter): Deep Joint Image Filtering (ECCV 2016), Yijun Li, Jia-Bin Huang, Narendra Ahuja, Ming-Hsuan Yang.

   * ATGV-Net[[PDF]](https://link.springer.com/chapter/10.1007/978-3-319-46487-9_17)[[Code]](https://github.com/griegler/primal-dual-networks): ATGV-Net: Accurate Depth Super-Resolution (ECCV 2016), Gernot Riegler, Matthias Rüther, Horst Bischof.

   * DPN[[PDF]](https://arxiv.org/abs/1607.08569)[[Code]](https://github.com/griegler/primal-dual-networks): A Deep Primal-Dual Network for Guided Depth Super-Resolution (BMVC 2016), Gernot Riegler, David Ferstl, Matthias Rüther, Horst Bischof.
   
##### Traditional Methods

   * AGDSR[[PDF]](https://ieeexplore.ieee.org/document/8683395/authors): Alternately Guided Depth Super-resolution Using Weighted Least Squares and Zero-order Reverse Filtering (ICASSP 2019 - 2019 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP)), Kailong Zhou, Shengtao Yu, Cheolkon Jung.

   * CGDIR[[PDF]](https://ieeexplore.ieee.org/document/8598824/): Color-Guided Depth Image Recovery with Adaptive
Data Fidelity and Transferred Graph Laplacian Regularization (IEEE Trans. on Circuits and Systems for Video Technology 2019), Yongbing Zhang, Yihui Feng, Xianming Liu, Deming Zhai, Xiangyang Ji, Haoqian Wang, and Qionghai Dai

   * JCIER[[PDF]](https://ieeexplore.ieee.org/abstract/document/8491336): Depth Super-Resolution via Joint Color-Guided Internal and External Regularizations (IEEE Trans. on Image Processing 2019), Xianming Liu, Deming Zhai, Rong Chen, Xiangyang Ji, Debin Zhao, Wen Gao.
   
   * JG-DSR[[PDF]](https://ieeexplore.ieee.org/abstract/document/7795253): Joint-Feature Guided Depth Map Super-Resolution With Face Priors (IEEE Trans. on Cybernetics 2018), Shuai Yang, Jiaying Liu, Yuming Fang, Zongming Guo.

   * EIE[[PDF]](http://ieeexplore.ieee.org/document/8340850/): Explicit Edge Inconsistency Evaluation Model for Color-guided Depth Map Enhancement (IEEE Trans. on Circuits and Systems for Video Technology 2018), Yifan Zuo, Qiang Wu, Jian Zhang, Ping An.

   * MSF[[PDF]](http://ieeexplore.ieee.org/document/8340850/): Minimum spanning forest with embedded edge inconsistency measurement model for guided depth map enhancement (IEEE Trans. Image Process. 2018), Yifan Zuo, Qiang Wu, Jian Zhang, Ping An.
   
   * MJTF[[PDF]](https://royalsocietypublishing.org/doi/full/10.1098/rsos.181074): Depth image super-resolution reconstruction based on a modified joint trilateral filter (2018 IEEE International Symposium on Mixed and Augmented Reality Adjunct (ISMAR-Adjunct)), Dongsheng Zhou, Ruyi Wang, Xin Yang, Qiang Zhang, Xiaopeng Wei.
      
   * MRDLR[[PDF]](https://ieeexplore.ieee.org/document/8019331): Single depth image super-resolution with multiple residual dictionary learning and refinement (ICME 2017), Lijun Zhao, Huihui Bai, Jie Liang, Anhong Wang, Yao Zhao.
   
   * VBW[[PDF]](https://ieeexplore.ieee.org/document/7457345): Variable Bandwidth Weighting for Texture Copy Artifact Suppression in Guided Depth Upsampling (IEEE Trans. on Circuits and Systems for Video Technology 2017), Wei Liu, Xiaogang Chen, Jie Yang, Qiang Wu.
   
   * IEDU[[PDF]](https://www.sciencedirect.com/science/article/pii/S1047320316302383): Intensity-guided edge-preserving depth upsampling through weighted L0 gradient minimization (Journal of Visual Communication and Image Representation 2017), Cheolkon Jung, Shengtao Yu, Joongkyu Kim.
            
   * VSQ-SR[[PDF]](https://ieeexplore.ieee.org/abstract/document/7828010): Depth Map Super-Resolution Considering View Synthesis Quality (IEEE Trans. on Image Processing 2017), Jianjun Lei, Lele Li, Huanjing Yue, Feng Wu, Nam Ling, Chunping Hou.
   
   * FGI[[PDF]](https://www.sciencedirect.com/science/article/pii/S0031320318304175)[[Code]](https://github.com/yu-li/fgi): Fast Guided Global Interpolation for Depth and Motion (ECCV2016), Yu Li, Dongbo Min, Minh N. Do,Jiangbo Lu.
      
   * EGSR[[PDF]](https://ieeexplore.ieee.org/document/7332765)[[Code]](https://github.com/ClaireXie/edgeGuidedSDSP):Edge guided single depth image super resolution (IEEE Trans. Image Process. 2016), Jun Xie, Rogerio Schmidt Feris, Ming-Ting Sun.
   
   * JSRD[[PDF]](https://ieeexplore.ieee.org/abstract/document/7160743):Joint Super Resolution and Denoising From a Single Depth Image (IEEE Tran. on Multimedia 2015), Jun Xie, Rogerio Schmidt Feris, Shiaw-Shian Yu, Ming-Ting Sun.
      
   * SVAM[[PDF]](https://www.sciencedirect.com/science/article/pii/S0925231214011138): Depth map super-resolution using stereo-vision-assisted model (Neurocomputing 2015), Yuxiang Yang, Mingyu Gao, Jing Zhang, Zhengjun Zha, Zengfu Wang.
      
   * HDMU[[PDF]](http://ieeexplore.ieee.org/document/6914600/): High-Quality Depth Map Upsampling and Completion for RGB-D Cameras (IEEE Trans. Image Process. 2014), Jaesik Park, Hyeongwoo Kim, Yu-Wing Tai, Michael S. Brown, In So Kweon.

   * PS[[PDF]](http://link.springer.com/chapter/10.1007/978-3-642-33712-3_6): Patch based synthesis for single depth image super-resolution (ECCV 2012), Oisin Mac, AodhaNeill D. F., CampbellArun Nair,, Gabriel J. Brostow.
   
   * SDSR[[PDF]](https://ieeexplore.ieee.org/abstract/document/4270236): Spatial-Depth Super Resolution for Range Images (CVPR 2007), Qingxiong Yang, Ruigang Yang, James Davis, David Nister.
      
## Depth Image Restoration/Enhancement

   * PDUE[[PDF]](http://ieeexplore.ieee.org/document/8418219/): Precise depth map upsampling and enhancement based on edge-preserving fusion filters (IET Computer Vision 2018), Ting-An Chang, Jar-Ferr Yang.
   
   * RDE[[PDF]](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=8281287): Robust depth enhancement based on texture and depth consistency (IET Computer Vision 2018), Ting-An Chang, Wei-Chen Liao, Jar-Ferr Yang.

   * RGDR[[PDF]](https://ieeexplore.ieee.org/document/7574299)[[Code]](https://github.com/wliusjtu/Robust-Color-Guided-Depth-Map-Restoration): Robust Color Guided Depth Map Restoration (IEEE Trans. Image Process. 2017), Wei Liu, Xiaogang Chen, Jie Yang, Qiang Wu.
   
   * EDE[[PDF]](https://www.mdpi.com/1424-8220/17/7/1544/htm): Efficient Depth Enhancement Using a Combination of Color and Depth Information (Sensors 2017), Kyungja Lee, Yuseok Ban, Sangyoun Lee.
   
   * PMDIE[[PDF]](https://ieeexplore.ieee.org/abstract/document/6963273): Probabilistic Multiview Depth Image Enhancement Using Variational Inference (IEEE Journal of Selected Topics in Signal Processing 2015), Pravin Kumar Rana, Jalil Taghia, Zhanyu Ma, Markus Flierl.
      
   * LTPA[[PDF]](https://www.cv-foundation.org/openaccess/content_cvpr_2015/papers/Matsuo_Depth_Image_Enhancement_2015_CVPR_paper.pdf): Depth Image Enhancement Using Local Tangent Plane Approximations (CVPR 2015), Kiyoshi Matsuo, Yoshimitsu Aoki.
   
   * LRMC[[Project]](http://web.cecs.pdx.edu/~fliu/project/depth-enhance/)[[PDF]](https://www.cv-foundation.org/openaccess/content_cvpr_2014/papers/Lu_Depth_Enhancement_via_2014_CVPR_paper.pdf): Depth Enhancement via Low-rank Matrix Completion (CVPR 2014), Si Lu, Xiaofeng Ren, Feng Liu.
      
   * RMDE[[PDF]](https://ieeexplore.ieee.org/abstract/document/6578545): Reliability-Based Multiview Depth Enhancement Considering Interview Coherence (IEEE Trans. on Circuits and Systems for Video Technology 2014), Jinwook Choi, Dongbo Min, Kwanghoon Sohn.
      
   * WMF[[PDF]](http://ieeexplore.ieee.org/document/5963715/): Depth video enhancement based on weighted mode filtering (IEEE Trans. Image Process. 2012), Dongbo Min, Jiangbo Lu, Minh N. Do.
   
## Color-Depth Image Super-Resolution

   * CDcGAN[[Project]](https://github.com/mdcnn/CDcGAN)[[PDF]](https://www.sciencedirect.com/science/article/pii/S0031320318304175): Simultaneous color-depth super-resolution with conditional generative adversarial networks (Pattern Recognition 2019), Lijun Zhao, Huihui Bai, Jie Liang, Bing Zen, Anhong Wang, Yao Zhao.
   
   * RSR[[PDF]](https://ieeexplore.ieee.org/abstract/document/7095534): Robust Super-Resolution for Mixed-Resolution Multiview Image Plus Depth Data (IEEE Tran. on Circuits and Systems for Video Technology 2015), Thomas Richter, Jürgen Seiler, Wolfgang Schnurrer, André Kaup.
   
   * SSR[[PDF]](https://ieeexplore.ieee.org/document/6618887): Simultaneous Super-Resolution of Depth and Images Using a Single Camera (ECCV2013), Hee Seok Lee, Kuoung Mu Lee.
   
## Compressed Depth Image Filtering

##### Filtering Methods

   * CMF[[PDF]](https://ieeexplore.ieee.org/abstract/document/8449970): Cross-View Multi-Lateral Filter for Compressed Multi-View Depth Video (IEEE Transactions on Image Processing 2019), You Yang, Qiong Liu, Xin He, Zhen Liu.

   * LADF[[Free Offical PDF]](https://authors.elsevier.com/c/1Y6T-bZX4vgxi) [[Web]](https://github.com/mdcnn/Local-Activity-Driven-Filtering)[[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering): Local Activity-Driven Structural-Preserving Filtering for Noise Removal and Image Smoothing (Signal Processing 2019), Lijun Zhao, Huihui Bai, Jie Liang, Anhong Wang, Bing Zeng, Yao Zhao.
   
   * TSF[[PDF]](https://www.sciencedirect.com/science/article/pii/S0923596517300255)[[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering): Two-stage filtering of compressed depth images with Markov Random Field (Signal Processing: Image Communication 2017), Lijun Zhao, Huihui Bai, Anhong Wang, Bing Zeng, Yao Zhao.

   * IRWF[[PDF]](http://link.springer.com/article/10.1007/s11042-017-5253-1)[[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering): Iterative range-domain weighted filter for structural preserving image smoothing and de-noising (Multimedia Tools and Applications 2017), Lijun Zhao, Huihui Bai, Anhong Wang, Bing Zeng, Yao Zhao.

   * JIGF[[PDF]](https://www.researchgate.net/publication/312304430_Joint_iterative_guidance_filtering_for_compressed_depth_images): Joint iterative guidance filtering for compressed depth images (Visual Communications and Image Processing (VCIP 2016), Lijun Zhao, Huihui Bai, Anhong Wang, Yao Zhao.
   
   * CCF[[PDF]](http://ieeexplore.ieee.org/abstract/document/7805550/): Cluster-based cross-view filtering for compressed multi-view depth maps (Proc. Vis. Commun. Image Process. 2016), Zhen Liu, Qiong Liu, You Yang, Yuchi Liu, Gangyi Jiang, Mei Yu.
   
   * CVBF[[PDF]](http://link.springer.com/article/10.1007/s11042-017-5253-1)[[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering): Candidate value-based boundary filtering for compressed depth images (Electronics Letters 2015), Lijun Zhao, Anhong Wang, Bing Zeng, Yingchun Wu.

   * ADTF[[PDF]](http://www.sciencedirect.com/science/article/pii/S0923596514000034)[[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering): Adaptive depth truncation filter for MVC based compressed depth image ( Signal Processing: Image Communication 2014), Xuyuan Xu, Lai-Man Po, Terence Chun-Ho, Cheung, Kwok-Wai Cheung, Litong Feng, Chi-Wang Ting, Ka-HoNga.
    
   * DBR[[PDF]](http://ieeexplore.ieee.org/document/6531123/): Depth boundary reconstruction based on similarity of adjacent pixels for efficient 3-D video coding (IEEE Trans. Consum. Electron. 2013), Donghyun Kim, Seungchul Ryu, Kwanghoon Sohn.

   * JTF[[PDF]](http://proceedings.spiedigitallibrary.org/proceeding.aspx?articleid=752086): Joint trilateral filtering for depth map compression (Proc. SPIE 2010), Shujie Liu, PoLin Lai, Dong Tian.
   
##### CNN-based Methods

   * IFQE[[PDF]](https://ieeexplore.ieee.org/document/8553082): Information Fusion based Quality Enhancement for 3D Stereo Images Using CNN (EUSIPCO) 2018), Zhi Jin, Haili Luo, Lei Luo, Wenbin Zou, Xia Lil, Eckehard Steinbach.

   * CNNDIF[[PDF]](http://link.springer.com/article/10.1007/s11042-017-5253-1): Convolutional Neural Network-based Depth Image Artifact  (ICIP 2017), Lijun Zhao, Jie Liang, Huihui Bai, Anhong Wang, Yao Zhao.

   * CNNC[[PDF]](https://ieeexplore.ieee.org/abstract/document/8305150): A CNN cascade for quality enhancement of compressed depth images  (IEEE Visual Communications and Image Processing 2017), Zhi Jin, Lei Luo, Yi Tang, Wenbin Zou, Xia Li.






