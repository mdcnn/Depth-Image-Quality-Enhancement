if strcmp(computer(),'GLNXA64') || ...
   strcmp(computer(),'PCWIN64') || ...
   strcmp(computer(),'MACI64')
    mex -O -g  -largeArrayDims GCMex.cpp graph.cpp GCoptimization.cpp LinkedBlockList.cpp maxflow.cpp
else
    mex -O -g GCMex.cpp graph.cpp GCoptimization.cpp LinkedBlockList.cpp maxflow.cpp
end    
