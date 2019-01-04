/* GCMex.cpp Version 2.3.0 
 *
 * Copyright 2009 Brian Fulkerson <bfulkers@cs.ucla.edu> 
 */

#include "mex.h"
#include "GCoptimization.h"
#include <stdlib.h>

void mexFunction(
    int		  nout, 	/* number of expected outputs */
    mxArray	  *out[],	/* mxArray output pointer array */
    int		  nin, 	/* number of inputs */
    const mxArray	  *in[]	/* mxArray input pointer array */
    )
{
   
  enum {IN_CLASS=0,IN_UNARY,IN_PAIRWISE,IN_LABELCOST,IN_EXPANSION} ;
  enum {OUT_LABELS=0, OUT_ENERGY, OUT_ENERGYAFTER} ;

  bool expansion = false;

  /****************************************************************************
   * ERROR CHECKING
   ***************************************************************************/
  if (nin != 4 && nin != 5)
    mexErrMsgTxt("Four or five arguments are required.");
  if (nin == 5)
    expansion = *mxGetPr(in[IN_EXPANSION]) > 0;
  if (nout > 3)
    mexErrMsgTxt("At most three outputs are allowed.");

  if(mxGetClassID(in[IN_CLASS]) != mxDOUBLE_CLASS)
    mexErrMsgTxt("Class must be a vector of class DOUBLE");
  if(mxGetM(in[IN_CLASS]) != 1 && mxGetN(in[IN_CLASS]) != 1)
    mexErrMsgTxt("Class must be a vector");

  if(mxGetNumberOfDimensions(in[IN_UNARY]) != 2 ||
     mxGetClassID(in[IN_UNARY]) != mxSINGLE_CLASS)
    mexErrMsgTxt("Unary term must be a matrix of class SINGLE");

  if(mxGetClassID(in[IN_LABELCOST]) != mxSINGLE_CLASS)
    mexErrMsgTxt("Labelcost term must be a matrix of class SINGLE");

  int num_labels = mxGetM(in[IN_UNARY]);
  int num_pixels = mxGetN(in[IN_UNARY]);

  if(mxGetM(in[IN_CLASS]) != num_pixels && mxGetN(in[IN_CLASS]) != num_pixels)
    mexErrMsgTxt("Class size does not match cols in Unary term.");
  if(mxGetM(in[IN_LABELCOST]) != mxGetN(in[IN_LABELCOST]) || 
     mxGetM(in[IN_LABELCOST]) != num_labels)
    mexErrMsgTxt("Labelcost is not symmetric or does not match rows in Unary term.");

  if(mxGetM(in[IN_PAIRWISE]) != num_pixels || 
     mxGetN(in[IN_PAIRWISE]) != num_pixels)
    mexErrMsgTxt("Pairwise is not symmetric or does not match cols in Unary term.");


  /* Create output arrays */
  mwSize dims[2] = {1,0};
  out[OUT_ENERGY] = mxCreateNumericArray(1, dims, mxDOUBLE_CLASS, mxREAL);
  out[OUT_ENERGYAFTER] = mxCreateNumericArray(1, dims, mxDOUBLE_CLASS, mxREAL);
  double * energy = mxGetPr(out[OUT_ENERGY]);
  double * energy_after = mxGetPr(out[OUT_ENERGYAFTER]);

  mwSize pdims[2] = {num_pixels,1};
  out[OUT_LABELS] = mxCreateNumericArray(1,pdims,mxDOUBLE_CLASS, mxREAL);
  double * labels = mxGetPr(out[OUT_LABELS]);

  /* Data costs are nlabels rows x npixels cols */
  float * data = (float *)mxGetData(in[IN_UNARY]);
  double * classes = mxGetPr(in[IN_CLASS]);

  if (num_pixels == 1) { /* one pixel is a special case */
    *energy = data[(int)classes[0]];
    int minlabel = (int)classes[0];
    double mincost  = *energy;
    for(int i = 0; i < num_labels; i++)
      if(data[i] < mincost) {
        mincost = data[i];
        minlabel = i;
      }
    labels[0] = minlabel;
    *energy_after = mincost;
    return;
  }

  /****************************************************************************
   * Setup Graph and Perform Optimization
   ***************************************************************************/
  try {
    GCoptimizationGeneralGraph * gc = new GCoptimizationGeneralGraph(num_pixels, num_labels);
 
    for (int i = 0; i < num_pixels; i++) {
      gc->setLabel(i, (int)classes[i]);
    }
    
    gc->setDataCost(data);

    /* Data costs are nlabels rows x npixels cols */
    float * labelcost = (float *)mxGetData(in[IN_LABELCOST]);
    gc->setSmoothCost(labelcost);


    /* Set spatialy varying part of the smoothness cost with the neighborhood 
     */
    mwSize total = 0;
    double * pair = mxGetPr(in[IN_PAIRWISE]);
    mwIndex * ir = mxGetIr(in[IN_PAIRWISE]);
    mwIndex * jc = mxGetJc(in[IN_PAIRWISE]);
    for (int col=0; col < num_pixels; col++) {
      mwIndex starting_row_index = jc[col];
      mwIndex stopping_row_index = jc[col+1];
      if (starting_row_index == stopping_row_index)
        continue;
      
      for (int idx = starting_row_index; idx < stopping_row_index; idx++) {
        /* only set bottom triangle of pairwise, per GC_README */
        if ( ir[idx] > col )
          gc->setNeighbors(ir[idx], col, pair[total]);
        total++;
      }
    }

    *energy = gc->compute_energy();

    /* From GC_README 
     * The expansion algorithm for energy minimization can be used whenever for
     * any 3 labels a,b,c V(a,a) + V(b,c) <= V(a,c)+V(b,a). In other words,
     * expansion algorithm can be used if the binary energy for the expansion
     * algorithm step is regular, using V. Kolmogorov's terminology.
     *
     * The swap algorithm for energy minimization can be used whenever for any 2
     * labels a,b V(a,a) + V(b,b) <= V(a,b)+V(b,a). In other words, swap
     * algorithm can be used if the binary energy for the swap algorithm step is
     * regular, using V. Kolmogorov's terminology.
     */

    if(expansion)
      gc->expansion();
    else
      gc->swap();

    *energy_after = gc->compute_energy();

    for (int i = 0; i < num_pixels; i++ )
      labels[i] = gc->whatLabel(i);

    delete gc;
  }
  catch (GCException e) {
    mexErrMsgTxt(e.message);
  }

}
