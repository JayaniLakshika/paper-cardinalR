---
title: 'cardinalR: Generating interesting high-dimensional data structures'
description: |
  A high-dimensional dataset is where each observation is described by many features, or dimensions. Such a dataset might contain various types of structures that have complex geometric properties, such as nonlinear manifolds, clusters, or sparse distributions. We can generate data containing a variety of structures using mathematical functions and statistical distributions. Sampling from a multivariate normal distribution will generate data in an elliptical shape. Using a trigonometric function we can generate a spiral. A torus function can create a donut shape. High-dimensional data structures are useful for testing, validating, and improving algorithms used in dimensionality reduction, clustering, machine learning, and visualization. Their controlled complexity allows researchers to understand challenges posed in data analysis and helps to develop robust analytical methods across diverse scientific fields like bioinformatics, machine learning, and forensic science. Functions to generate a large variety of structures in high dimensions are organized into the R package `cardinalR`, along with some already generated examples.
draft: yes
author:
- name: Jayani P. Gamage
  affiliation: Monash University
  address: Department of Econometrics and Business Statistics, VIC 3800 Australia
  url: https://jayanilakshika.netlify.app/
  orcid_id: 0000-0002-6265-6481
  email: \email{jayani.piyadigamage@monash.edu}
- name: Dianne Cook
  affiliation: Monash University
  address: Department of Econometrics and Business Statistics, VIC 3800 Australia
  url: http://www.dicook.org/
  email: dicook@monash.edu
  orcid_id: 0000-0002-3813-7155
- name: Paul Harrison
  affiliation: Monash University
  address: MGBP, BDInstitute, VIC 3800 Australia
  email: paul.harrison@monash.edu
  orcid_id: 0000-0002-3980-268X
- name: Michael Lydeamore
  affiliation: Monash University
  address: Department of Econometrics and Business Statistics, VIC 3800 Australia
  email: michael.lydeamore@monash.edu
  orcid_id: 0000-0001-6515-827X
- name: Thiyanga S. Talagala
  affiliation: University of Sri Jayewardenepura
  address: Department of Statistics, Gangodawila, Nugegoda 10100 Sri Lanka
  url: https://thiyanga.netlify.app/
  email: ttalagala@sjp.ac.lk
  orcid_id: 0000-0002-0656-9789
type: package
creative_commons: CC BY
date: '2025-04-30'
preamble: |
  \usepackage{amsmath} \usepackage{array}
output:
  distill::distill_article:
    css: style.css
    keep_md: yes
bibliography: paper-cardinalR.bib
editor_options:
  chunk_output_type: inline
journal:
  title: The R Journal
  issn: 2073-4859
  firstpage: 1.0
  lastpage: ~
slug: paper-cardinalR
pdf_url: paper-cardinalR.pdf
packages:
  cran:
  - knitr
  - rmarkdown
  bioc: []
CTV: ReproducibleResearch
csl: /Library/Frameworks/R.framework/Versions/4.4-arm64/Resources/library/rjtools/rjournal.csl

---




<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">


</div>


# Introduction

Generating synthetic datasets with clearly defined geometric properties is essential for evaluating and benchmarking algorithms in various fields, such as machine learning, data mining, and computational biology. Researchers often need to generate data with specific dimensions, noise characteristics, and complex underlying structures to test the performance and robustness of their methods.

There are numerous packages available in R for generating synthetic data, each designed with unique characteristics and focus areas. For example, `geozoo` (@barret2016) offers a large collection of geometric objects, allowing users to create and analyze specific shapes, primarily in lower-dimensional spaces. Another useful package is `snedata` (@james2025), which provides tools for generating simplified datasets useful for evaluating dimensionality reduction techniques like tSNE, often focusing on understanding and evaluating low-dimensional embeddings of complex data structures. Additionally, `mlbench` (@friedrich2024) includes a collection of well-known benchmark datasets commonly associated with established classification or regression challenges. In the field of single-cell omics, `splatter` (@luke2017) is particularly simulate complex biological data, effectively capturing nuances such as batch effects and differential expression.

There is a valuable opportunity to improve the generation of high-dimensional data structures by integrating geometric principles with advanced noise control and customizable clustering. The `geozoo` package provides a strong foundation but could be enhanced to support high-dimensional extensions with controlled noise and user-defined parameters for clustering. Similarly, while `snedata` focuses on abstract datasets for dimensionality reduction, adding features for generating high-dimensional data from geometric layouts would enhance its usability. The `mlbench` package could also benefit from allowing users to create datasets with specific geometric structures and noise profiles. Additionally, although `splatter` specializes in biological data simulation, it could be expanded to offer a broader framework for generating diverse geometric structures across dimensions, enabling detailed control over noise and clustering. Addressing these areas could lead to more robust high-dimensional data generation tools.

To address this gap, this paper introduces the `cardinalR` R package. This package provides a collection of functions designed to generate customizable data structures in any number of dimensions, starting from basic geometric shapes. `cardinalR` offers important functionalities that extend beyond the capabilities of existing tools, allowing users to: (i) construct high-dimensional datasets based on geometric shapes, including the option to enhance dimensionality by adding controlled noise dimensions; (ii) introduce adjustable levels of background noise to these structures; and (iii) create complex clustered data arrangements by using fundamental geometric forms, while maintaining their positions, scales, orientations, and sample sizes in arbitrary dimensional spaces. By providing these integrated features, `cardinalR` aims to provide researchers to generate more explainable and challenging synthetic datasets focused to the specific needs of evaluating algorithms in high-dimensions. This bridges the gap between geometric foundations and the flexible generation of complex synthetic data.

The paper is organized as follows. In next section, introduces the implementation of `cardinalR` package on CRAN and GitHub, including demonstration of the package's key functions. We illustrate how a clustering data structure affect the dimension reductions in **Application** section. Finally, we give a brief conclusion of the paper and discuss potential opportunities for use of our data collection.

# Implementation

## Installation

The package can be installed from CRAN using 

```r
install.packages("cardinalR")
```

and the development version can be installed from GitHub 

```r
devtools::install_github("JayaniLakshika/cardinalR")
```

## Web site

More documentation of the package can be found at the web site <https://jayanilakshika.github.io/cardinalR/>.

## Data sets

The `cardinalR` package comes with several data sets that load with the package. These are described in Table \@ref(tab:datasets-tb-html).

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:datasets-tb-html)cardinalR data sets

|data            |explanation                                                                                 |
|:---------------|:-------------------------------------------------------------------------------------------|
|mobiusgau       |Simulated data with a Mobius and a Gaussian in 4-D space.                                   |
|mobiusgau_tsne1 |The tSNE embedding with perplexity $15$ for mobiusgau.                                      |
|mobiusgau_tsne2 |The tSNE embedding with perplexity $30$ for mobiusgau.                                      |
|mobiusgau_tsne3 |The tSNE embedding with perplexity $5$ for mobiusgau.                                       |
|mobiusgau_umap1 |The UMAP embedding with number of neighbors $15$ and minimum distance $0.1$ for mobiusgau.  |
|mobiusgau_umap2 |The UMAP embedding with number of neighbors $30$ and minimum distance $0.08$ for mobiusgau. |
|mobiusgau_umap3 |The UMAP embedding with number of neighbors $5$ and minimum distance $0.9$ for mobiusgau.   |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


## Functions

### Main function

The main function of the package is `gen_multicluster()`. This function generates clusters of various shapes, allowing users to specify the number of samples in each cluster, as well as their locations, scaling, and rotations across specific dimensions. Additionally, users can add background noise into the generated data by using the `is_bkg` option.

The main arguments of the `gen_multicluster()` function are shown in Table \@ref(tab:main-tb-html).

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:main-tb-html)The main arguments for `gen_multicluster()`.

|Argument |Explanation                                                                                        |
|:--------|:--------------------------------------------------------------------------------------------------|
|n        |A numeric vector representing the sample sizes.                                                    |
|p        |A numeric value representing the number of dimensions.                                             |
|k        |A numeric value representing the number of clusters.                                               |
|loc      |A numeric matrix representing the locations/centroids of clusters.                                 |
|scale    |A numeric vector representing the scaling factors of clusters.                                     |
|shape    |A character vector representing the shapes of clusters.                                            |
|rotation |A numeric list which contains plane and the corresponding angle along that plane for each cluster. |
|is_bkg   |A Boolean value representing the background noise should exist or not.                             |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


### Branching

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:branching-tb-html)cardinalR branching data generation functions

|Function              |Explanation                                                               |
|:---------------------|:-------------------------------------------------------------------------|
|gen_expbranches       |Generate a structure with exponential shaped branches.                    |
|gen_linearbranches    |Generate a structure with linear shaped branches.                         |
|gen_curvybranches     |Generate a structure with curvy shaped branches.                          |
|gen_orglinearbranches |Generate a structure with linear shaped branches originated in one point. |
|gen_orgcurvybranches  |Generate a structure with curvy shaped branches originated in one point.  |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">


</div>


### Cone

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">


</div>


### Cube

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:cube-tb-html)cardinalR cube data generation functions

|Function     |Explanation                                                 |
|:------------|:-----------------------------------------------------------|
|gen_gridcube |Generate a cube with specified grid points along each axes. |
|gen_unifcube |Generate a cube with uniform points.                        |
|gen_cubehole |Generate a cube with a hole.                                |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


### Gaussian

### Linear

### Mobius

### Polynomial

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:polynomial-tb-html)cardinalR polynomial data generation functions

|Function      |Explanation                   |
|:-------------|:-----------------------------|
|gen_quadratic |Generate a quadratic pattern. |
|gen_cubic     |Generate a cubic pattern.     |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


### Pyramid

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:pyramid-tb-html)cardinalR pyramid data generation functions

|Function     |Explanation                                                                             |
|:------------|:---------------------------------------------------------------------------------------|
|gen_pyrrect  |Generate a pyramid with a rectangular base, with the option of a sharp or blunted apex. |
|gen_pyrtri   |Generate a pyramid with a triangular base, with the option of a sharp or blunted apex.  |
|gen_pyrstar  |Generate a pyramid with a star-shape base, with the option of a sharp or blunted apex.  |
|gen_pyrholes |Generate a pyramid with triangular pyramid shaped holes.                                |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


### S-curve

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:scurve-tb-html)cardinalR S-curve data generation functions

|Function       |Explanation                     |
|:--------------|:-------------------------------|
|gen_scurve     |Generate a S-curve.             |
|gen_scurvehole |Generate a S-curve with a hole. |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>



### Sphere

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:sphere-tb-html)cardinalR sphere data generation functions

|Function             |Explanation                                          |
|:--------------------|:----------------------------------------------------|
|gen_circle           |Generate a circle.                                   |
|gen_curvycycle       |Generate a curvy cell cycle.                         |
|gen_unifsphere       |Generate a uniform sphere.                           |
|gen_gridedsphere     |Generate a grided sphere.                            |
|gen_clusteredspheres |Generate multiple small spheres within a big sphere. |
|gen_hemisphere       |Generate a hemisphere.                               |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


### Swiss Roll  

To generalize the Swiss roll structure to arbitrary dimensions, we introduce a function `generate_swiss_roll(n, p)`, which constructs a high-dimensional version of the classic 3D Swiss roll while preserving its core characteristics.  

The function generates `n` points in a `p`-dimensional space, where the first two dimensions (`X_1, X_2`) define the primary Swiss roll shape using a parametric equation:  

$$
X_1 = t \cos(t), \quad X_2 = t \sin(t), \quad \text{where } t \sim U(0, 3\pi)
$$

The third dimension (`X_3`) introduces variation perpendicular to the roll, sampled uniformly from \([-1,1]\). Additional dimensions (`X_4` to `X_p`) extend the data structure by applying a **sinusoidal transformation** of the parameter `t`, ensuring continuity in higher-dimensional spaces:  

$$
X_i = \frac{\sin(i t)}{i}, \quad \text{for } i \geq 4.
$$

This transformation ensures a gradual decay in variance across dimensions, mimicking real-world high-dimensional structures where later dimensions often capture subtler variations. 

### Trigonometric

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:trigonometric-tb-html)cardinalR trigonometric data generation functions

|Function            |Explanation                     |
|:-------------------|:-------------------------------|
|gen_crescent        |Generate a crescent pattern.    |
|gen_curvycylinder   |Generate a curvy cylinder.      |
|gen_sphericalspiral |Generate a spherical spiral.    |
|gen_helicalspiral   |Generate a helical spiral.      |
|gen_conicspiral     |Generate a conic spiral.        |
|gen_nonlinear       |Generate a nonlinear hyperbola. |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


### Odd shapes

Add table of odd shapes..

### Additional functions

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:add-tb-html)cardinalR additional functions

|Function          |Explanation                                                                                       |
|:-----------------|:-------------------------------------------------------------------------------------------------|
|gen_noisedims     |Generates additional noise dimensions.                                                            |
|gen_bkgnoise      |Adds background noise.                                                                            |
|randomize_rows    |Randomizes the rows.                                                                              |
|relocate_clusters |Relocates the clusters.                                                                           |
|gen_nproduct      |Generates a vector of positive integers whose product is approximately equal to a target value.   |
|gen_nsum          |Generates a vector of positive integers whose summation is approximately equal to a target value. |
|gen_wavydims1     |Generates random noise dimensions with wavy pattern generated with theta.                         |
|gen_wavydims2     |Generates random noise dimensions with wavy pattern generated with power functions.               |
|gen_wavydims3     |Generates random noise dimensions with wavy pattern generated with power and sine functions.      |
|gen_rotation      |Generates rotations.                                                                              |
|normalize_data    |Normalizes data.                                                                                  |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


# Application

## Assessing the performance of dimension reduction on different geometric structures in high-dimensions

This section illustrates the use of package by generating a synthetic dataset to evaluate the performance of six popular dimension reduction techniques: Principal Component Analysis (PCA) [@jolliffe2011], t-distributed stochastic neighbor embedding (tSNE) [@laurens2008], uniform manifold approximation and projection (UMAP) [@leland2018], potential of heat-diffusion for affinity-based trajectory embedding (PHATE) algorithm [@moon2019], large-scale dimensionality reduction Using triplets (TriMAP) [@amid2019], and pairwise controlled manifold approximation (PaCMAP) [@yingfan2021].

We generated a dataset of five clusters, positioned with equal inter-cluster distances in $4\text{-}D$ space. The five clusters have different geometric structures and each contain different number of points. Specifically, the helical spiral cluster includes $2250$ points and was generated with a scale parameter of $0.4$. The hemisphere cluster consists of $1500$ points with a scale parameter of $0.35$. The uniform cube-shaped cluster contains $750$ points and uses a scale parameter of $0.3$. The blunted cone cluster includes $1250$ points, generated with a scale parameter of $1$. Finally, the Gaussian-shaped cluster contains $1750$ points and was generated with a scale parameter of $0.3$.

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>positions</span> <span class='op'>&lt;-</span> <span class='fu'>geozoo</span><span class='fu'>::</span><span class='fu'><a href='https://rdrr.io/pkg/geozoo/man/simplex.html'>simplex</a></span><span class='op'>(</span>p<span class='op'>=</span><span class='fl'>4</span><span class='op'>)</span><span class='op'>$</span><span class='va'>points</span></span>
<span><span class='va'>positions</span> <span class='op'>&lt;-</span> <span class='va'>positions</span> <span class='op'>*</span> <span class='fl'>0.8</span></span>
<span></span>
<span><span class='co'>## To generate data</span></span>
<span><span class='va'>five_clusts</span> <span class='op'>&lt;-</span> <span class='fu'>gen_multicluster</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fu'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='op'>(</span><span class='fl'>2250</span>, <span class='fl'>1500</span>, <span class='fl'>750</span>, <span class='fl'>1250</span>, <span class='fl'>1750</span><span class='op'>)</span>, p <span class='op'>=</span> <span class='fl'>4</span>, k <span class='op'>=</span> <span class='fl'>5</span>,</span>
<span>                       loc <span class='op'>=</span> <span class='va'>positions</span>,</span>
<span>                       scale <span class='op'>=</span> <span class='fu'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='op'>(</span><span class='fl'>0.4</span>, <span class='fl'>0.35</span>, <span class='fl'>0.3</span>, <span class='fl'>1</span>, <span class='fl'>0.3</span><span class='op'>)</span>,</span>
<span>                       shape <span class='op'>=</span> <span class='fu'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='op'>(</span><span class='st'>"helicalspiral"</span>, <span class='st'>"hemisphere"</span>, <span class='st'>"unifcube"</span>, </span>
<span>                                 <span class='st'>"cone"</span>, <span class='st'>"gaussian"</span><span class='op'>)</span>,</span>
<span>                       rotation <span class='op'>=</span> <span class='cn'>NULL</span>,</span>
<span>                       is_bkg <span class='op'>=</span> <span class='cn'>FALSE</span><span class='op'>)</span></span></code></pre></div>

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">
<div class="figure">
<img src="paper-cardinalR_files/figure-html5/fig-highd-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `mobiusgau` data. The helical spiral cluster is represented in dark green, the hemisphere cluster in orange, the uniform cube-shaped cluster in purple, the blunted cone cluster in pink, and the Gaussian-shaped cluster in light green." width="100%" />
<p class="caption">(\#fig:fig-highd-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `mobiusgau` data. The helical spiral cluster is represented in dark green, the hemisphere cluster in orange, the uniform cube-shaped cluster in purple, the blunted cone cluster in pink, and the Gaussian-shaped cluster in light green.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">
<div class="figure">
<img src="paper-cardinalR_files/figure-html5/fig-nldr-layouts-1.png" alt="Six different dimension reduction representations of the `mobiusgau` data using default hyperparameter settings: (a) tSNE, (b) UMAP, (c) PAHTE, (d) TriMAP, (e) PaCMAP, and (f) PCA." width="100%" />
<p class="caption">(\#fig:fig-nldr-layouts)Six different dimension reduction representations of the `mobiusgau` data using default hyperparameter settings: (a) tSNE, (b) UMAP, (c) PAHTE, (d) TriMAP, (e) PaCMAP, and (f) PCA.</p>
</div>

</div>


UMAP, PHATE, TriMAP, and PaCMAP effectively separate the five clusters and show the preservation of the global structure. However, PHATE reveals three non-linear clusters, even though two of them do not show non-linearity. UMAP, TriMAP, and PaCMAP successfully maintain the local structures of the data. In contrast, tSNE divides the non-linear cluster into sub-clusters. Also, tSNE fails to preserve the distances between the clusters. PCA, on the other hand, preserves the local structures of the clusters, but some clusters are incorrectly merged that should remain distinct.

# Discussion

<!-- The application of our high-dimensional data generation package to evaluate the interplay between dimensionality reduction, nuisance variables, and hierarchical clustering yielded several key insights. The ability to generate synthetic datasets with well-defined underlying structures, coupled with the controlled introduction of nuisance variables, provided a valuable platform for assessing the robustness of downstream unsupervised learning techniques. -->

<!-- Our findings demonstrated that the choice of dimensionality reduction method significantly impacted the ability of hierarchical clustering to recover the true underlying clusters. Methods that effectively preserved the global structure of the data, as defined by our generation process, generally led to more accurate and interpretable hierarchical clustering results. However, the presence of nuisance variables often confounded the low-dimensional embeddings, making it more challenging for hierarchical clustering to separate truly distinct groups. This highlights a critical consideration in real-world data analysis, where unmeasured or latent factors can obscure the signal of interest. -->

<!-- The hierarchical clustering analysis itself, and the choice of linkage criteria, also played a crucial role. Different linkage methods revealed varying degrees of sensitivity to the distorted representations caused by the nuisance variables. For instance, methods that prioritize compact clusters might have been more susceptible to being misled by variance introduced by nuisance factors, while others focusing on the distance between clusters might have shown more resilience. The dendrograms generated by hierarchical clustering provided a visual means to explore the relationships between samples and the potential influence of nuisance, although determining the optimal number of clusters remained a challenge in the presence of these confounding factors. -->

<!-- This application underscores the utility of our data generation package as a powerful tool for controlled experimentation in unsupervised learning. By providing the ground truth cluster assignments and the ability to systematically manipulate data characteristics like dimensionality, geometric structure, and the presence of nuisance variables, researchers can gain a deeper understanding of the strengths and limitations of various DR and clustering algorithms. This controlled environment allows for a more objective evaluation than often possible with real-world datasets where the underlying structure is unknown. -->

<!-- One limitation of this particular application was the specific type and magnitude of the nuisance variables introduced. Future work could explore a wider range of nuisance types (e.g., batch effects, technical noise with specific distributions) and their varying degrees of influence on different DR and clustering methodologies. Furthermore, investigating strategies for mitigating the impact of nuisance variables, either during the DR step or within the clustering process itself, would be a valuable extension. -->

<!-- In conclusion, this example demonstrates the critical role of synthetic data generation in dissecting the complex interactions within unsupervised learning pipelines. Our package provides a flexible and controlled means to create such data, enabling researchers to systematically evaluate the performance and robustness of dimensionality reduction and clustering algorithms under well-defined conditions, including the presence of confounding factors. This capability contributes to a more rigorous and informed approach to high-dimensional data analysis. -->

# Code

The code is available at <https://github.com/JayaniLakshika/cardinalR>, and source material for this paper is available at <https://github.com/JayaniLakshika/paper-cardinalR>.

# Acknowledgements

This article is created using \CRANpkg{knitr} [@yihui2015] and \CRANpkg{rmarkdown} [@yihui2018] in R with the `rjtools::rjournal_article` template. 
```{.r .distill-force-highlighting-css}
```


## CRAN packages used {.appendix}

[knitr](https://cran.r-project.org/package=knitr), [rmarkdown](https://cran.r-project.org/package=rmarkdown)

## CRAN Task Views implied by cited packages {.appendix}

[ReproducibleResearch](https://cran.r-project.org/view=ReproducibleResearch)




