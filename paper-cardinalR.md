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
date: '2025-05-05'
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

The main function of the package is `gen_multicluster()`. This function generates clusters of various shapes, allowing users to specify the number of points in each cluster, as well as their locations, scaling, and rotations across specific dimensions. Additionally, users can add background noise into the generated data by using the `is_bkg` option.

The main arguments of the `gen_multicluster()` function are shown in Table \@ref(tab:main-tb-html).

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:main-tb-html)The main arguments for `gen_multicluster()`.

|Argument |Explanation                                                                                        |
|:--------|:--------------------------------------------------------------------------------------------------|
|n        |A numeric vector representing the number of points in each cluster.                                |
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

A branching structure captures trajectories that diverge or bifurcate from a common origin, resembling processes such as cell differentiation in biology. We introduce a set of data generation functions specifically designed to simulate high-dimensional branching structures with various geometry, number of points, and the number of branches. Table \@ref(tab:branching-tb-html) outlines these functions. The main arguments of the functions described in Table \@ref(tab:arg-branching-tb-html).

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

Table: (\#tab:arg-branching-tb-html)The main arguments for branching shape generators.

|Argument |Explanation                                            |
|:--------|:------------------------------------------------------|
|n        |A numeric value representing the number of points.     |
|p        |A numeric value representing the number of dimensions. |
|k        |A numeric value representing the number of clusters.   |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>



<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>expbranches</span> <span class='op'>&lt;-</span> <span class='fu'>gen_expbranches</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span>, k <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-expbranches-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `expbranches` data." width="100%" />
<p class="caption">(\#fig:fig-expbranches-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `expbranches` data.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>linearbranches</span> <span class='op'>&lt;-</span> <span class='fu'>gen_linearbranches</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span>, k <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-linearbranches-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `linearbranches` data." width="100%" />
<p class="caption">(\#fig:fig-linearbranches-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `linearbranches` data.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>curvybranches</span> <span class='op'>&lt;-</span> <span class='fu'>gen_curvybranches</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span>, k <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-curvybranches-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `curvybranches` data." width="100%" />
<p class="caption">(\#fig:fig-curvybranches-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `curvybranches` data.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>orglinearbranches</span> <span class='op'>&lt;-</span> <span class='fu'>gen_orglinearbranches</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span>, k <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-orglinearbranches-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `orglinearbranches` data." width="100%" />
<p class="caption">(\#fig:fig-orglinearbranches-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `orglinearbranches` data.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>orgcurvybranches</span> <span class='op'>&lt;-</span> <span class='fu'>gen_orgcurvybranches</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span>, k <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-orgcurvybranches-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `orgcurvybranches` data." width="100%" />
<p class="caption">(\#fig:fig-orgcurvybranches-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `orgcurvybranches` data.</p>
</div>

</div>


### Cone

To simulate a cone-shaped structure in arbitrary dimensions, we define a function `gen_cone(n, p, h, ratio)`, which creates a high-dimensional cone with options for a sharp or blunted apex, allowing for a dense concentration of points near the tip.

This function generates `n` points in a `p`-dimensional space, where the last dimension (`X_p`) represents height along the cone's axis, and the remaining dimensions define a shrinking hyperspherical cross-section as one moves toward the tip.

Points along the height axis are drawn from an exponential distribution to increase density near the tip:

$$
X_p = h_i \sim \text{Exp}(\lambda = 2/h), \quad \text{truncated at } h
$$

The effective radius at height $h_i$ decreases linearly from base to tip, controlled by a shape ratio parameter:

$$
r_i = r_{\text{min}} + (r_{\text{max}} - r_{\text{min}}) \cdot \frac{h_i}{h}, \quad \text{where } r_{\text{min}} = \text{ratio},\ r_{\text{max}} = 1
$$

For each point, a direction is sampled uniformly from a $(p-1)$-dimensional hypersphere using generalized spherical coordinates (angles). The radial coordinates are scaled by $r_i$, which ensures a conical taper. Specifically, when $p = 3$, this scaling results in a classic $3\text{-}D$ cone. However, for $p > 3$, the introduction of additional angular components allows for a smooth extension into higher dimensions, preserving the conical shape while accommodating the complexities of multi-dimensional geometry. 

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>cone</span> <span class='op'>&lt;-</span> <span class='fu'>gen_cone</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span>, h <span class='op'>=</span> <span class='fl'>5</span>, ratio <span class='op'>=</span> <span class='fl'>0.5</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-cone-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `cone` data." width="100%" />
<p class="caption">(\#fig:fig-cone-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `cone` data.</p>
</div>

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


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>gridcube</span> <span class='op'>&lt;-</span> <span class='fu'>gen_gridcube</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-gridcube-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `gridcube` data." width="100%" />
<p class="caption">(\#fig:fig-gridcube-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `gridcube` data.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>unifcube</span> <span class='op'>&lt;-</span> <span class='fu'>gen_unifcube</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-unifcube-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `unifcube` data." width="100%" />
<p class="caption">(\#fig:fig-unifcube-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `unifcube` data.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>cubehole</span> <span class='op'>&lt;-</span> <span class='fu'>gen_cubehole</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-cubehole-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `cubehole` data." width="100%" />
<p class="caption">(\#fig:fig-cubehole-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `cubehole` data.</p>
</div>

</div>


### Gaussian

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>gau</span> <span class='op'>&lt;-</span> <span class='fu'>gen_gaussian</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span>, s <span class='op'>=</span> <span class='fu'><a href='https://rdrr.io/r/base/diag.html'>diag</a></span><span class='op'>(</span><span class='fl'>4</span><span class='op'>)</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-gau-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `gau` data." width="100%" />
<p class="caption">(\#fig:fig-gau-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `gau` data.</p>
</div>

</div>


### Linear

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>linear</span> <span class='op'>&lt;-</span> <span class='fu'>gen_longlinear</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-linear-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `linear` data." width="100%" />
<p class="caption">(\#fig:fig-linear-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `linear` data.</p>
</div>

</div>


### Mobius

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>mobius</span> <span class='op'>&lt;-</span> <span class='fu'>gen_mobius</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-mobius-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `mobius` data." width="100%" />
<p class="caption">(\#fig:fig-mobius-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `mobius` data.</p>
</div>

</div>


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


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>quadratic</span> <span class='op'>&lt;-</span> <span class='fu'>gen_quadratic</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-quadratic-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `quadratic` data." width="100%" />
<p class="caption">(\#fig:fig-quadratic-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `quadratic` data.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>cubic</span> <span class='op'>&lt;-</span> <span class='fu'>gen_cubic</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-cubic-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `cubic` data." width="100%" />
<p class="caption">(\#fig:fig-cubic-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `cubic` data.</p>
</div>

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


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>pyrrect</span> <span class='op'>&lt;-</span> <span class='fu'>gen_pyrrect</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-pyrrect-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `pyrrect` data." width="100%" />
<p class="caption">(\#fig:fig-pyrrect-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `pyrrect` data.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>pyrtri</span> <span class='op'>&lt;-</span> <span class='fu'>gen_pyrtri</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-pyrtri-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `pyrtri` data." width="100%" />
<p class="caption">(\#fig:fig-pyrtri-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `pyrtri` data.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>pyrstar</span> <span class='op'>&lt;-</span> <span class='fu'>gen_pyrstar</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-pyrstar-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `pyrstar` data." width="100%" />
<p class="caption">(\#fig:fig-pyrstar-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `pyrstar` data.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>pyrholes</span> <span class='op'>&lt;-</span> <span class='fu'>gen_pyrholes</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-pyrholes-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `pyrholes` data." width="100%" />
<p class="caption">(\#fig:fig-pyrholes-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `pyrholes` data.</p>
</div>

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


To simulate an S-curve structure in a higher-dimensional space, we define the function `gen_scurve(n, p)`, which generates `n` observations in `p` dimensions. 

The $3\text{-}D$ geometry is constructed by introducing a latent parameter, $\theta \sim U\left(-\frac{3\pi}{2}, \frac{3\pi}{2}\right)$. This parameter controls the curvature of the manifold. The first three dimensions form the S-curve structure:
  
$$
  X_1 = \sin(\theta), \quad X_2 \sim U(0, 2), \quad X_3 = \text{sign}(\theta) \cdot (\cos(\theta) - 1).
$$

This configuration creates a horizontally curled shape in $(X_1, X_3)$, with additional band thickness in the $X_2$ direction.

For $p > 3$, additional noise dimensions are appended introducing structured, wavy perturbations.

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>scurve</span> <span class='op'>&lt;-</span> <span class='fu'>gen_scurve</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-scurve-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `scurve` data." width="100%" />
<p class="caption">(\#fig:fig-scurve-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `scurve` data.</p>
</div>

</div>


To simulate a variant of the S-curve structure with a removed region ("hole"), we define the function `gen_scurvehole(n, p)`. This function produces `n` observations in a $p$-dimensional space where the first three dimensions describe the S-curve manifold, and remaining dimensions add low-variance Gaussian noise. A subset of observations near a designated anchor point is excluded to introduce a hole in the manifold.

To simulate missing regions on the manifold, a fixed anchor point $(0, 1, 0, \ldots)$ is defined in $p$-dimensional space. All observations within a Euclidean distance of $\sqrt{0.3} \approx 0.5477$ from the anchor are removed:

$$
\text{remove if} \quad \sum_{j=1}^p (X_j - a_j)^2 \leq 0.3
$$.

This exclusion creates a hole in the manifold centered near the middle vertical region of the S-curve.

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>scurvehole</span> <span class='op'>&lt;-</span> <span class='fu'>gen_scurvehole</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-scurvehole-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `scurvehole` data." width="100%" />
<p class="caption">(\#fig:fig-scurvehole-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `scurvehole` data.</p>
</div>

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


The function `gen_circle(n, p)` generates a $p$-dimensional dataset of $n$ observations, where the first two dimensions form a unit circle, and the remaining dimensions are structured sinusoidal extensions of the angular parameter with progressively smaller scale.

A latent angle variable $\theta$ is uniformly sampled from the interval $[0, 2\pi]$. Coordinates in the first two dimensions represent a perfect circle on the plane:

$$
X_1 = \cos(\theta), \quad X_2 = \sin(\theta)
$$

For dimensions $X_3$ through $X_p$, sinusoidal transformations of the angle $\theta$ are introduced. The first component is a scaling factor that decreases with the dimension index, defined as $\text{scale}_j = \sqrt{(0.5)^{j-2}}$ for $j = 3, \dots, p$. The second component is a phase shift that is proportional to the dimension index, specifically designed to decorrelate the curves, given by the formula $\phi_j = (j - 2) \cdot \frac{\pi}{2p}$.

Each additional dimension is computed as:

$$
X_j = \text{scale}_{j} \cdot \sin(\theta + \phi_j), \quad j = 3, \dots, p
$$

This structure retains a one-dimensional manifold (the circle) but allows it to be embedded non-linearly and decorrelatively in higher dimensions. The decreasing scale ensures that higher dimensions add less variation, preserving the dominance of the circular shape while adding complexity.

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>circle</span> <span class='op'>&lt;-</span> <span class='fu'>gen_circle</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-circle-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `circle` data." width="100%" />
<p class="caption">(\#fig:fig-circle-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `circle` data.</p>
</div>

</div>


The `gen_curvycycle(n, p)` function generates a $p$-dimensional dataset of $n$ observations lying on a curved closed loop with controlled high-dimensional sinusoidal deviations. The structure forms a one-dimensional nonlinear cycle embedded in higher-dimensional space.

A latent angle variable $\theta$ is uniformly sampled from the interval $[0, 2\pi]$. The first three dimensions define a non-circular closed curve, referred to as a "curvy cycle." In this configuration, $X_1 = \cos(\theta)$ represents horizontal oscillation, while $X_2 = \sqrt{3}/3 + \sin(\theta)$ introduces a vertical offset to avoid centering the curve at the origin. Additionally, $X_3 = \frac{1}{3} \cdot \cos(3\theta)$ introduces a third harmonic perturbation that intricately folds the curve three times along its path, creating a unique and complex shape that oscillates in both dimensions while incorporating the effects of the harmonic perturbation.

Together, these define a periodic, non-trivial, closed curve in $3\text{-}D$ with internal folds that produce a more complex geometry than a standard circle or ellipse.

For dimensions $X_4$ through $X_p$, additional structured variability is introduced through decreasing amplitude scaling and phase-shifted sine waves. The scaling factor is defined as $\text{scale}_j = \sqrt{(0.5)^{j-3}}$ for $j$ ranging from 4 to $p$, which means that the amplitude decreases as the dimension increases. Each dimension $X_j$ is then calculated using the formula $X_j = \text{scale}_j \cdot \sin(\theta + \phi_j)$, where the phase shift $\phi_j$ is given by $\phi_j = (j - 2) \cdot \frac{\pi}{2p}$. 

This introduces decorrelated, low-variance sinusoidal variations across dimensions, retaining the cyclical nature while embedding the data in higher-dimensional space with a coherent but subtle structure.

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>curvycycle</span> <span class='op'>&lt;-</span> <span class='fu'>gen_curvycycle</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-curvycycle-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `curvycycle` data." width="100%" />
<p class="caption">(\#fig:fig-curvycycle-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `curvycycle` data.</p>
</div>

</div>


The `gen_unifsphere(n, p, r)` function generates a $p$-dimensional dataset of $n$ observations distributed approximately uniformly on the surface of a $3\text{-}D$ sphere of radius $r$, with additional Gaussian noise dimensions added when $p > 3$.

Each observation lies on the surface of a sphere in $3\text{-}D$, constructed by generating $u \sim U(-1, 1)$ which represents the cosine of the polar angle $\phi$ and $\theta \sim U(0, 2\pi)$ which represents the azimuthal angle.

The corresponding Cartesian coordinates are calculated as;

$$
X_1 = r \cdot \sqrt{1 - u^2} \cdot \cos(\theta),
$$
$$
X_2 = r \cdot \sqrt{1 - u^2} \cdot \sin(\theta),
$$
$$
X_3 = r \cdot u,
$$

which gives points uniformly distributed on the surface of a $3\text{-}D$ sphere (not within).

For $p > 3$, additional dimensions $X_4$ to $X_p$ are generated as low-variance Gaussian noise:

$$
X_j \sim \mathcal{N}(0, 0.05^2),\text{ for }j = 4, \dots, p.
$$

This extends the $3\text{-}D$ spherical manifold into $p$-dimensional space with orthogonal Gaussian noise, preserving the spherical structure while allowing for testing in higher-dimensional settings.

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>unifsphere</span> <span class='op'>&lt;-</span> <span class='fu'>gen_unifsphere</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-unifsphere-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `unifsphere` data." width="100%" />
<p class="caption">(\#fig:fig-unifsphere-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `unifsphere` data.</p>
</div>

</div>


The `gen_gridedsphere(n, p)` function generates a $p$-dimensional dataset of approximately $n$ observations evenly distributed on the surface of a $3\text{-}D$ unit sphere, with optional Gaussian noise dimensions when $p > 3$.

The base structure consists of a $3\text{-}D$ spherical surface created using a regular grid in spherical coordinates, where $\theta \in [0, 2\pi]$ represents the azimuthal angle (longitude) and $\phi \in [0, \pi]$ denotes the polar angle (co-latitude).

The number of grid steps along each dimension is determined by factoring $n$ into two approximately equal integers via `gen_nproduct(n, p = 2)`.

Each point on the sphere is computed using the spherical-to-Cartesian transformation:

$$
X_1 = \sin(\phi) \cdot \cos(\theta),
$$
$$
X_2 = \sin(\phi) \cdot \sin(\theta),
$$
$$
X_3 = \cos(\phi).
$$

This forms a structured grid of points on the unit sphere, ideal for studying how regular geometric manifolds are transformed under nonlinear dimensionality reduction.

For $p > 3$, the manifold is embedded in a higher-dimensional space by adding Gaussian noise dimensions:

$$
X_j \sim \mathcal{N}(0, 0.05^2),\text{ for }j = 4, \dots, p.
$$

These dimensions represent low-variance orthogonal noise, preserving the spherical shape while testing robustness in high-dimensional settings.

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>gridedsphere</span> <span class='op'>&lt;-</span> <span class='fu'>gen_gridedsphere</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-gridedsphere-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `gridedsphere` data." width="100%" />
<p class="caption">(\#fig:fig-gridedsphere-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `gridedsphere` data.</p>
</div>

</div>


The `gen_clusteredspheres(n, k, p, r, loc)` function generates a synthetic dataset of $n_1 + k \cdot n_2$ observations in $p$-dimensional space, consisting of one large sphere of radius $r_1$ and $k$ smaller spheres of radius $r_2$, each centered at a different random location.

A large uniform sphere centered at the origin is created by sampling $n_1$ points uniformly on the surface of a $p$-dimensional sphere with a radius of $r_1$. The sampling is executed using the function `gen_unifsphere(n_1, p, r_1)`, which generates the desired points in the specified dimensional space.

In generation of $k$ smaller uniform spheres, each sphere contains $n_2$ points that are sampled uniformly on a sphere with a radius of $r_2$. These spheres are positioned at distinct random locations in $p$-space, with the center of each sphere being drawn from a normal distribution $\mathcal{N}(0, \texttt{loc}^2 I_p)$.
    
Points on spheres are generated using the standard hyperspherical method, which involves sampling $u \sim U(-1, 1)$ to determine the cosine of the polar angle, and sampling $\theta \sim U(0, 2\pi)$ to determine the azimuthal angle (for 3D). 

Each observation is classified by cluster, with labels such as "big" for the large central sphere and "small_1" to "small_k" for the smaller spheres.

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>clusteredspheres</span> <span class='op'>&lt;-</span> <span class='fu'>gen_clusteredspheres</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fu'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='op'>(</span><span class='fl'>1000</span>, <span class='fl'>100</span><span class='op'>)</span>, k <span class='op'>=</span> <span class='fl'>3</span>, p <span class='op'>=</span> <span class='fl'>4</span>, r <span class='op'>=</span> <span class='fu'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='op'>(</span><span class='fl'>15</span>, <span class='fl'>3</span><span class='op'>)</span>,</span>
<span>                                         loc <span class='op'>=</span> <span class='fl'>10</span> <span class='op'>/</span> <span class='fu'><a href='https://rdrr.io/r/base/MathFun.html'>sqrt</a></span><span class='op'>(</span><span class='fl'>3</span><span class='op'>)</span><span class='op'>)</span> <span class='op'>|&gt;</span></span>
<span>  <span class='fu'>dplyr</span><span class='fu'>::</span><span class='fu'><a href='https://dplyr.tidyverse.org/reference/select.html'>select</a></span><span class='op'>(</span><span class='op'>-</span><span class='va'>cluster</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-clusteredspheres-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `clusteredspheres` data." width="100%" />
<p class="caption">(\#fig:fig-clusteredspheres-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `clusteredspheres` data.</p>
</div>

</div>


The `gen_hemisphere(n, p)` function generates a $p$-dimensional dataset of $n$ observations distributed approximately uniformly on a $4\text{-}D$ hemisphere, optionally extended with Gaussian noise in additional dimensions when $p > 4$.

Each observation is situated on a restricted $4\text{-}D$ spherical surface, defined by spherical coordinates. The azimuthal angle $\theta_1 \sim U(0, \pi)$ in the $(x_1, x_2)$ plane, while the elevation angle $\theta_2 \sim U(0, \pi)$ in the $(x_2, x_3)$ plane. Additionally, $\theta_3 \sim U(0, \pi/2)$ in the $(x_3, x_4)$ plane, ensuring that the points remain restricted to a hemisphere.

The coordinates are transformed into $4\text{-}D$ Cartesian space:

$$
X_1 = \sin(\theta_1) \cdot \cos(\theta_2),
$$
$$
X_2 = \sin(\theta_1) \cdot \sin(\theta_2),
$$
$$
X_3 = \cos(\theta_1) \cdot \cos(\theta_3),
$$
$$
X_4 = \cos(\theta_1) \cdot \sin(\theta_3).
$$

This produces points on one side of a $4\text{-}D$ unit sphere, effectively generating a $4\text{-}D$ hemisphere.

For $p > 4$, additional dimensions $X_5$ to $X_p$ are added as low-variance Gaussian noise:

$$
X_j \sim \mathcal{N}(0, 0.05^2),\text{ for }j = 5, \dots, p.
$$

These dimensions maintain the spherical structure while simulating embedding into higher-dimensional space with small orthogonal perturbations.

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>hemisphere</span> <span class='op'>&lt;-</span> <span class='fu'>gen_hemisphere</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-hemisphere-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `hemisphere` data." width="100%" />
<p class="caption">(\#fig:fig-hemisphere-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `hemisphere` data.</p>
</div>

</div>


### Swiss Roll  

To further generalize the Swiss roll structure and introduce realistic noise, we define a function `gen_swissroll(n, p, w)`, where `n` is the number of points, `p` is the total number of dimensions, and `w` is the vertical range in the third dimension.  

The first three dimensions form the classic $3\text{-}D$ Swiss roll shape:

$$
X_1 = t \cos(t), \quad X_2 = t \sin(t), \quad X_3 \sim U(w_1, w_2), \quad \text{with } t \sim U(0, 3\pi)
$$

For $p > 3$, the remaining $p - 3$ dimensions are filled with small Gaussian noise to simulate high-dimensional complexity. 

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>swissroll</span> <span class='op'>&lt;-</span> <span class='fu'>gen_swissroll</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span>, w <span class='op'>=</span> <span class='fu'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='op'>(</span><span class='op'>-</span><span class='fl'>1</span>, <span class='fl'>1</span><span class='op'>)</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-swissroll-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `swissroll` data." width="100%" />
<p class="caption">(\#fig:fig-swissroll-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `swissroll` data.</p>
</div>

</div>


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


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>crescent</span> <span class='op'>&lt;-</span> <span class='fu'>gen_crescent</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-crescent-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `crescent` data." width="100%" />
<p class="caption">(\#fig:fig-crescent-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `crescent` data.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>curvycylinder</span> <span class='op'>&lt;-</span> <span class='fu'>gen_curvycylinder</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span>, h <span class='op'>=</span> <span class='fl'>10</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-curvycylinder-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `curvycylinder` data." width="100%" />
<p class="caption">(\#fig:fig-curvycylinder-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `curvycylinder` data.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>sphericalspiral</span> <span class='op'>&lt;-</span> <span class='fu'>gen_sphericalspiral</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span>, spins <span class='op'>=</span> <span class='fl'>1</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-sphericalspiral-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `sphericalspiral` data." width="100%" />
<p class="caption">(\#fig:fig-sphericalspiral-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `sphericalspiral` data.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>helicalspiral</span> <span class='op'>&lt;-</span> <span class='fu'>gen_helicalspiral</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-helicalspiral-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `helicalspiral` data." width="100%" />
<p class="caption">(\#fig:fig-helicalspiral-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `helicalspiral` data.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>conicspiral</span> <span class='op'>&lt;-</span> <span class='fu'>gen_conicspiral</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span>, spins <span class='op'>=</span> <span class='fl'>1</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-conicspiral-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `conicspiral` data." width="100%" />
<p class="caption">(\#fig:fig-conicspiral-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `conicspiral` data.</p>
</div>

</div>


<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>nonlinear</span> <span class='op'>&lt;-</span> <span class='fu'>gen_nonlinear</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>1000</span>, p <span class='op'>=</span> <span class='fl'>4</span>, hc <span class='op'>=</span> <span class='fl'>1</span>, non_fac <span class='op'>=</span> <span class='fl'>0.5</span><span class='op'>)</span></span></code></pre></div>

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
<img src="paper-cardinalR_files/figure-html5/fig-nonlinear-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `nonlinear` data." width="100%" />
<p class="caption">(\#fig:fig-nonlinear-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `nonlinear` data.</p>
</div>

</div>


### Multiple cluster examples

By using the shape generators mentioned above, we can create various examples of multiple clusters. The package includes some of these examples, which are described in Table \@ref(tab:odd-shape-tb-html).

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:odd-shape-tb-html)cardinalR multiple clusters generation functions

|Function       |Explanation |
|:--------------|:-----------|
|make_mobiusgau |            |
|make_multigau  |            |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


### Additional functions

The package includes various supplementary tools in addition to the shape-generating functions mentioned earlier. These tools allow users to generate noise dimensions with a normal distribution and various wavy patterns, create background noise, randomize the rows of the data, reposition clusters, generate a vector whose product and sum are approximately equal to a target value, rotate structures, and normalize the data. Table \@ref(tab:add-tb-html) details these functions.

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

The following code generates a dataset of five clusters, positioned with equal inter-cluster distances in $4\text{-}D$ space (Figure \@ref(fig:fig-highd-proj)).

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


The five clusters have different geometric structures and each contain different number of points. Specifically, the helical spiral cluster includes $2250$ points and was generated with a scale parameter of $0.4$. The hemisphere cluster consists of $1500$ points with a scale parameter of $0.35$. The uniform cube-shaped cluster contains $750$ points and uses a scale parameter of $0.3$. The blunted cone cluster includes $1250$ points, generated with a scale parameter of $1$. Finally, the Gaussian-shaped cluster contains $1750$ points and was generated with a scale parameter of $0.3$.

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">
<div class="figure">
<img src="paper-cardinalR_files/figure-html5/fig-nldr-layouts-1.png" alt="Six different dimension reduction representations of the `mobiusgau` data using default hyperparameter settings: (a) tSNE, (b) UMAP, (c) PAHTE, (d) TriMAP, (e) PaCMAP, and (f) PCA." width="100%" />
<p class="caption">(\#fig:fig-nldr-layouts)Six different dimension reduction representations of the `mobiusgau` data using default hyperparameter settings: (a) tSNE, (b) UMAP, (c) PAHTE, (d) TriMAP, (e) PaCMAP, and (f) PCA.</p>
</div>

</div>


UMAP, PHATE, TriMAP, and PaCMAP effectively separate the five clusters and show the preservation of the global structure (Figure \@ref(fig:fig-nldr-layouts)). However, PHATE reveals three non-linear clusters, even though two of them do not show non-linearity. UMAP, TriMAP, and PaCMAP successfully maintain the local structures of the data. In contrast, tSNE divides the non-linear cluster into sub-clusters. Also, tSNE fails to preserve the distances between the clusters. PCA, on the other hand, preserves the local structures of the clusters, but some clusters are incorrectly merged that should remain distinct.

# Discussion

- Branching: These functions create a controlled environment for testing how effectively various algorithms preserve branching topology and continuity in their low-dimensional embeddings.

- Scurve with a hole allowing for evaluation of how well algorithms handle incomplete manifolds or missing local structure.

- clusteredsphere: This structure allows for cluster separation on curved manifolds in high-dimensional space and can be used to test the ability of NLDR methods and clustering algorithms to detect spherical clusters of different sizes and separations.

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




