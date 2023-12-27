# STATE-OF-THE-ART QUALITY ENHANCEMENT APPROACHES FOR DEPTH IMAGES (Updating 2023.12)

**A list of depth quality enhancement approaches and the summary of some available codes or projects.**
**This list is maintained by: [[Lijun Zhao]](https://mdcnn.github.io/).**
**If your paper about [[this topic]](https://www.researchgate.net/project/Depth-Image-Quality-Enhancement?_sg=HmdjiODaWxK16knSMpg145NO57irmDyf9eT89AvdRvGQW0PF7183AyVlmtKWRSpiWeIuHNSZiG_aqkORdaCIlJI06BW-802edcCB) is not listed among them, please contact us (leejun@tyust.edu.cn).**

**Maybe you are interested in [[Latest Image and Video Compression/Coding Resource]](https://github.com/mdcnn/Image-and-Video-Compression-Resource)**
   
# The Summary of Some Available Codes/Projects 

   * Guided Depth Map Super-resolution: A Survey[[Summary]](https://github.com/zhwzhong/Guided-Depth-Map-Super-resolution-A-Survey)

   * Depth-Enhancement-Toolbox(Thanks to Junyi Liu(Email:shshzaa@zju.edu.cn))[[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/depth-enhancement_toolbox)
   
   * A Series of Depth Image Enhancement Codes (Thanks to Yifan Zuo(Email:kenny0410@126.com))[[Code]](https://github.com/Yifan-Zuo)

   * Joint Depth Map Super-Resolution Method via Deep Hybrid-Cross Guidance Filter[[Code]](https://github.com/mdcnn/JGF2022/)
      
   * Digital Photography with Flash and No-Flash Image Pairs (Joint Bilateral Filter)[[PDF]](http://vis.berkeley.edu/papers/fnf/fnfSmall.pdf) 
   
   * Joint Bilateral Upsampling[[PDF]](http://kops.uni-konstanz.de/bitstream/handle/123456789/5563/Joint_Bilateral_Upsampling.pdf?sequence=1)
      
  * A Noise-Aware Filter for Real-Time Depth Upsampling (Noise-aware Filter)[[PDF]](https://www.ixueshu.com/document/72fc6ba0dffd13cf318947a18e7f9386.html) 
      
  * Depth Video Enhancement Based on Weighted Mode Filtering (Weight Mode Filter)[[PDF]](http://ieeexplore.ieee.org/document/5963715/) 
      
  * Guided Depth Enhancement via Anisotropic Diffusion(Anisotropic Diffusion)[[PDF]](http://link.springer.com/content/pdf/10.1007%2F978-3-319-03731-8_38.pdf) 
      
  * An Application of Markov Random Fields to Range Sensing (Markov Random Field)[[PDF]](http://www.docin.com/p-1500754906.html) 
      
  * Image and Sparse Laser Fusion for Dense Scene Reconstruction (Markov Random Field)[[PDF]](http://www.springerlink.com/index/lp737451771w1038.pdf) 
      
  * Spatial-Depth Super Resolution for Range Images (Layered Bilateral Filter)[[PDF]](http://ieeexplore.ieee.org/xpls/icp.jsp?arnumber=4270236) 

  * Robust Color Guided Depth Map Restoration[[Code]](https://github.com/wliusjtu/Robust-Color-Guided-Depth-Map-Restoration)

  * Color-Guided Depth Recovery from RGB-D Data Using an Adaptive Auto-Regressive Model[[Code]](https://github.com/wliusjtu/Color-guided-Depth-Recovery-from-RGB-D-Data-Using-an-Adaptive-Auto-regressive-Model)
   
  * Depth Map Super-Resolution by Deep Multi-Scale Guidance [[Project]](http://mmlab.ie.cuhk.edu.hk/projects/guidance_SR_depth.html) 
[[Code]](https://github.com/twhui/MSG-Net)

  * Deep Joint Image Filtering [[Project]](https://sites.google.com/site/yijunlimaverick/deepjointfilter) 
[[Code]](https://github.com/Yijunmaverick/DeepJointFilter)

   * Fast Guided Global Interpolation for Depth and Motion [[Project]](http://publish.illinois.edu/visual-modeling-and-analytics/fast-guided-global-interpolation/) 
[[Code]](https://github.com/yu-li/fgi)
      
   * Edge Guided Single Depth Image Super Resolution [[Project]](http://www.clairexie.org/depth_superresolution/index.html) 
[[Code]](https://github.com/ClaireXie/edgeGuidedSDSP)
   
   * ATGV-Net: Accurate Depth Super-Resolution [[Code]](https://github.com/griegler/primal-dual-networks)
   
   * A Deep Primal-Dual Network for Guided Depth Super-Resolution [[Code]](https://github.com/griegler/primal-dual-networks)
   
   * Patch Based Synthesis For Single Depth Image Super-Resolution[[Project]](http://visual.cs.ucl.ac.uk/pubs/depthSuperRes/) 
[[Code]](http://visual.cs.ucl.ac.uk/pubs/depthSuperRes/depthSuperRes_code.zip)

   * Simultaneous Color-Depth Super-Resolution with Conditional Generative Adversarial Networks[[Project]](https://github.com/mdcnn/CDcGAN)

   * Local Activity-Driven Structural-Preserving Filtering for Noise Removal and Image Smoothing [[Project]](https://github.com/mdcnn/Local-Activity-Driven-Filtering) [[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering)
   
   * Iterative Range-Domain Weighted Filter for Structural Preserving Image Smoothing and De-Noising [[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering)
   
   * Two-Stage Filtering of Compressed Depth Images with Markov Random Field [[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering)
   
   * Candidate Value-Based Boundary Filtering for Compressed Depth Images [[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering)
   
# A List of Depth Quality Enhancement Approaches
   
## Depth Image Super-Resolution

##### Interpretable/Explainable/Explicable Unfolding Networks
  * CDUNet[[PDF]](https://ieeexplore.ieee.org/document/10222325/): A Joint Model-Driven Unfolding Network for Degraded Low-Quality Color-Depth Images Enhancement (IEEE International Conference on Image Processing (ICIP) 2023), Lijun Zhao, Ke Wang, Jinjing Zhang, Jie Zhao, Anhong Wang.
    
  * DASU-Net[[PDF]](https://link.springer.com/chapter/10.1007/978-981-99-8549-4_19): Deep Arbitrary-Scale Unfolding Network for Color-Guided Depth Map Super-Resolution (Pattern Recognition and Computer Vision 2023), Jialong Zhang, Lijun Zhao, Jinjing Zhang, Bintao Chen, Anhong Wang.
    
  * Ex-DSRNet[[PDF]](https://ieeexplore.ieee.org/document/10219604): Explainable Unfolding Network For Joint Edge-Preserving Depth Map Super-Resolution (IEEE International Conference on Multimedia and Expo (ICME) 2023), Jialong Zhang, Lijun Zhao, Jinjing Zhang, Ke Wang, Anhong Wang.
    
  * MMNet[[PDF]](https://ieeexplore.ieee.org/document/10219604): Memory-Augmented Deep Unfolding Network for Guided Image Super-Resolution (International Journal of Computer Vision 2023), Man Zhou and Keyu Yan and Jinshan Pan and Wenqi Ren and Qi Xie and Xiangyong Cao.
    
  * LMCSC-ResNet[[PDF]](https://ieeexplore.ieee.org/document/10219604): Multimodal Deep Unfolding for Guided Image Super-Resolution (IEEE Transactions on Image Processing 2020), Iman Marivani and Evaggelia Tsiligianni and Bruno Cornelis and Nikos Deligiannis.

  * C-ISTA[[PDF]](https://ieeexplore.ieee.org/document/8682646): Coupled ISTA Network for Multi-modal Image Super-Resolution (ICASSP 2019 - 2019 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP)), Xin Deng, Pier Luigi Dragotti.

##### CNN-Based Continuous/Arbitrary-Scale DSR Methods

  * DASU-Net[[PDF]](https://link.springer.com/chapter/10.1007/978-981-99-8549-4_19): Deep Arbitrary-Scale Unfolding Network for Color-Guided Depth Map Super-Resolution (Pattern Recognition and Computer Vision 2023), Jialong Zhang, Lijun Zhao, Jinjing Zhang, Bintao Chen, Anhong Wang.

   *  GeoDSR: Learning Continuous Depth Representation via Geometric Spatial Aggregator (Proceedings of the AAAI Conference on Artificial Intelligence 2023), Wang, Xiaohang and Chen, Xuanhong and Ni, Bingbing and Tong, Zhengyan and Wang, Hang.

   * LIGF-DSR: Depth Map Continuous Super-resolution with Local Implicit Guidance Function (Displays 2023), Wang, Yuyang and Yang, Jingyu and Yue, Huanjing.
    
##### CNN-Based Fixed-Scale DSR Methods

   * JGF[[PDF]](https://www.sciencedirect.com/science/article/pii/S0031320322007397)[[Code]](https://github.com/mdcnn/JGF2022/): Joint Depth Map Super-Resolution Method via Deep Hybrid-Cross Guidance Filter (Pattern Recognition 2023), Ke Wang, Lijun Zhao, Jinjing Zhang, Jialong Zhang, Anhong Wang, Huihui Bai.

   * SSFD-DSR: Spherical Space Feature Decomposition for Guided Depth Map Super-Resolution (arXiv preprint arXiv:2303.08942), Zhao, Zixiang and Zhang, Jiangshe and Gu, Xiang and Tan, Chengli and Xu, Shuang and Zhang, Yulun and Timofte, Radu and Van Gool, Luc.

   * FCAT-DSR: Fully Cross-Attention Transformer for Guided Depth Super-Resolution (MDPI Sensors 2023), Ariav, Ido and Cohen, Israel.

   * IDFE-DSR[[PDF]](https://itiis.org/digital-library/55875): Color-Image Guided Depth Map Super-Resolution Based on Iterative Depth Feature Enhancement (KSII TRANSACTIONS ON INTERNET AND INFORMATION SYSTEMS 2023), Lijun Zhao, Ke Wang, Jinjing Zhang, Jialong Zhang, Anhong Wang.
   
   * SDMD[[PDF]](http://jdxb.bjtu.edu.cn/CN/volumn/home.shtml): Single Depth Map Denoising Method by Combining High- and Low-Frequency Decomposition and Multi-Scale Two-Level Fusion Strategy (JOURNAL OF BEIJING JIAOTONG UNIVERSITY 2023), Lijun Zhao, Ke Wang, Jinjing Zhang, Huihui Bai, Yao Zhao.

   * LGR-GSR[[PDF]](https://openaccess.thecvf.com/content/CVPR2022/papers/de_Lutio_Learning_Graph_Regularisation_for_Guided_Super-Resolution_CVPR_2022_paper.pdf): Learning Graph Regularisation for Guided Super-Resolution (IEEE/CVF Conference on Computer Vision and Pattern Recognition 2022), de Lutio, Riccardo, Alexander Becker, Stefano D'Aronco, Stefania Russo, Jan D. Wegner, and Konrad Schindler.

   * DCTN-GSR[[PDF]](https://openaccess.thecvf.com/content/CVPR2022/papers/Zhao_Discrete_Cosine_Transform_Network_for_Guided_Depth_Map_Super-Resolution_CVPR_2022_paper.pdf): Discrete Cosine Transform Network for Guided Depth Map Super-Resolution (IEEE/CVF Conference on Computer Vision and Pattern Recognition 2022), Zhao, Zixiang, Jiangshe Zhang, Shuang Xu, Zudi Lin, and Hanspeter Pfister.

   * CODON[[PDF]](https://link.springer.com/article/10.1007/s11263-021-01545-w): CODON: On Orchestrating Cross-Domain Attentions for Depth Super-Resolution (International Journal of Computer Vision 2022), Yuxiang Yang, Qi Cao, Jing Zhang, and Dacheng Tao 
   
   * DSR-SPGF[[PDF]](https://www.sciencedirect.com/science/article/pii/S0925231221006548): Depth Map Super Resolution Using Structure-Preserving Guided Filtering (IEEE Sensors Journal 2022), Khoddami, Ali Asghar, Payman Moallem, and Mohammad Kazemi

   * PDR-Net[[PDF]](https://www.sciencedirect.com/science/article/pii/S0925231222000686): PDR-Net: Progressive Depth Reconstruction Network for Color Guided Depth Map Super-Resolution (Neurocomputing 2022), Peng Liu, Zonghua Zhang, Zhaozong Meng, Nan Gao, and Chao Wang.

   * DID-DSR[[PDF]](https://www.springer.com): From Deep Image Decomposition to Single Depth Image Super-Resolution (Image and Graphics Technologies and Applications 2021), Lijun Zhao, Ke Wang, Jinjing Zhang, Huihui Bai, and Yao Zhao.

   * DAEANet[[PDF]](https://www.sciencedirect.com/science/article/pii/S0925231221006548): DAEANet: Dual Auto-Encoder Attention Network for Depth Map Super-Resolution (Neurocomputing 2021), Cao, Xiang, Yihao Luo, Xianyi Zhu, Liangqi Zhang, Yan Xu, Haibo Shen, Tianjiang Wang, and Qi Feng.

   * JIF-DSR[[PDF]](https://arxiv.org/pdf/2107.08717): Joint Implicit Image Function for Guided Depth Super-Resolution (arXiv preprint arXiv:2107.08717 2021), Tang, Jiaxiang, Xiaokang Chen, and Gang Zeng.
   
   * SCTN[[PDF]](https://arxiv.org/pdf/2104.06977.pdf): Discrete Cosine Transform Network for Guided Depth Map Super-Resolution (arXiv preprint arXiv:2104.06977 2021), Zhao, Zixiang, Jiangshe Zhang, Shuang Xu, Chunxia Zhang, and Junmin Liu.

   * TDT-DSR[[PDF]](https://ieeexplore.ieee.org/abstract/document/9428393/): Depth Super-Resolution by Texture-Depth Transformer (In 2021 IEEE International Conference on Multimedia and Expo (ICME), 2021), Yao, Chao, Shuaiyong Zhang, Mengyao Yang, Meiqin Liu, and Junpeng Qi

   * CTKT[[PDF]](https://openaccess.thecvf.com/content/CVPR2021/papers/Sun_Learning_Scene_Structure_Guidance_via_Cross-Task_Knowledge_Transfer_for_Single_CVPR_2021_paper.pdf): Learning Scene Structure Guidance via Cross-Task Knowledge Transfer for Single Depth Super-Resolution (In Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition 2021), Sun, Baoli, Xinchen Ye, Baopu Li, Haojie Li, Zhihui Wang, and Rui Xu.

   * FAR-DSR[[PDF]](http://openaccess.thecvf.com/content/CVPR2021/html/He_Towards_Fast_and_Accurate_Real-World_Depth_Super-Resolution_Benchmark_Dataset_and_CVPR_2021_paper.html): Towards Fast and Accurate Real-World Depth Super-Resolution: Benchmark Dataset and Baseline (In Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition 2021), He, Lingzhi, Hongguang Zhu, Feng Li, Huihui Bai, Runmin Cong, Chunjie Zhang, Chunyu Lin, Meiqin Liu, and Yao Zhao.

   * SCSN[[PDF]](http://faculty.dlut.edu.cn/_resources/group1/M00/00/60/ynZMg2BRVyKAOxRUACXR582FLVA369.pdf): Depth Super-Resolution via Deep Controllable Slicing Network (In Proceedings of the 28th ACM International Conference on Multimedia 2020), Ye, Xinchen, Baoli Sun, Zhihui Wang, Jingyu Yang, Rui Xu, Haojie Li, and Baopu Li.
   
   * PMBAnet[[PDF]](http://faculty.dlut.edu.cn/_resources/group1/M00/00/60/ynZMhGBQviSAUEEoAFV7yJDkjJU362.pdf)[[Code]](https://github.com/Sunbaoli/PMBANet_DSR): PMBAnet: Progressive Multi-Branch Aggregation Network for Scene Depth Super-Resolution (IEEE Transactions on Image Processing2020), Ye, Xinchen, Baoli Sun, Zhihui Wang, Jingyu Yang, Rui Xu, Haojie Li, and Baopu Li.

   * CAIRL[[PDF]](http://openaccess.thecvf.com/content_CVPR_2020/papers/Song_Channel_Attention_Based_Iterative_Residual_Learning_for_Depth_Map_Super-Resolution_CVPR_2020_paper.pdf): Channel Attention based Iterative Residual Learning for Depth Map Super-Resolution (In Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition 2020), Song, Xibin, Yuchao Dai, Dingfu Zhou, Liu Liu, Wei Li, Hongdong Li, and Ruigang Yang.

   * DU-DEAL[[PDF]](https://arxiv.org/pdf/2004.09965.pdf): Depth Upsampling Based on Deep Edge-Aware Learning (Pattern Recognition), Wang, Zhihui and Ye, Xinchen and Sun, Baoli and Yang, Jingyu and Xu, Rui and Li, Haojie.

   * WAJCSR[[PDF]](https://arxiv.org/pdf/2004.09965.pdf): Weakly Aligned Joint Cross-Modality Super Resolution (In Proceedings of the 2019 International Conference on Robotics Systems and Vehicle Technology), Shacht, Guy and Fogel, Sharon and Danon, Dov and Cohen-Or, Daniel.

   * MSDRFN[[PDF]](https://arxiv.org/pdf/2004.04788.pdf): Multi-Source Deep Residual Fusion Network for Depth Image Super-resolution (In Proceedings of the 2019 International Conference on Robotics Systems and Vehicle Technology), Hao, Xiaohui and Lu, Tao and Zhang, Yanduo and Wang, Zhongyuan and Chen, Hui.

   * RDN[[PDF]](https://www.sciencedirect.com/science/article/pii/S0020025519303913): Residual Dense Network for Intensity-Guided Depth Map Enhancement (Information Sciences 2019), Yifan Zuo, Qiang Wu, Yuming Fang, Yong Yang, Xiwu Shang, Bin Wang.
   
   * PDDSR[[PDF]](https://arxiv.org/abs/1812.09874): Perceptual Deep Depth Super-Resolution (arXiv), Oleg Voinov, Alexey Artemov, Vage Egiazarian, Alexander Notchenko, Gleb Bobrovskikh, Denis Zorin, Evgeny Burnaev.
   
   * MRGPS[[PDF]](https://ieeexplore.ieee.org/document/8703382): Depth Map Super-Resolution via Multilevel Recursive Guidance and Progressive Supervision (IEEE ACCESS 2019), Bolan Yang, Xiaoting Fan, Zexun Zheng, Xiaohuan Liu, Kaiming Zhang, Jianjun Lei.
   
   * MFR[[PDF]](https://ieeexplore.ieee.org/document/8598786): Multi-scale Frequency Reconstruction for Guided Depth Map Super-resolution via Deep Residual Network (IEEE Trans. on Circuits and Systems for Video Technology 2019), Yifan Zuo, Qiang Wu, Yuming Fang, Ping An, Liqin Huang, Zhifeng Chen.

   * CFCNS[[PDF]](https://ieeexplore.ieee.org/abstract/document/8485321): Deep Color Guided Coarse-to-Fine Convolutional Network Cascade for Depth Image Super-Resolution (IEEE Trans. on Image Processing 2019), Yang Wen, Bin Sheng, Ping Li, Weiyao Lin, David Dagan Feng.

   * DSDSR[[PDF]](https://ieeexplore.ieee.org/abstract/document/8443445): Deeply Supervised Depth Map Super-Resolution as Novel View Synthesis (IEEE Trans. on Circuits and Systems for Video Technology 2019), Xibin Song, Yuchao Dai, Xueying Qin.
   
   * DEN-EDF[[PDF]](https://ieeexplore.ieee.org/abstract/document/8461357): Depth Super-Resolution with Deep Edge-Inference Network and Edge-Guided Depth Filling (2018 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP)), Xinchen Ye, Xiangyue Duan ; Haojie Li.
   
   * CDMSR[[PDF]](https://ieeexplore.ieee.org/abstract/document/8547124): Color-Guided Depth Map Super-Resolution via Joint Graph Laplacian and Gradient Consistency Regularization (2018 IEEE 20th International Workshop on Multimedia Signal Processing (MMSP)), Rong Chen, Deming Zhai, Xianming Liu, Debin Zhao.

   * JCNP[[PDF]](https://arxiv.org/abs/1801.00968): Joint Convolutional Neural Pyramid for Depth Map Super-Resolution (arXiv.org 2018), Yi Xiao, Xiang Cao, Xianyi Zhu, Renzhi Yang, Yan Zheng.

   * SDISR[[PDF]](https://ieeexplore.ieee.org/abstract/document/8462043): Single Depth Image Super-Resolution Using Convolutional Neural Networks (ICASSP 2018), Baoliang Chen, Cheolkon Jung.

   * FDMSR[[PDF]](https://ieeexplore.ieee.org/abstract/document/8699247/references#references): Fast Depth Map Super-Resolution Using Deep Neural Network (2018 IEEE International Symposium on Mixed and Augmented Reality Adjunct (ISMAR-Adjunct)), Alisa Korinevskaya, Ilya Makarov.
   
   * CSED[[PDF]](https://link.springer.xilesou.top/chapter/10.1007/978-3-319-73603-7_8): Co-occurrent Structural Edge Detection for Color-Guided Depth Map Super-Resolution (International Conference on Multimedia Modeling 2018), Jiang Zhu, Wei Zhai, Yang Cao, Zheng-Jun Zha.
 
   * DFLLR[[PDF]](https://ieeexplore.ieee.org/document/8297047): Image Guided Depth Enhancement via Deep Fusion and Local Linear Regularizaron (IEEE International Conference on Image Processing 2017), Jiang Zhu, Jing Zhang, Yang Cao, Zengfu Wang.
   
   * GDN[[PDF]](https://ieeexplore.ieee.org/abstract/document/7952398): Guided Deep Network for Depth Map Super-Resolution: How Much Can Color Help? (ICASSP 2017), Wentian Zhou, Xin Li, Daryl Reynolds.

   * FEAG[[PDF]](https://ieeexplore.ieee.org/abstract/document/8305055): Depth Super-Resolution via Fully Edge-Augmented Guidance (IEEE Visual Communications and Image Processing 2017), Jingyu Yang, Hao Lan, Xiaolin Song, Kun Li.

   * DSR[[PDF]](https://link.springer.com/chapter/10.1007/978-3-319-54190-7_22): Deep Depth Super-Resolution: Learning Depth Super-Resolution Using Deep Convolutional Neural Network (ACCV 2016), Xibin Song, Yuchao Dai, Xueying Qin.

   * DMSG[[PDF]](https://link.springer.com/chapter/10.1007/978-3-319-46487-9_22)[[Code]](https://github.com/twhui/MSG-Net): Depth Map Super-Resolution by Deep Multi-Scale Guidance (ECCV 2016), Tak-Wai Hui, Chen Change Loy,Xiaoou Tang.

   * DJIF[[PDF]](https://link.springer.com/chapter/10.1007%2F978-3-319-46493-0_10)[[Code]](https://github.com/Yijunmaverick/DeepJointFilter): Deep Joint Image Filtering (ECCV 2016), Yijun Li, Jia-Bin Huang, Narendra Ahuja, Ming-Hsuan Yang.

   * ATGV-Net[[PDF]](https://link.springer.com/chapter/10.1007/978-3-319-46487-9_17)[[Code]](https://github.com/griegler/primal-dual-networks): ATGV-Net: Accurate Depth Super-Resolution (ECCV 2016), Gernot Riegler, Matthias Rüther, Horst Bischof.

   * DPN[[PDF]](https://arxiv.org/abs/1607.08569)[[Code]](https://github.com/griegler/primal-dual-networks): A Deep Primal-Dual Network for Guided Depth Super-Resolution (BMVC 2016), Gernot Riegler, David Ferstl, Matthias Rüther, Horst Bischof.
   
##### Traditional Methods

   * CRDA[[PDF]](https://eprints.gla.ac.uk/214086/1/214086.pdf): Coupled Real-Synthetic Domain Adaptation for Real-World Deep Depth Enhancement (IEEE Transactions on Image Processing2020), Gu, Xiao and Guo, Yao and Deligianni, Fani and Yang, Guang-Zhong.

   * RADAR[[PDF]](https://ieeexplore.ieee.org/abstract/document/8741062): RADAR: Robust Algorithm for Depth Image Super Resolution Based on FRI Theory and Multimodal Dictionary Learning (IEEE Transactions on Circuits and Systems for Video Technology 2019), Deng, Xin, Pingfan Song, Miguel RD Rodrigues, and Pier Luigi Dragotti.
   
   * P2PT[[PDF]](http://openaccess.thecvf.com/content_ICCV_2019/papers/de_Lutio_Guided_Super-Resolution_As_Pixel-to-Pixel_Transformation_ICCV_2019_paper.pdf):  Guided Super-Resolution as a Learned Pixel-to-Pixel Transformation (arXiv preprint arXiv:1904.015012019), Lutio, Riccardo de and D'aronco, Stefano and Wegner, Jan Dirk and Schindler, Konrad.
   
   * MDD-DSR[[PDF]](https://ieeexplore.ieee.org/abstract/document/8861360/): Multi-Direction Dictionary Learning Based Depth Map Super-Resolution with Autoregressive Modeling (IEEE Transactions on Multimedia 2019), Wang, Jin and Xu, Wei and Cai, Jian-Feng and Zhu, Qing and Shi, Yunhui and Yin, Baocai.

   * MDF-DSR[[PDF]](http://150.162.46.34:8080/icassp2019/ICASSP2019/pdfs/0002342.pdf): Multiscale Directional Fusion for Depth Map Super Resolution with Denoising (IEEE International Conference on Acoustics, Speech and Signal Processing2019), Xu, Dan and Fan, Xiaopeng and Zhang, Shibo and Wang, Yang and Zhao, Debin and Gao, Wen.

   * JSC-DISR[[PDF]](https://www.sciencedirect.com/science/article/abs/pii/S0167865518303222): Depth Image Super-Resolution Based on Joint Sparse Coding (Pattern Recognition Letters), Beichen Li, Yuan Zhou, Yeda Zhang, Aihua Wang.

   * TSDR[[PDF]](https://ieeexplore.ieee.org/abstract/document/8291613): Depth Super-Resolution From RGB-D Pairs With Transform and Spatial Domain Regularization (IEEE Transactions on Image Processing), Zhongyu Jiang, Yonghong Hou, Huanjing Yue, Jingyu Yang, Chunping Hou.

   * SFNM[[PDF]](https://link.springer.com/article/10.1007/s11801-018-8039-4): Depth Image Super-Resolution Algorithm Based on Structural Features and Non-Local Means (Optoelectronics Letters), Wang Jing, Wei-Zhong Zhang, Bao-Xiang Huang, Huan Yang.

   * PDSR[[PDF]](https://ieeexplore.ieee.org/abstract/document/8738841/metrics#metrics): Photometric Depth Super-Resolution (IEEE Transactions on Pattern Analysis and Machine Intelligence), Bjoern Haefner, Songyou Peng, Alok Verma, Yvain Quéau, Daniel Cremers.
   
   * SSV-DSR[[PDF]](http://openaccess.thecvf.com/content_cvpr_2018/html/Haefner_Fight_Ill-Posedness_With_CVPR_2018_paper.html): Fight Ill-Posedness With Ill-Posedness: Single-Shot Variational Depth Super-Resolution From Shading (The IEEE Conference on Computer Vision and Pattern Recognition (CVPR2018)), Bjoern Haefner, Yvain Quéau, Thomas Möllenhoff, Daniel Cremers.
   
   * AGDSR[[PDF]](https://ieeexplore.ieee.org/document/8683395/authors): Alternately Guided Depth Super-resolution Using Weighted Least Squares and Zero-order Reverse Filtering (ICASSP 2019 - 2019 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP)), Kailong Zhou, Shengtao Yu, Cheolkon Jung.

   * CGDIR[[PDF]](https://ieeexplore.ieee.org/document/8598824/): Color-Guided Depth Image Recovery with Adaptive
Data Fidelity and Transferred Graph Laplacian Regularization (IEEE Trans. on Circuits and Systems for Video Technology 2019), Yongbing Zhang, Yihui Feng, Xianming Liu, Deming Zhai, Xiangyang Ji, Haoqian Wang, and Qionghai Dai.

   * JCIER[[PDF]](https://ieeexplore.ieee.org/abstract/document/8491336): Depth Super-Resolution via Joint Color-Guided Internal and External Regularizations (IEEE Trans. on Image Processing 2019), Xianming Liu, Deming Zhai, Rong Chen, Xiangyang Ji, Debin Zhao, Wen Gao.
   
   * JG-DSR[[PDF]](https://ieeexplore.ieee.org/abstract/document/7795253): Joint-Feature Guided Depth Map Super-Resolution With Face Priors (IEEE Trans. on Cybernetics 2018), Shuai Yang, Jiaying Liu, Yuming Fang, Zongming Guo.

   * EIE[[PDF]](http://ieeexplore.ieee.org/document/8340850/): Explicit Edge Inconsistency Evaluation Model for Color-guided Depth Map Enhancement (IEEE Trans. on Circuits and Systems for Video Technology 2018), Yifan Zuo, Qiang Wu, Jian Zhang, Ping An.

   * MSF[[PDF]](http://ieeexplore.ieee.org/document/8340850/): Minimum Spanning Forest with Embedded Edge Inconsistency Measurement Model for Guided Depth Map Enhancement (IEEE Trans. Image Process. 2018), Yifan Zuo, Qiang Wu, Jian Zhang, Ping An.
   
   * MJTF[[PDF]](https://royalsocietypublishing.org/doi/full/10.1098/rsos.181074): Depth Image Super-Resolution Reconstruction Based on A Modified Joint Trilateral Filter (2018 IEEE International Symposium on Mixed and Augmented Reality Adjunct (ISMAR-Adjunct)), Dongsheng Zhou, Ruyi Wang, Xin Yang, Qiang Zhang, Xiaopeng Wei.
      
   * MRDLR[[PDF]](https://ieeexplore.ieee.org/document/8019331): Single Depth Image Super-Resolution with Multiple Residual Dictionary Learning and Refinement (ICME 2017), Lijun Zhao, Huihui Bai, Jie Liang, Anhong Wang, Yao Zhao.
   
   * VBW[[PDF]](https://ieeexplore.ieee.org/document/7457345): Variable Bandwidth Weighting for Texture Copy Artifact Suppression in Guided Depth Upsampling (IEEE Trans. on Circuits and Systems for Video Technology 2017), Wei Liu, Xiaogang Chen, Jie Yang, Qiang Wu.
   
   * IEDU[[PDF]](https://www.sciencedirect.com/science/article/pii/S1047320316302383): Intensity-Guided Edge-Preserving Depth Upsampling Through Weighted L0 Gradient Minimization (Journal of Visual Communication and Image Representation 2017), Cheolkon Jung, Shengtao Yu, Joongkyu Kim.
            
   * VSQ-SR[[PDF]](https://ieeexplore.ieee.org/abstract/document/7828010): Depth Map Super-Resolution Considering View Synthesis Quality (IEEE Trans. on Image Processing 2017), Jianjun Lei, Lele Li, Huanjing Yue, Feng Wu, Nam Ling, Chunping Hou.
   
   * FGI[[PDF]](https://www.sciencedirect.com/science/article/pii/S0031320318304175)[[Code]](https://github.com/yu-li/fgi): Fast Guided Global Interpolation for Depth and Motion (ECCV2016), Yu Li, Dongbo Min, Minh N. Do, Jiangbo Lu.
      
   * EGSR[[PDF]](https://ieeexplore.ieee.org/document/7332765)[[Code]](https://github.com/ClaireXie/edgeGuidedSDSP):Edge Guided Single Depth Image Super Resolution (IEEE Trans. Image Process. 2016), Jun Xie, Rogerio Schmidt Feris, Ming-Ting Sun.
   
   * JSRD[[PDF]](https://ieeexplore.ieee.org/abstract/document/7160743):Joint Super Resolution and Denoising From a Single Depth Image (IEEE Tran. on Multimedia 2015), Jun Xie, Rogerio Schmidt Feris, Shiaw-Shian Yu, Ming-Ting Sun.
      
   * SVAM[[PDF]](https://www.sciencedirect.com/science/article/pii/S0925231214011138): Depth Map Super-Resolution Using Stereo-Vision-Assisted Model (Neurocomputing 2015), Yuxiang Yang, Mingyu Gao, Jing Zhang, Zhengjun Zha, Zengfu Wang.

   * PS[[PDF]](http://link.springer.com/chapter/10.1007/978-3-642-33712-3_6): Patch Based Synthesis for Single Depth Image Super-Resolution (ECCV 2012), Oisin Mac, AodhaNeill D. F., CampbellArun Nair, Gabriel J. Brostow.
   
   * SDSR[[PDF]](https://ieeexplore.ieee.org/abstract/document/4270236): Spatial-Depth Super Resolution for Range Images (CVPR 2007), Qingxiong Yang, Ruigang Yang, James Davis, David Nister.
   
## Depth Image Inpainting/Completion

   * DC-AIR[[PDF]](http://openaccess.thecvf.com/content_CVPR_2020/papers/Lu_From_Depth_What_Can_You_See_Depth_Completion_via_Auxiliary_CVPR_2020_paper.pdf): From Depth What Can You See? Depth Completion via Auxiliary Image Reconstruction(In Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition 2020), Lu, Kaiyue, Nick Barnes, Saeed Anwar, and Liang Zheng.

   * JG-DRNE[[PDF]](http://openaccess.thecvf.com/content_CVPR_2020/papers/Rossi_Joint_Graph-Based_Depth_Refinement_and_Normal_Estimation_CVPR_2020_paper.pdf): Joint Graph-Based Depth Refinement and Normal Estimation(In Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition 2020), Rossi, Mattia, Mireille El Gheche, Andreas Kuhn, and Pascal Frossard. 

   * UACNN[[PDF]](http://openaccess.thecvf.com/content_CVPR_2020/papers/Eldesokey_Uncertainty-Aware_CNNs_for_Depth_Completion_Uncertainty_from_Beginning_to_End_CVPR_2020_paper.pdf): Uncertainty-Aware CNNs for Depth Completion: Uncertainty from Beginning to End (In Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition 2020), Eldesokey, Abdelrahman, Michael Felsberg, Karl Holmquist, and Michael Persson.

   * DCCS[[PDF]](https://arxiv.org/pdf/1803.08949.pdf): Deep Convolutional Compressed Sensing for Lidar Depth Completion (ACCV 2018), Chodosh, Nathaniel, Chaoyang Wang, and Simon Lucey. 

   * HQ3DR[[PDF]](https://ieeexplore.ieee.org/abstract/document/8628990): High-Quality 3D Reconstruction With Depth Super-Resolution and Completion (IEEE Access 2019), Jianwei Li, Wei Gao, Yihong Wu.

   * IDC[[PDF]](https://arxiv.org/abs/1908.08344): Indoor Depth Completion with Boundary Consistency and Self-Attention (ICCV 2019), Yu-Kai Huang, Tsung-Han Wu, Yueh-Cheng Liu, Winston H. Hsu.
   
   * EDI[[PDF]](https://www.sciencedirect.com/science/article/abs/pii/S0923596518303631): Exemplar-Based Depth Inpainting with Arbitrary-Shape Patches and Cross-Modal Matching (Signal Processing: Image Communication 2019), SenXiang, HuipingDeng, LeiZhua, Jin Wu, Li Yu.
   
   * HDMU[[PDF]](http://ieeexplore.ieee.org/document/6914600/): High-Quality Depth Map Upsampling and Completion for RGB-D Cameras (IEEE Trans. Image Process. 2014), Jaesik Park, Hyeongwoo Kim, Yu-Wing Tai, Michael S. Brown, In So Kweon.
      
## Depth Image Restoration/Enhancement

   * AMRN[[PDF]](https://ieeexplore.ieee.org/iel7/6287639/8948470/09097886.pdf): Adaptive Multi-Modality Residual Network for Compression Distorted Multi-View Depth Video Enhancement (IEEE Access 2020), Chen, Siqi, Qiong Liu, and You Yang

   * CGR-LA[[PDF]](https://link.springer.com/chapter/10.1007/978-981-10-8971-8_13): Color-Guided Restoration and Local Adjustment of Multi-resolution Depth Map (In Smart Innovations in Communication and Computational Sciences 2019), Zhang, Xingrui, Qian Guo, Yudong Guan, Jianying Feng, Chunli Ti.

   * DGR[[PDF]](https://arxiv.org/pdf/1907.02841v1.pdf): Depth Restoration: A Fast Low-Rank Matrix Completion via Dual-Graph Regularization (arXiv preprint arXiv:1907.02841 2019), Zuo, Wenxiang, Qiang Li, and Xianming Liu.

   * LD3D[[PDF]](https://ieeexplore.ieee.org/abstract/document/8327836): Depth Super-Resolution on RGB-D Video Sequences With Large Displacement 3D Motion (IEEE Transactions on Image Processing), Yucheng Wang, Jian Zhang, Zicheng Liu, Qiang Wu, Zhengyou Zhang, Yunde Jia.

   * DMR[[PDF]](https://ieeexplore.ieee.org/abstract/document/8794839): Depth Maps Restoration for Human Using RealSense (IEEE Access), Jingfang Yin, Dengming Zhu, Min Shi, Zhaoqi Wang.

   * ALNN[[PDF]](https://ieeexplore.ieee.org/abstract/document/8784833): A Lightweight Neural Network Based Human Depth Recovery Method (2019 IEEE International Conference on Multimedia and Expo (ICME)), Meiyu Huang, Xueshuang Xiang, Yao Xu, Yiqiang Chen.

   * PDUE[[PDF]](https://ieeexplore.ieee.org/document/8683638): Multiscale Directional Fusion for Depth Map Super Resolution with Denoising (ICASSP 2019 - 2019 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP)), Dan Xu, Xiaopeng Fan, Shibo Zhang, Yang Wang, Debin Zhao, Wen Gao.
   
   * PDUE[[PDF]](http://ieeexplore.ieee.org/document/8418219/): Precise Depth Map Upsampling and Enhancement Based on Edge-Preserving Fusion Filters (IET Computer Vision 2018), Ting-An Chang, Jar-Ferr Yang.
   
   * RDE[[PDF]](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=8281287): Robust Depth Enhancement Based on Texture and Depth Consistency (IET Computer Vision 2018), Ting-An Chang, Wei-Chen Liao, Jar-Ferr Yang.
   
   * DMC[[PDF]](https://ieeexplore.ieee.org/abstract/document/8354259): Depth Map Completion by Jointly Exploiting Blurry Color Images and Sparse Depth Maps (2018 IEEE Winter Conference on Applications of Computer Vision (WACV)), Liyuan Pan, Yuchao Dai, Miaomiao Liu, Fatih Porikli.
   
   * RGDR[[PDF]](https://ieeexplore.ieee.org/document/7574299)[[Code]](https://github.com/wliusjtu/Robust-Color-Guided-Depth-Map-Restoration): Robust Color Guided Depth Map Restoration (IEEE Trans. Image Process. 2017), Wei Liu, Xiaogang Chen, Jie Yang, Qiang Wu.
   
   * EDE[[PDF]](https://www.mdpi.com/1424-8220/17/7/1544/htm): Efficient Depth Enhancement Using a Combination of Color and Depth Information (Sensors 2017), Kyungja Lee, Yuseok Ban, Sangyoun Lee.
   
   * PMDIE[[PDF]](https://ieeexplore.ieee.org/abstract/document/6963273): Probabilistic Multiview Depth Image Enhancement Using Variational Inference (IEEE Journal of Selected Topics in Signal Processing 2015), Pravin Kumar Rana, Jalil Taghia, Zhanyu Ma, Markus Flierl.
      
   * LTPA[[PDF]](https://www.cv-foundation.org/openaccess/content_cvpr_2015/papers/Matsuo_Depth_Image_Enhancement_2015_CVPR_paper.pdf): Depth Image Enhancement Using Local Tangent Plane Approximations (CVPR 2015), Kiyoshi Matsuo, Yoshimitsu Aoki.
   
   * LRMC[[Project]](http://web.cecs.pdx.edu/~fliu/project/depth-enhance/)[[PDF]](https://www.cv-foundation.org/openaccess/content_cvpr_2014/papers/Lu_Depth_Enhancement_via_2014_CVPR_paper.pdf): Depth Enhancement via Low-rank Matrix Completion (CVPR 2014), Si Lu, Xiaofeng Ren, Feng Liu.
      
   * RMDE[[PDF]](https://ieeexplore.ieee.org/abstract/document/6578545): Reliability-Based Multiview Depth Enhancement Considering Interview Coherence (IEEE Trans. on Circuits and Systems for Video Technology 2014), Jinwook Choi, Dongbo Min, Kwanghoon Sohn.
      
   * WMF[[PDF]](http://ieeexplore.ieee.org/document/5963715/): Depth Video Enhancement Based on Weighted Mode Filtering (IEEE Trans. Image Process. 2012), Dongbo Min, Jiangbo Lu, Minh N. Do.
   
## Color-Depth Image Super-Resolution

   * CDcGAN[[Project]](https://github.com/mdcnn/CDcGAN)[[PDF]](https://www.sciencedirect.com/science/article/pii/S0031320318304175): Simultaneous Color-Depth Super-Resolution with Conditional Generative Adversarial Networks (Pattern Recognition 2019), Lijun Zhao, Huihui Bai, Jie Liang, Bing Zen, Anhong Wang, Yao Zhao.
   
   * MFSR[[PDF]](https://ieeexplore.ieee.org/document/8683042): Multi-frame Super-resolution for Time-of-flight Imaging (Pattern Recognition 2019), Fengqiang Li, Pablo Ruiz, Oliver Cossairt, Aggelos K. Katsaggelos.
   
   * RSR[[PDF]](https://ieeexplore.ieee.org/abstract/document/7095534): Robust Super-Resolution for Mixed-Resolution Multiview Image Plus Depth Data (IEEE Tran. on Circuits and Systems for Video Technology 2015), Thomas Richter, Jürgen Seiler, Wolfgang Schnurrer, André Kaup.
   
   * SSR[[PDF]](https://ieeexplore.ieee.org/document/6618887): Simultaneous Super-Resolution of Depth and Images Using a Single Camera (ECCV2013), Hee Seok Lee, Kuoung Mu Lee.
   
## Compressed Depth Image Filtering

##### Filtering Methods

   * CMF[[PDF]](https://ieeexplore.ieee.org/abstract/document/8449970): Cross-View Multi-Lateral Filter for Compressed Multi-View Depth Video (IEEE Transactions on Image Processing 2019), You Yang, Qiong Liu, Xin He, Zhen Liu.

   * LADF[[Free Offical PDF]](https://authors.elsevier.com/c/1Y6T-bZX4vgxi) [[Web]](https://github.com/mdcnn/Local-Activity-Driven-Filtering)[[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering): Local Activity-Driven Structural-Preserving Filtering for Noise Removal and Image Smoothing (Signal Processing 2019), Lijun Zhao, Huihui Bai, Jie Liang, Anhong Wang, Bing Zeng, Yao Zhao.
   
   * TSF[[PDF]](https://www.sciencedirect.com/science/article/pii/S0923596517300255)[[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering): Two-Stage Filtering of Compressed Depth Images with Markov Random Field (Signal Processing: Image Communication 2017), Lijun Zhao, Huihui Bai, Anhong Wang, Bing Zeng, Yao Zhao.

   * IRWF[[PDF]](http://link.springer.com/article/10.1007/s11042-017-5253-1)[[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering): Iterative Range-Domain Weighted Filter for Structural Preserving Image Smoothing and De-noising (Multimedia Tools and Applications 2017), Lijun Zhao, Huihui Bai, Anhong Wang, Bing Zeng, Yao Zhao.

   * JIGF[[PDF]](https://www.researchgate.net/publication/312304430_Joint_iterative_guidance_filtering_for_compressed_depth_images): Joint Iterative Guidance Filtering for Compressed Depth Images (Visual Communications and Image Processing (VCIP 2016), Lijun Zhao, Huihui Bai, Anhong Wang, Yao Zhao.
   
   * CCF[[PDF]](http://ieeexplore.ieee.org/abstract/document/7805550/): Cluster-Based Cross-View Filtering for Compressed Multi-View Depth Maps (Proc. Vis. Commun. Image Process. 2016), Zhen Liu, Qiong Liu, You Yang, Yuchi Liu, Gangyi Jiang, Mei Yu.
   
   * CVBF[[PDF]](http://link.springer.com/article/10.1007/s11042-017-5253-1)[[Code]](https://github.com/mdcnn/Depth-Image-Quality-Enhancement/tree/master/Compressed-Depth-Image%20Filtering): Candidate Value-Based Boundary Filtering for Compressed Depth Images (Electronics Letters 2015), Lijun Zhao, Anhong Wang, Bing Zeng, Yingchun Wu.

   * ADTF[[PDF]](http://www.sciencedirect.com/science/article/pii/S0923596514000034): Adaptive Aepth Truncation Filter for MVC Based Compressed Depth Image ( Signal Processing: Image Communication 2014), Xuyuan Xu, Lai-Man Po, Terence Chun-Ho, Cheung, Kwok-Wai Cheung, Litong Feng, Chi-Wang Ting, Ka-HoNga.
    
   * DBR[[PDF]](http://ieeexplore.ieee.org/document/6531123/): Depth Boundary Reconstruction Based on Similarity of Adjacent Pixels for Efficient 3-D Video Coding (IEEE Trans. Consum. Electron. 2013), Donghyun Kim, Seungchul Ryu, Kwanghoon Sohn.

   * JTF[[PDF]](http://proceedings.spiedigitallibrary.org/proceeding.aspx?articleid=752086): Joint Trilateral Filtering for Depth Map Compression (Proc. SPIE 2010), Shujie Liu, PoLin Lai, Dong Tian.
   
##### CNN-Based Methods

   * IFQE[[PDF]](https://ieeexplore.ieee.org/document/8553082): Information Fusion based Quality Enhancement for 3D Stereo Images Using CNN (EUSIPCO) 2018), Zhi Jin, Haili Luo, Lei Luo, Wenbin Zou, Xia Lil, Eckehard Steinbach.

   * CNNDIF[[PDF]](https://www.researchgate.net/publication/316943318_Convolutional_Neural_Network-based_Depth_Image_Artifact_Removal): Convolutional Neural Network-Based Depth Image Artifact Removal  (ICIP 2017), Lijun Zhao, Jie Liang, Huihui Bai, Anhong Wang, Yao Zhao.

   * CNNC[[PDF]](https://ieeexplore.ieee.org/abstract/document/8305150): A CNN Cascade for Quality Enhancement of Compressed Depth Images  (IEEE Visual Communications and Image Processing 2017), Zhi Jin, Lei Luo, Yi Tang, Wenbin Zou, Xia Li.

## 3D Reconstruction(with depth information)

   * RoutedFusion[[PDF]](https://ieeexplore.ieee.org/abstract/document/8305150): RoutedFusion: Learning Real-time Depth Map Fusion  (In Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition 2020), Weder, Silvan, Johannes Schonberger, Marc Pollefeys, and Martin R. Oswald.

## Review Papers
   
##### Review Papers for Depth Map Enhancement

   * DHGF2023[[PDF]](https://www.arocmag.com/article/02-2023-06-003.html): A Review of Depth Map Super-Resolution Reconstruction Research: The Latest Methods, Applications and Challenges (Application Research of Computers 2023), Lijun Zhao, Ke Wang, Jinjing Zhang, Jialong Zhang, Anhong Wang.
   
   * DMAR2020[[PDF]](https://ietresearch.onlinelibrary.wiley.com/doi/pdf/10.1049/iet-ipr.2019.1622): Depth Map Artefacts Reduction: A Review (IET Image Processing 2020),  Ibrahim, Mostafa Mahmoud and Liu, Qiong and Khan, Rizwan and Yang, Jingyu and Adeli, Ehsan and Yang, You.
   
   * DSR-CG2019[[PDF]](https://www.springerprofessional.de/depth-super-resolution-with-color-guidance-a-review/17314182): Depth Super-Resolution with Color Guidance: A Review (RGB-D Image Analysis and Processing 2019), Yang, Jingyu and Jiang, Zhongyu and Ye, Xinchen and Li, Kun.

   * ToF-Depth-Survey2017[[PDF]](https://eprints.sztaki.hu/9116/1/Eichhardt_267_3224908_ny.pdf): Image-Guided ToF Depth Upsampling: A Survey (Machine Vision and Applications 2017), Eichhardt, Ivan and Chetverikov, Dmitry and Janko, Zsolt.
   
   * Kinect-Depth-Review2014[[PDF]](https://tanwimallick.github.io/papers/kinect_noise_sensor.pdf): Characterizations of Noise In Kinect Depth Images: A Review (IEEE Sensors Journal 2014), Mallick, Tanwi and Das, Partha Pratim and Majumdar, Arun Kumar.
   
   
   
##### Review Papers about Depth Map Completion/Depth Estimation

   * 3DRecon2022[[PDF]](https://link.springer.com/chapter/10.1007/978-3-031-08819-3_17): 3D Reconstruction Based on The Depth Image: A Review (International Conference on Innovative Mobile and Internet Services in Ubiquitous Computing 2022), Mi, Qingwei and Gao, Tianhan.

   * Deep-Depth-Completion2022[[PDF]](https://www.mdpi.com/1424-8220/22/14/5353/pdf): Deep Depth Completion: A Survey ( arXiv preprint 2022), Hu, Junjie and Bao, Chenyu and Ozay, Mete and Fan, Chenyou and Gao, Qing and Liu, Honghai and Lam, Tin Lun.
   
   * Single-Depth-estimation2022[[PDF]](https://arxiv.org/pdf/2104.06456): Single Image Depth Estimation: An Overview (Digital Signal Processing 2022), Mertan, Alican and Duff, Damien Jade and Unal, Gozde.

   * Mono-Depth-Estimation2022[[PDF]](https://www.mdpi.com/1424-8220/22/14/5353/pdf): Monocular Depth Estimation Using Deep Learning: A Review (Sensors 2022), Masoumian, Armin and Rashwan, Hatem A and Cristiano, Juli{\'a}n and Asif, M Salman and Puig, Domenec.

   * Depth-Completion2018[[PDF]](https://pure.port.ac.uk/ws/portalfiles/portal/26286067/Deep_Learning_for_Monocular_Depth_Estimation_A_Review_pp.pdf): Deep Depth Completion of A Single RGB-D Image (IEEE Conference on Computer Vision and Pattern Recognition 2018), Zhang, Yinda and Funkhouser, Thomas.



## RGB-D Dataset Papers

   * RGB-D Datasets2022[[PDF]](https://arxiv.org/pdf/2201.05761): A Survey on RGB-D Datasets (arXiv preprint 2022), Lopes, Alexandre, Roberto Souza, and Helio Pedrini.
 
   * RGB-ToF-Datasets2022[[PDF]](https://arxiv.org/pdf/2209.07057.pdf): MIPI 2022 challenge on RGB+ ToF Depth Completion: Dataset and Report (arXiv preprint 2022), Sun, Wenxiu and Zhu, Qingpeng and Li, Chongyi and Feng, Ruicheng and Zhou, Shangchen and Jiang, Jun and Yang, Qingyu and Loy, Chen Change and Gu, Jinwei and Hou, Dewang and others.

   * RGB-D-D2021[[PDF]](https://openaccess.thecvf.com/content/CVPR2021/papers/He_Towards_Fast_and_Accurate_Real-World_Depth_Super-Resolution_Benchmark_Dataset_and_CVPR_2021_paper.pdf): Towards Fast and Accurate Real-World Depth Super-Resolution: Benchmark Dataset and Baseline (IEEE/CVF Conference on Computer Vision and Pattern Recognition 2021), He, Lingzhi, Hongguang Zhu, Feng Li, Huihui Bai, Runmin Cong, Chunjie Zhang, Chunyu Lin, Meiqin Liu, and Yao Zhao.

   * Kinect-Datasets2017[[PDF]](https://link.springer.com/article/10.1007/S11042-016-3374-6): RGB-D Datasets Using Microsoft Kinect or Similar Sensors: A Survey (Multimedia Tools and Applications 2017), Cai, Ziyun and Han, Jungong and Liu, Li and Shao, Ling.
   
   * NYU-v2 RGB-D Datasets2012[[PDF]](https://link.springer.com/content/pdf/10.1007/978-3-642-33715-4_54.pdf): Indoor Segmentation and Support Inference From RGB-D Images (European conference on computer vision 2012), Silberman, Nathan, Derek Hoiem, Pushmeet Kohli, and Rob Fergus.

   * Middlebury RGB-D Datasets2007[[PDF]](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/Scharstein-IJCV02.pdf): Evaluation of Cost Functions for Stereo Matching (IEEE Conference on Computer Vision and Pattern Recognition 2007), Hirschmuller, Heiko, and Daniel Scharstein.
   
   * Middlebury RGB-D Datasets2002[[PDF]](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/Scharstein-IJCV02.pdf): A Taxonomy and Evaluation of Dense Two-Frame Stereo Correspondence Algorithms (International Journal of Computer Vision 2002), Scharstein, Daniel, and Richard Szeliski.
   

   
