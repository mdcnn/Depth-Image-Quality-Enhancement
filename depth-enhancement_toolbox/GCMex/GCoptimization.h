/*#########################################################################
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
*/
// Copyright 2007 Olga Veksler (olga@csd.uwo.ca)
// email olga@csd.uwo.ca for any questions, suggestions and bug reports 

////////////////////////////////////////////////////////////////////////////////////
//  IMPORTANT!!!!!!
//  If you use this software, YOU HAVE TO REFERENCE (at least) 3 papers, the citations [1]
//  [2] and [3] below
///////////////////////////////////////////////////////////////////////////////////
//	For description and  example usage see GC_README.TXT                      
///////////////////////////////////////////////////////////////////////////////////
/*
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

*/

/* Together with the library implemented by O. Veksler, we provide, with the permission of the
    V. Kolmogorov and Y. Boykov the following libraries:  */

  
/*1)	energy.h, which was developed by Vladimir Kolmogorov and  implements binary energy minimization 
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
website:http://www.adastral.ucl.ac.uk/~vladkolm/software.html
*/


///////////////////////////////////////////////////////////////////////////////////
/*

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
*/
///////////////////////////////////////////////////////////////////////////////////

#ifndef __GCOPTIMIZATION_H__
#define __GCOPTIMIZATION_H__

#include "energy.h"
#include "graph.h"
#include <memory.h>
#include <stdio.h>
#include <limits.h>

#ifdef _MSC_EXTENSIONS
#define OLGA_INLINE __forceinline
#else
#define OLGA_INLINE inline
#endif

class LinkedBlockList;

class GCoptimization
{
public: 
	typedef Graph::flowtype EnergyType;     // Type for the total energy the energy function.Change it in Graph.h 
	typedef Graph::captype EnergyTermType;  // Type for the individual terms in the energy function.Change it in Graph.h 
	typedef Energy::Var VarID;              
	typedef int LabelID;                   // Type for labels
	typedef int SiteID;                    // Type for sites
	typedef EnergyTermType (*SmoothCostFn)(SiteID s1, SiteID s2, LabelID l1, LabelID l2);
	typedef EnergyTermType (*DataCostFn)(SiteID s, LabelID l);
	typedef EnergyTermType (*SmoothCostFnExtra)(SiteID s1, SiteID s2, LabelID l1, LabelID l2,void *);
	typedef EnergyTermType (*DataCostFnExtra)(SiteID s, LabelID l,void *);


	GCoptimization(SiteID num_sites, LabelID num_labels);
	virtual ~GCoptimization();

	// Peforms expansion algorithm. Runs the number of iterations specified by max_num_iterations 
	// If no input specified,runs until convergence. Returns total energy of labeling. 
	EnergyType expansion(int max_num_iterations=INT_MAX);

	// Peforms  expansion on one label, specified by the input parameter alpha_label 
	void alpha_expansion(LabelID alpha_label);

	// Peforms  expansion on label alpha_label only for sites specified by *sites.  
	// num is the size of  array "sites"                                            
	void alpha_expansion(LabelID alpha_label, SiteID *sites, SiteID num);

	// Peforms swap algorithm. Runs it the specified number of iterations. If no  
	// input is specified,runs until convergence                                  
	EnergyType swap(int max_num_iterations=INT_MAX);

	// Peforms  swap on a pair of labels, specified by the input parameters alpha_label, beta_label 
	void alpha_beta_swap(LabelID alpha_label, LabelID beta_label);

	// Peforms  swap on a pair of labels, specified by the input parameters alpha_label, beta_label 
	// only on the sitess in the specified arrays, alphaSites and betaSitess, and the array sizes  
	// are, respectively, alpha_size and beta_size                                                  
	void alpha_beta_swap(LabelID alpha_label, LabelID beta_label, SiteID *alphaSites, 
		                 SiteID alpha_size, SiteID *betaSites, SiteID beta_size);

	struct DataCostFunctor;      // use this class to pass a functor to setDataCost 
	struct SmoothCostFunctor;    // use this class to pass a functor to setSmoothCost 

	void setDataCost(DataCostFn fn);
	void setDataCost(DataCostFnExtra fn, void *extraData);
	void setDataCost(EnergyTermType *dataArray);
	void setDataCost(SiteID s, LabelID l, EnergyTermType e); 
	void setDataCostFunctor(DataCostFunctor* f);
	struct DataCostFunctor {
		virtual EnergyTermType compute(SiteID s, LabelID l) = 0;
	};

	void setSmoothCost(SmoothCostFn fn);
	void setSmoothCost(SmoothCostFnExtra fn, void *extraData);
	void setSmoothCost(LabelID l1, LabelID l2, EnergyTermType e); 
	void setSmoothCost(EnergyTermType *smoothArray);
	void setSmoothCostFunctor(SmoothCostFunctor* f);
	struct SmoothCostFunctor {
		virtual EnergyTermType compute(SiteID s1, SiteID s2, LabelID l1, LabelID l2) = 0;
	};


	// Returns current label assigned to input site 
	inline LabelID whatLabel(SiteID site){assert(site >= 0 && site < m_num_sites);return(m_labeling[site]);};

	// This function can be used to change the label of any site at any time      
	inline void setLabel(SiteID site, LabelID label){
		assert(label >= 0 && label < m_num_labels && site >= 0 && site < m_num_sites);m_labeling[site] = label;};
 
	// setLabelOrder(false) sets the order to be not random; setLabelOrder(true) 
	//	sets the order to random. By default, the labels are visited in non-random order 
	//	for both the swap and alpha-expansion moves                         
	void setLabelOrder(bool RANDOM_LABEL_ORDER);

	// returns total energy
	EnergyType compute_energy();

	// Returns Data Energy of current labeling 
	EnergyType giveDataEnergy();

	// Returns Smooth Energy of current labeling
	EnergyType giveSmoothEnergy();

	// For advanced users who want to squeeze maximum performance out of
	// their custom functors. By specializing the GCoptimization class
	// (via this method), the compiler knows the exact class you intend 
	// to use to compute costs. The compiler then inlines your compute 
	// function in all the right places, provided it's not virtual. 
	// The functor class need not derive from anything in this case.
	template <typename UserFunctor> void specializeDataCostFunctor(const UserFunctor f);
	template <typename UserFunctor> void specializeSmoothCostFunctor(const UserFunctor f);

protected:
	
	LabelID m_num_labels;
	SiteID m_num_sites;
	LabelID *m_labeling;
	SiteID  *m_lookupSiteVar; // holds index of variable corresponding to site participating in a move,
	                          // -1 for nonparticipating site
	LabelID *m_labelTable;    // to figure out label order in which to do expansion/swaps
	int m_random_label_order;
	EnergyTermType* m_datacostIndividual;
	EnergyTermType* m_smoothcostIndividual;

	void*   m_datacostFn;
	void*   m_smoothcostFn;

	EnergyType (GCoptimization::*m_giveDataEnergyInternal)();
	EnergyType (GCoptimization::*m_giveSmoothEnergyInternal)();
	void (GCoptimization::*m_set_up_n_links_expansion)(SiteID,LabelID,Energy*,VarID*,SiteID*);
	void (GCoptimization::*m_set_up_t_links_expansion)(SiteID,LabelID,Energy*,VarID*,SiteID*);
	void (GCoptimization::*m_set_up_n_links_swap)(SiteID,LabelID,LabelID,Energy*,VarID*,SiteID*);
	void (GCoptimization::*m_set_up_t_links_swap)(SiteID,LabelID,LabelID,Energy*,VarID*,SiteID*);
	void (*m_datacostFnDelete)(void* f);
	void (*m_smoothcostFnDelete)(void* f);

	// returns a pointer to the neighbors of a site and the weights
	virtual void giveNeighborInfo(SiteID site, SiteID *numSites, SiteID **neighbors, EnergyTermType **weights)=0;

	virtual bool readyToOptimise();

	template <typename DataCostT> 
	void set_up_t_links_expansion(SiteID size, LabelID alpha_label,Energy *e,VarID *variables, SiteID *activeSites );

	template <typename DataCostT> 
	void set_up_t_links_swap(SiteID size, LabelID alpha_label,LabelID beta_label,Energy *e,VarID *variables, SiteID *activeSites );

	template <typename SmoothCostT> 
	void set_up_n_links_expansion(SiteID size, LabelID alpha_label,Energy *e,VarID *variables,SiteID *activeSites );

	template <typename SmoothCostT> 
	void set_up_n_links_swap(SiteID size, LabelID alpha_label,LabelID beta_label,Energy *e,VarID *variables,SiteID *activeSites );


	// Returns Data Energy of current labeling 
	template <typename DataCostT>
	EnergyType giveDataEnergyInternal();

	// Returns Smooth Energy of current labeling
	template <typename SmoothCostT>
	EnergyType giveSmoothEnergyInternal();

	template <typename Functor>
	static void deleteFunctor(void* f) {
		delete reinterpret_cast<Functor*>(f);
	}

	struct DataCostFnFromArray {
		DataCostFnFromArray(EnergyTermType* theArray, LabelID num_labels)
			: m_array(theArray), m_num_labels(num_labels){}
		OLGA_INLINE EnergyTermType compute(SiteID s, LabelID l){return m_array[s*m_num_labels+l];}

	private:
		const EnergyTermType* const m_array;
		const LabelID m_num_labels;
	};

	struct DataCostFnFromFunction {
		DataCostFnFromFunction(DataCostFn fn): m_fn(fn){}
		OLGA_INLINE EnergyTermType compute(SiteID s, LabelID l){return m_fn(s,l);}
	private:
		const DataCostFn m_fn;
	};

	struct DataCostFnFromFunctionExtra {
		DataCostFnFromFunctionExtra(DataCostFnExtra fn,void *extraData): m_fn(fn),m_extraData(extraData){}
		OLGA_INLINE EnergyTermType compute(SiteID s, LabelID l){return m_fn(s,l,m_extraData);}
	private:
		const DataCostFnExtra m_fn;
		void *m_extraData;
	};

	struct SmoothCostFnFromArray {
		SmoothCostFnFromArray(EnergyTermType* theArray, LabelID num_labels)
			: m_array(theArray), m_num_labels(num_labels){}
		OLGA_INLINE EnergyTermType compute(SiteID s1, SiteID s2, LabelID l1, LabelID l2){return m_array[l1*m_num_labels+l2];}
	private:
		const EnergyTermType* const m_array;
		const LabelID m_num_labels;
	};

	struct SmoothCostFnFromFunction {
		SmoothCostFnFromFunction(SmoothCostFn fn)
			: m_fn(fn){}
		OLGA_INLINE EnergyTermType compute(SiteID s1, SiteID s2, LabelID l1, LabelID l2){return m_fn(s1,s2,l1,l2);}
	private:
		const SmoothCostFn m_fn;
	};

	struct SmoothCostFnFromFunctionExtra {
		SmoothCostFnFromFunctionExtra(SmoothCostFnExtra fn,void *extraData)
			: m_fn(fn),m_extraData(extraData){}
		OLGA_INLINE EnergyTermType compute(SiteID s1, SiteID s2, LabelID l1, LabelID l2){return m_fn(s1,s2,l1,l2,m_extraData);}
	private:
		const SmoothCostFnExtra m_fn;
		void *m_extraData;
	};

	void handleError(const char *message);
private:
	void solveExpansion(SiteID size,SiteID *activeSites,LabelID alpha_label);
	EnergyType oneExpansionIteration();
	void set_up_expansion_energy(SiteID size, LabelID alpha_label,Energy *e,VarID *variables, SiteID *activeSites );
	
	void solveSwap(SiteID size,SiteID *activeSites,LabelID alpha_label, LabelID beta_label);
	// Peforms one iteration (one pass over all pairs of labels)  of swap algorithm
	EnergyType oneSwapIteration();
	void set_up_swap_energy(SiteID size,LabelID alpha_label,LabelID beta_label,
							Energy* e,Energy::Var *variables,SiteID *activeSites);

	void scramble_label_table();
};

//////////////////////////////////////////////////////////////////////////////////////////////////
// Use this derived class for grid graphs
//////////////////////////////////////////////////////////////////////////////////////////////////

class GCoptimizationGridGraph: public GCoptimization
{
public:
  GCoptimizationGridGraph(SiteID width,SiteID height,LabelID num_labels);
  virtual ~GCoptimizationGridGraph();
          
  void setSmoothCostVH(EnergyTermType *smoothArray, EnergyTermType *vCosts, EnergyTermType *hCosts);
  virtual bool readyToOptimise();  

protected:
	virtual void giveNeighborInfo(SiteID site, SiteID *numSites, SiteID **neighbors, EnergyTermType **weights);
	EnergyTermType m_unityWeights[4];
	int m_weightedGraph;  // true if spatially varying w_pq's are present. False otherwise.

private:
	SiteID m_width;
	SiteID m_height;	
	SiteID *m_numNeighbors;              // holds num of neighbors
	SiteID *m_neighbors;                 // holds neighbor indexes
	EnergyTermType *m_neighborsWeights;    // holds neighbor weights
	
	void setupNeighbData(SiteID startY,SiteID endY,SiteID startX,SiteID endX,SiteID maxInd,SiteID *indexes);
	void computeNeighborWeights(EnergyTermType *vCosts,EnergyTermType *hCosts);

};

//////////////////////////////////////////////////////////////////////////////////////////////////

class GCoptimizationGeneralGraph:public GCoptimization
{

public:
	// This is the constructor for non-grid graphs. Neighborhood structure must  be specified by 
	// setNeighbors()  function
	GCoptimizationGeneralGraph(SiteID num_sites,LabelID num_labels);
	virtual ~GCoptimizationGeneralGraph();

	virtual bool readyToOptimise();

	// Makes site1 and site2 neighbors of each other. Can be called only 1 time for each      
	// unordered pair of sites. Parameter weight can be used to set spacially varying terms     
	// If the desired penalty for neighboring sites site1 and site2 is                        
	// V(label1,label2) = weight*SmoothnessPenalty(label1,label2), then                        
	// member function setLabel should be called as: setLabel(site1,site2,weight)             
	void setNeighbors(SiteID site1, SiteID site2, EnergyTermType weight=1);

	// passes pointers to arrays storing neighbor information
	// numNeighbors[i] is the number of neighbors for site i
	// neighborsIndexes[i] is a pointer to the array storing the sites which are neighbors to site i
	// neighborWeights[i] is a pointer to array storing the weights between site i and its neighbors
	// in the same order as neighborIndexes[i] stores the indexes
	void setAllNeighbors(SiteID *numNeighbors,SiteID **neighborsIndexes,EnergyTermType **neighborsWeights);

protected: 
	virtual void giveNeighborInfo(SiteID site, SiteID *numSites, SiteID **neighbors, EnergyTermType **weights);

private:

	typedef struct NeighborStruct{
		SiteID  to_node;
		EnergyTermType weight;
	} Neighbor;


	LinkedBlockList *m_neighbors;
	bool m_needToFinishSettingNeighbors;
	SiteID *m_numNeighbors;
	SiteID **m_neighborsIndexes;
	EnergyTermType **m_neighborsWeights;
	bool m_needTodeleteNeighbors;

	
	//Call this function when you are finished setting neibhbors 
	void finishSettingNeighbors();


};


/////////////////////////////////////////////////////////////////////
// Class for handling errors 
/////////////////////////////////////////////////////////////////////

class GCException
{
public:
	const char* message;
	GCException( const char* m ) { message = m; }
	void Report() {
		printf("\n%s\n",message);
		exit(0);
	}
};




////////////////////////////////////////////////////////////////////
// Methods
////////////////////////////////////////////////////////////////////

template <typename UserFunctor>
void GCoptimization::specializeDataCostFunctor(const UserFunctor f) {
	if ( m_datacostFn ) handleError("Data Costs are already initialized");

	m_datacostFn = new UserFunctor(f);
	m_datacostFnDelete         = &GCoptimization::deleteFunctor<UserFunctor>;
	m_giveDataEnergyInternal   = &GCoptimization::giveDataEnergyInternal<UserFunctor>;
	m_set_up_t_links_expansion = &GCoptimization::set_up_t_links_expansion<UserFunctor>;
	m_set_up_t_links_swap      = &GCoptimization::set_up_t_links_swap<UserFunctor>;
}

template <typename UserFunctor>
void GCoptimization::specializeSmoothCostFunctor(const UserFunctor f) {
	if ( m_smoothcostFn ) handleError("Smoothness Costs are already initialized");

	m_smoothcostFn = new UserFunctor(f);
	m_smoothcostFnDelete       = &GCoptimization::deleteFunctor<UserFunctor>;
	m_giveSmoothEnergyInternal = &GCoptimization::giveSmoothEnergyInternal<UserFunctor>;
	m_set_up_n_links_expansion = &GCoptimization::set_up_n_links_expansion<UserFunctor>;
	m_set_up_n_links_swap      = &GCoptimization::set_up_n_links_swap<UserFunctor>;
}

//-------------------------------------------------------------------
template <typename DataCostT>
GCoptimization::EnergyType GCoptimization::giveDataEnergyInternal()
{

	EnergyType eng = (EnergyType) 0;

	DataCostT* tc = (DataCostT*)m_datacostFn;

	for ( SiteID i = 0; i < m_num_sites; i++ )
	{
	    assert(m_labeling[i] >= 0 && m_labeling[i] < m_num_labels);
		eng = eng + tc->compute(i,m_labeling[i]);
	}

	return(eng);
}

//-------------------------------------------------------------------
template <typename SmoothCostT>
GCoptimization::EnergyType GCoptimization::giveSmoothEnergyInternal()
{

	EnergyType eng = (EnergyType) 0;
	SiteID i,numN,*nPointer,nSite,n;
	EnergyTermType *weights;

	SmoothCostT* sc = (SmoothCostT*) m_smoothcostFn;

	for ( i = 0; i < m_num_sites; i++ )
	{
		giveNeighborInfo(i,&numN,&nPointer,&weights);

		for ( n = 0; n < numN; n++ )
		{
			nSite = nPointer[n];
			if ( nSite < i ) eng = 
				        eng + weights[n]*(sc->compute(i,nSite,m_labeling[i],m_labeling[nSite]));
		}
	}

	return(eng);
}


//-------------------------------------------------------------------//
//                  METHODS for EXPANSION MOVES                      //  
//-------------------------------------------------------------------//

template <typename DataCostT>
void GCoptimization::set_up_t_links_expansion(SiteID size, LabelID alpha_label,Energy *e,
											  VarID *variables,SiteID *activeSites )
{
	DataCostT* dc = (DataCostT*)m_datacostFn;

	for ( SiteID i = 0; i < size; i++ )
	{
		e -> add_term1(variables[i],dc->compute(activeSites[i],alpha_label),
		                            dc->compute(activeSites[i],m_labeling[activeSites[i]]));
	}
}

//-------------------------------------------------------------------

template <typename SmoothCostT>
void GCoptimization::set_up_n_links_expansion(SiteID size, LabelID alpha_label,Energy *e,
     										  VarID *variables,SiteID *activeSites )
{
	SiteID i,nSite,site,n,nNum,*nPointer;
	EnergyTermType *weights;

	SmoothCostT* sc = (SmoothCostT*)m_smoothcostFn;

	for ( i = size - 1; i >= 0; i-- )
	{
		site = activeSites[i];

		giveNeighborInfo(site,&nNum,&nPointer,&weights);
		for ( n = 0; n < nNum; n++ )
		{
			nSite = nPointer[n];


			if ( nSite < site )
			{
				if ( m_lookupSiteVar[nSite] != -1 )
					e ->add_term2(variables[i],variables[m_lookupSiteVar[nSite]],
					sc->compute(site,nSite,alpha_label,alpha_label)*weights[n],
					sc->compute(site,nSite,alpha_label,m_labeling[nSite])*weights[n],
					sc->compute(site,nSite,m_labeling[site],alpha_label)*weights[n],
					sc->compute(site,nSite,m_labeling[site],m_labeling[nSite])*weights[n]);
				else   e ->add_term1(variables[i],sc->compute(site,nSite,alpha_label,m_labeling[nSite])*weights[n],
				                  sc->compute(site,nSite,m_labeling[site],m_labeling[nSite])*weights[n]);
			}
			else
			{
				if (m_lookupSiteVar[nSite] == -1 )
				   e ->add_term1(variables[i],sc->compute(site,nSite,alpha_label,m_labeling[nSite])*weights[n],
				                              sc->compute(site,nSite,m_labeling[site],m_labeling[nSite])*weights[n]);
			}
		}
	}
}


//-------------------------------------------------------------------//
//                  METHODS for SWAP MOVES                           //  
//-------------------------------------------------------------------//


template <typename DataCostT>
void GCoptimization::set_up_t_links_swap(SiteID size, LabelID alpha_label, LabelID beta_label,
										 Energy *e,VarID *variables,SiteID *activeSites )
{
	DataCostT* dc = (DataCostT*)m_datacostFn;

	for ( SiteID i = 0; i < size; i++ )
	{
		e -> add_term1(variables[i],dc->compute(activeSites[i],alpha_label),
		                            dc->compute(activeSites[i],beta_label) );
	}
}

//-------------------------------------------------------------------

template <typename SmoothCostT>
void GCoptimization::set_up_n_links_swap(SiteID size, LabelID alpha_label,LabelID beta_label,
										 Energy *e,VarID *variables,SiteID *activeSites )
{
	SiteID i,nSite,site,n,nNum,*nPointer;
	EnergyTermType *weights;

	SmoothCostT* sc = (SmoothCostT*)m_smoothcostFn;

	for ( i = size - 1; i >= 0; i-- )
	{
		site = activeSites[i];

		giveNeighborInfo(site,&nNum,&nPointer,&weights);
		for ( n = 0; n < nNum; n++ )
		{
			nSite = nPointer[n];

			if ( nSite < site )
			{
				if ( m_lookupSiteVar[nSite] != -1 )
					e ->add_term2(variables[i],variables[m_lookupSiteVar[nSite]],
					sc->compute(site,nSite,alpha_label,alpha_label)*weights[n],
					sc->compute(site,nSite,alpha_label,beta_label)*weights[n],
					sc->compute(site,nSite,beta_label,alpha_label)*weights[n],
					sc->compute(site,nSite,beta_label,beta_label)*weights[n]);
				else   e ->add_term1(variables[i],sc->compute(site,nSite,alpha_label,m_labeling[nSite])*weights[n],
				                  sc->compute(site,nSite,beta_label,m_labeling[nSite])*weights[n]);
			}
			else
			{
				if (m_lookupSiteVar[nSite] == -1 )
				   e ->add_term1(variables[i],sc->compute(site,nSite,alpha_label,m_labeling[nSite])*weights[n],
				                              sc->compute(site,nSite,beta_label,m_labeling[nSite])*weights[n]);
			}
		}
	}
}



#endif
