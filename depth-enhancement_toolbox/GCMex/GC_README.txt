#########################################################################
#                                                                       #
#    GC_optimization - software for energy minimization with graph cuts #
#                        Version 2.3                                    #
#    http://www.csd.uwo.ca/faculty/olga/software.html                   #
#                                                                       #
#    Copyright 2007 Olga Veksler (olga@csd.uwo.ca)                      #
#                                                                       #
#    I would like to thank Andrew Delong for his invaluable help        #
#    with C++ when redesigning the GC interface.  Thank you for         #
#    helping me to make my code 5 times shorter and 100 times more      #
#    debuggable. And not for scaring me with DLL's :)                   #
#########################################################################

/* email olga@csd.uwo.ca for any questions, suggestions and bug reports 
 
 /*****************    IMPORTANT!!!!!!!!!!!***********************************************************

  If you use this software, YOU HAVE TO REFERENCE (at least) 3 papers, the citations [1]
  [2] and [3] below

/****************************************************************************************************/
/*


1. Introduction.



	This software library implements the Graph Cuts Energy Minimization methods
	described in 
	
	  
		[1] Efficient Approximate Energy Minimization via Graph Cuts 
		    Yuri Boykov, Olga Veksler, Ramin Zabih, 
		    IEEE transactions on PAMI, vol. 20, no. 12, p. 1222-1239, November 2001. 


    
	This software can be used only for research purposes, you should cite
	the aforementioned paper in any resulting publication.
	If you wish to use this software (or the algorithms described in the aforementioned paper)
	for commercial purposes, you should be aware that there is a US patent: 

		R. Zabih, Y. Boykov, O. Veksler, 
		"System and method for fast approximate energy minimization via graph cuts ", 
		United Stated Patent 6,744,923, June 1, 2004



/* Together with the library implemented by O. Veksler, we provide, with the permission of the
    V. Kolmogorov and Y. Boykov the following libraries:  

  
1)	energy.h, which was developed by Vladimir Kolmogorov and  implements binary energy minimization 
	technique described in

	[2] What Energy Functions can be Minimized via Graph Cuts?
	    Vladimir Kolmogorov and Ramin Zabih. 
	    To appear in IEEE Transactions on Pattern Analysis and Machine Intelligence (PAMI). 
	    Earlier version appeared in European Conference on Computer Vision (ECCV), May 2002. 


	We use "energy.h" to implement the binary energy minimization step
	for the alpha-expansion and swap algorithms. The graph construction provided by "energy.h" is
	more efficient (and slightly more general) than the original graph construction for the 
	alpha-expansion algorithm in the paper cited as [1]
	

	This software can be used only for research purposes. IF YOU USE THIS SOFTWARE,
	YOU SHOULD CITE THE AFOREMENTIONED PAPER [2] IN ANY RESULTING PUBLICATION.

	

2) 	graph.h, block.h, maxflow.cpp
	
	This software library implements the maxflow algorithm
	described in

		[3] An Experimental Comparison of Min-Cut/Max-Flow Algorithms
		    for Energy Minimization in Vision.
		    Yuri Boykov and Vladimir Kolmogorov.
		    In IEEE Transactions on Pattern Analysis and Machine Intelligence (PAMI), 
		    September 2004

	This algorithm was developed by Yuri Boykov and Vladimir Kolmogorov
	at Siemens Corporate Research. To make it available for public use,
	it was later reimplemented by Vladimir Kolmogorov based on open publications.

	If you use this software for research purposes, you should cite
	the aforementioned paper in any resulting publication. 
*/

/* These 4 files (energy.h,graph.h, block.h, maxflow.cpp) are included in the curent library with permission of
Vladimir Kolmogorov and Yuri Boykov. 
The can  also be downloaded independently from Vladimir Kolmogorov's
website: http://www.adastral.ucl.ac.uk/~vladkolm/software.html


Tested under windows, Visual C++ 7.1 compiler 

##################################################################

2. License.

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA



##################################################################

3. Energy Minimization

This software is for minimizing energy functions of the form:

E(l) = sum_p D(p,l_p)  + sum_{p,q} Vpq(l_p,l_q)

Here we have a finite set of sites (or pixels) P and a finite set of labels L.
A labeling l is assignments of labels in L to pixels in P. The individual pixels 
are referred to with small letters p and q, label of pixel p is denoted by l_p,
and the set of all label-pixel assignments is denoted by l, that is
l = {l_p | p in P}.

The first term in the energy function E(l) is typically called the data term, and
it consists of the sum over all pixels p of the penalty(or cost) D(p,l_p), what
should be the cost of assigning label l_p to pixel p.  D(p,l_p) can be arbitrary.

The second term is a sum over all pairs of neighboring pixels {p,q}. 
That is there is a neighborhood relation on the set of pixels (this relationship
is symmetric, that is if p is a neighbor of q then q is a neighbor of p).
Here we assume that the neighbor pairs are unordered. This means that if pixels p and q are 
neighbors, then there is either Vpq(l_p,l_q) in the second sum of the energy,
or Vqp(l_q,l_p), but not both. This is not a restriction, since in practice, one can always go
from the ordered energy to the unordered one.  This second term is typically called the smoothness
term.

The expansion algorithm for energy minimization can be used whenever for any 3 labels a,b,c
V(a,a) + V(b,c) <= V(a,c)+V(b,a). In other words, expansion algorithm can be used if
the binary energy for the expansion algorithm step is regular, using V. Kolmogorov's terminology.

The swap algorithm for energy minimization can be used whenever for any 2 labels a,b
V(a,a) + V(b,b) <= V(a,b)+V(b,a). In other words, swap algorithm can be used if
the binary energy for the swap algorithm step is regular, using V. Kolmogorov's terminology.

##################################################################

4. Datatypes

a) EnergyTermType. This is the type for each individual energy term,
that is for the terms D and V.   By default, it  is set to int.  
To change it, go into file "graph.h"  and modify the statement

"typedef int captype;"   from short to any desired type.  


b) EnergyType. This is the type for the total energy (for the sum of all
the D and V terms).    By default, it  is set to int. To change it, go into file "graph.h"  
and change the statement "typedef int flowtype;" to any desired type.  Be very careful to 
avoid overflow if you change this type.
The sum of many terms of type EnergyTermType shouldn't overflow the EnergyType.


c) LabelID, is the type to use for the label names. Currently set to integers. In order
to save space, you may want to change it to char or short. Can be also set to long,
but not to float or double.  To change this type, go to "GCoptimization.h"

typedef int LabelID;

d) SiteID: the type to use for site (pixel) names.  Currently set to integers. For
smaller problems, to save space, you may want to change it to  short. Can be also set to long,
but not to float or double.  To change this type, go to "GCoptimization.h"
	
/* Type for site (pixe). Can be set to short, int, long */ 
typedef int SiteID



###########################################################################


5. Specifying the energy

Before optimizing the energy, one has to specify it, that is specify the number of
labels, number of pixels, neighborhood system, the data terms, and the smoothness terms.
There are 2  constructors to use, one in case of the grid graph, and another in case
of a general graph.
In all cases, it is assumed that the sites go between 0...num_sites-1, 
and labels go between  0....num_labels-1.
For a grid (4-connected) graph, site at coordinates (x,y) is numbered with x+y*width, where width
is the width of the grid, that is the row-major ordering of arrays is assumed. 
________________________________________________________________________________________________

Constructor A.

GCoptimizationGridGraph(int width, int height,int num_labels);

Use this constructor only for grid of size width by height.  If you use this constructor, 
4 connected grid neigbhorhood structure is assumed, so you don't need to specify neighborhood
structure separately (and indeed cannot do so). 
_______________________________________________________________________________________________

Constructor B.

GCoptimizationGeneralGraph(int num_sites,int num_labels);


Use this constructor for general graphs.  If you use this constructor, you must setup up
neighborhood system using function. You can either specify neighbors individually or all at once.

i) setNeighbors(SiteID s1, SiteID s2, EnergyTermType weight=1);
Specifies neighbors individually. You must call this function exactly once  for any 
pair of neighboring sites s1 and s2. That is if you call setNeighbors(s1,s2) then you should not call 
setNeighbors(s2,s1).   If Vpq(l_p,l_q) = V(l_p,l_q)*w_pq, where V(l_p,l_q) is some function that
depends only on the labels l_p,l_q, then specify w_pq by using: setNeighbors(p,q,w_pq). 

ii) To pass in all neighbor information at once, use function:

void setAllNeighbors(SiteID *numNeighbors,SiteID **neighborsIndexes,EnergyTermType **neighborsWeights);
Here:
    (a) numNeighbors is an array of size num_sites, and numNeighbors[i] is the number of neighbors for site i
    (b) neighborIndexes is an array of size num_pixels which stores of pointers. Namely, 
	neighborsIndexes[i] is a pointer to the array storing the sites which are neighbors to site i

    (c) neighborWeights is an array of size num_sites, and neighborWeighs[i] is a pointer to array 
        storing the weights between site i and its neighbors in the same order as neighborIndexes[i] 
        stores the indexes of neighbors. Example: if sites i and j are neighbors, then 
        for some k and m, neighborsIndexes[i][k] == j and neighborsIndexes[j][m] = i. Then
        neighborWeights[i][k] = w_ij and neighborWeights[j][m] = w_ij, where w_ij is the weight
        betwen neighbors i and j, that is V_ij = w_ij *V(l_i,l_j)


_______________________________________________________________________________________________


6. Setting the data and smoothness terms.

I have provided many functions to set up data and smooth costs. Any setDataCost() function can
be used with any setSmoothCost() function. 
setSmoothCostVH() can only be used with a GridGraph, due to the special structure of the input
parameters that only make sense for a grid graph.


------------------------dataCostSetup-----------------------
         
(a) void setDataCost(EnergyTermType *dataArray);
	dataArray is an array s.t. the data cost for pixel p and  label l is stored at                        
	dataArray[pixel*num_labels+l].  If the current neighborhood system is a grid, then                    
        the data term for label l and pixel with coordinates (x,y) is stored at                               
	dataArray[(x+y*width)*num_labels + l]. Thus the size of array dataArray is num_pixels*num_labels.
        Can call this function only one time. 

(b) void setDataCost(DataCostFn fn); 
	DataCostFn is a pointer to a function  f(Pixel p, Label l), s.t. the data cost for pixel p to have      
	label l  is given by f(p,l). Can call this function only one time.

(c) void setDataCost(DataCostFnExtra fn,void *extraData);
	DataCostFnExtra is a pointer to a function  f(SiteID p, LabelID l,void *extraData), s.t. the data 
        cost for pixel p to have label l  is given by f(p,l,extraData).  Can call this function only one time.


(d) void setDataCost(SiteID s, LabelID l, EnergyTermType e); 
	sets up D(s,l) = 3; You must call this function for each pixel and each label.


(e) void setDataCostFunctor(DataCostFunctor* f);

         Experienced C++ users can subclass our DataCostFunctor base class to achieve
         a similar functionality as (b) or (c) above. By overriding the compute() method 
         of DataCostFunctor, your compute() method will be called by the GCoptimization
         class each time a data penalty must be computed.

------------------------smoothCostSetup-----------------------


(a) void setSmoothCost(EnergyTermType *V)
         V is an array of smoothness costs, such that V_pq(label1,label2)  is stored at V[label1+num_labels*label2]        
	 If graph is a grid, then using this  function only if the smooth costs are not spacially varying    
	 that is the smoothness penalty V depends only on labels, but not on sites.  If the graph is 
         not a grid, then you can specify spacially varying coefficients w_pq when you set up the
         neighborhood system using setNeighbor(p,q,w_pq) function. In this case, 
         V_pq(label1,label2) =  V[label1+num_labels*label2]*w_pq. This function can be called only one time.                            
	 

(b) void setSmoothCost(SmoothCostFn fn);

         fn is pointer to a function f(s1,s2,l1,l2) such that smoothness penalty for neigboring sites     
	 s1 and s2 to  have labels, respectively, l1 and l2 is f(s1,s2,l1,l2). This function can be 
         called only one time.         

(c) void setSmoothCost(SmoothCostFnExtra fn,void *extraData);	

         Same as above, but can pass an extra pointer to the data needed for computation

(d) void setSmoothCost(LabelID l1, LabelID l2, EnergyTermType e)

         sets up V(l1,l2) = e. Must call this function for each pair of labels (l1,l2). Notice
         that for any l1 and l2, you must call this function on (l1,l2) AND (l2,l1).
         V(l1,l2) has to be equal to V(l2,l1) in this case.


(e) void setSmoothCostVH(EnergyTermType *V, EnergyTermType *vCosts, EnergyTermType *hCosts);

	 This function should be used only if the graph is a grid (GCGridGraph constructor is used).
         Array V is the same as above, under (a).
         Arrays hCosts and vCosts have the same size as the image (that is width*height), and are used to set
         the spatially varying coefficients w_pq. If p = (x,y) and q = (x+1,y), then 
         w_pq =  hCosts[x+y*width], and so the smoothness penalty for pixels (x,y) and (x+1,y) to have labels       
	 label1 and label2, that is V_pq(label1,label2) = V[label1+num_labels*label2]*hCosts[x+y*width]
         If p = (x,y) and q = (x,y+q), then 
         w_pq =  vCosts[x+y*width], and so the smoothness penalty for pixels (x,y) and (x,y+1) to have labels       
	  label1 and label2, that is V_pq(label1,label2) = V[label1+num_labels*label2]*vCosts[x+y*width]
         This function can be only called one time.


(f) void setSmoothCostFunctor(SmoothCostFunctor* f);

         Experienced C++ users can subclass our SmoothCostFunctor base class to achieve
         a similar functionality as (b) or (c) above. By overriding the compute() method 
         of SmoothCostFunctor, your compute() method will be called by the GCoptimization
         class each time a smoothness penalty must be computed.

##################################################################

6. Optimizing the energy

You can optimize the energy and get the resulting labeling using the following functions.  Notice that they can 
be called as many times as one wishes after the constructor has been called and the data/smoothness terms
(and the neighborhood system, if general graph) has beeen set.  The initial labeling is set to consists of
all 0's. Use function setLabel(SiteID pixelP, LabelID labelL), described under heading (x) in this section
to initialize the labeling to anything else (but in the valid range, of course, labels must be between
0 and num_labels-1)


i) expansion(int max_num_iterations)
Will run the expansion algorithm up to the specified number of iterations.
Returns the energy of the resulting labeling.

ii)expansion();
Will run the expansion algorithm to convergence (convergence is guaranteed)
Returns the energy of the resulting labeling
	

iii)  alpha_expansion(LabelID alpha_label);
Performs  expansion on the label specified by alpha_label.  Returns the energy of the resulting labeling


iV) void alpha_expansion(LabelID alpha_label, SiteID *sites, SiteID num);
Peforms  expansion on label alpha_label only for sites specified by *sites.  
num is the size of  array "sites"                                            

	
v) swap(int max_num_iterations);
Will run the swap algorithm up to the specified number of iterations.
Returns the energy of the resulting labeling.


vi) swap();
Will run the swap algorithm up to convergence (convergence is guaranteed)
Returns the energy of the resulting labeling
	
	
vii) alpha_beta_swap(LabelID alpha_label, LabelID beta_label);
Performs  swap on a pair of labels, specified by the input parameters alpha_label, beta_label.
Returns the energy of the resulting labeling.

viii)void alpha_beta_swap(LabelID alpha_label, LabelID beta_label, SiteID *alphaSites, SiteID alpha_size, 
                          SiteID *betaSites, SiteID beta_size);

 Peforms  swap on a pair of labels, specified by the input parameters alpha_label, beta_label 
only on the sites in the specified arrays, alphaSites and betaSites, and the array sizes	
 are, respectively, alpha_size and beta_size                                                	



ix) whatLabel(SiteID site)
Returns the current label assigned to site.  Can be called at any time after the constructor call.

x) setLabel(SiteID s, LabelID l)
Sets the label of site  s to the the input parameter l. Can be called at any time after the constructor call.
This function is useful, in particular, to  initialize the labeling to something specific before optimization 
starts.

xi) setLabelOrder(bool RANDOM_LABEL_ORDER)
By default, the labels for the swap and expansion algorithms are visited in not random order, 
but random label visitation might give better results. To set the label order to
be not random, call setLabelOrder(false).  To set it to be random, call setLabelOrder(true). Notice,
that by using functions under heading (iii) and (vii) you can completely  and exactly specify the desired
order on labels.

xii) EnergyType giveDataEnergy();
Returns the data part of the energy of the current labling

	
xiii)	EnergyType giveSmoothEnergy();
Returns the smoothness part of the energy of the current labling


##################################################################

7. Example usage.


See example.cpp
