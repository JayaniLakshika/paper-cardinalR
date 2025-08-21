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
date: '2025-08-21'
preamble: |
  \usepackage{amsmath} \usepackage{array} \usepackage{float} \newcommand\pD{$p\text{-}D$} \newcommand\gD{$2\text{-}D$}
output:
  distill::distill_article:
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

The development version can be installed from GitHub: 

```r
pak::pak("JayaniLakshika/cardinalR")
```

<!-- ## Web site -->

<!-- More documentation of the package can be found at the web site [https://jayanilakshika.github.io/cardinalR/](https://jayanilakshika.github.io/cardinalR/). -->

## Usage

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

A branching structure captures trajectories that diverge or bifurcate from a common origin, similar processes such as cell differentiation in biology. We introduce a set of data generation functions specifically designed to simulate high-dimensional branching structures with various geometry, number of points, and the number of branches. Table \@ref(tab:branching-tb-html) outlines these functions. The main arguments of the functions described in Table \@ref(tab:arg-branching-tb-html).

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


#### `gen_expbranches()`

The `gen_expbranches(n, p, k)` function generates a dataset of $n$ points forming $k$ exponential branches in $2\text{-}D$, with optional noise dimensions to embed the structure in $p\text{-}D$. These branches grow in opposite directions, producing a radiating curvilinear structure from a central region.

Each branch $i$ is constructed using $X_1 \sim U(-2, 2)$ and $X_2 = \exp(\pm s_iX_1) + \epsilon$, where: $\epsilon \sim U(0, 0.1)$ adds local jitter, $s_i \in [0.5, 2]$ is randomly sampled for each branch. The sign alternates between branches (odd: negative, even: positive exponent). This creates mirror-symmetric branches with different steepness and curvature where odd-numbered branches: decay pattern (reflected) and even-numbered branches: growth pattern. For $p > 2$, Gaussian noise $X_j \sim N(0, 0.1^2)$ is added to embed the $2\text{-}D$ branches into $p\text{-}D$, where $j = 3, \dots, p$.

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


#### `gen_linearbranches()`

The `gen_linearbranches(n, p, k)` function generates a dataset of $n$ points forming $k$ approximately linear branches in $p\text{-}D$. The core structure lies in the first two dimensions and additional dimensions carry Gaussian noise.

Each branch is a segment of a line with added jitter to simulate measurement noise. The branches differ in direction and location. Branches $1$ and $2$ are initialized with fixed slopes and intercepts. The Branch $1$ is generated from $X_1 \sim U(-2, 8)$, $X_2 = 0.5X_1 + \epsilon$, where $\epsilon \sim U(0, 0.5)$. The Branch $2$ is generated from $X_1 \sim U(-6, 2)$, $X_2 = -0.5X_1 + \epsilon$, where $\epsilon \sim U(0, 0.5)$. Branches $3$ to $k$ are added iteratively. Each additional branch $i$ starts at a location outside predefined exclusion zones to avoid overlap with the initial two branches. The $X_1$ values are defined over a short range, from $x_{start}$ to $x_{start} + 1$. The $X_2$ value is calculated using the formula $X_2 = s_i(X_1 - x_{start}) + y_{start} + \epsilon$, where $s_i$ is a chosen slope from a selected branch, and $\epsilon \sim U(0, 0.2)$. For $p > 2$, Gaussian noise $X_j \sim N(0, 0.05^2)$ is added to embed the $2\text{-}D$ branches into $p\text{-}D$, where $j = 3, \dots, p$.

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


#### `gen_curvybranches()`

The `gen_curvybranches(n, p, k)` function generates a dataset of $n$ points forming $k$ curvilinear branches embedded in $p\text{-}D$. The underlying geometry lies in the first two dimensions, while the remaining $(p-2)$ dimensions contain Gaussian noise.

Branch $1$ is generated from $X_1 \sim U(0, 1)$, and $X_2 = 0.1X_1 + X_1^2 + \epsilon$, where $\epsilon \sim U(0, 0.05)$. This produces a gently upward-curving parabola in the right half-plane. Branch $2$ is generated from $X_{1} \sim U(-1, 0)$, and $X_2 = 0.1X_{1} - 2X_{1}^2 + \epsilon$, where $\epsilon \sim U(0, 0.05)$. This creates a steeper, leftward-facing curve in the left half-plane. Branches $3$ to $k$ are added iteratively. Each new branch $i$ begins at a randomly chosen point within a restricted horizontal band: $X_{1} \in [-0.15, 0.15]$ (to ensure connectivity with earlier branches), spans a unit-length interval on $X_{1}$:$X_1 \in [x_{\text{start}}, x_{\text{start}} + 1]$, and has the structure: $X_2 = 0.1X_1 - s_i(X_1^2 - x_{\text{start}}) + y_{\text{start}}, s_i \in \{-2, -1.5, -1, -0.5, 0, 0.5, 1.5\}$. Here, $s_i$ is a sampled scale factor (slope-like term) controlling curvature, and $(x_{\text{start}}, y_{\text{start}})$ is the starting point from the existing structure. This construction yields $k$ spatially connected, nonlinear branches with varying curvature. For $p > 2$, Gaussian noise $X_j \sim N(0, 0.05^2)$ is added to embed the $2\text{-}D$ branches into $p\text{-}D$, where $j = 3, \dots, p$.

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


#### `gen_orglinearbranches()`

The `gen_orglinearbranches(n, p, k)` function generates a dataset of $n$ points forming $k$ approximately linear branches embedded in $p\text{-}D$. Each branch lies primarily within a distinct $2\text{-}D$ subspace, while the remaining $p - 2$ dimensions contain Gaussian noise.

To construct each branch, a unique or repeated pair of dimensions is selected from the $\binom{p}{2}$ possible $2\text{-}D$ combinations. If $k \leq \binom{p}{2}$, combinations are sampled without replacement. If $k > \binom{p}{2}$, additional pairs are sampled with replacement to reach $k$ total branches. Each selected pair $(X_{i1}, X_{i2})$ defines the $2\text{-}D$ plane for branch $i$.

For branch $i$, $n_i$ points are generated, where $\sum_{i=1}^k n_i = n$. The structure follows: $X_{i1} \sim U(0, 2)$, and $X_{i2} = -s_iX_{i1} + \epsilon, \quad \epsilon \sim U(0, 0.5)$, where $s_i$ is a scale factor controlling the slope. When $k \leq \binom{p}{2}$, $s_i = 1$. When sampling with replacement, $s_i$ is drawn from the set ${1, 1.5, 2, \dots, 8}$ in increments of $0.5$. For $p > 2$, the remaining dimensions contain independent Gaussian noise: $X_j \sim N(0, 0.1^2)$, for $j \notin \{i1, i2\}$.

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


#### `gen_orgcurvybranches()`

The `gen_orgcurvybranches(n, p, k)` function generates a dataset of $n$ points forming $k$ curvilinear branches embedded in a $p$-dimensional space. Each branch is constructed in a unique or repeated $2\text{-}D$ subspace of the $p$-dimensional space, with curvature induced by a second-degree polynomial structure. The remaining $p - 2$ dimensions contain Gaussian noise.

Let $\binom{p}{2}$ denote the number of unique $2\text{-}D$ subspace combinations. When $k \leq \binom{p}{2}$, $k$ distinct subspace pairs $(X_{i1}, X_{i2})$ are sampled without replacement. Otherwise, combinations are selected with replacement to reach $k$ total branches. For each branch $i = 1, \dots, k$, a random scale factor $s_i$ is used to vary the curvature; If $k \leq \binom{p}{2}$: $s_i = 1$, or If $k > \binom{p}{2}$: $s_i \sim \text{Uniform sample from } {1, 1.5, \dots, 8}$.

Each branch contains $n_i$ points such that $\sum_{i=1}^k n_i = n$, where the vector $(n_1, \dots, n_k)$ is randomly drawn using the helper function `gen_nsum()` to partition $n$. Within its assigned subspace $(X_{i1}, X_{i2})$, branch $i$ is defined by: $X_{i1} \sim U(0, 2)$, and $X_{i2} = -s_iX_{i1}^2 + \epsilon, \quad \epsilon \sim U(0, 0.5)$. This forms a smooth downward-opening parabola in the plane defined by $(X_{i1}, X_{i2})$, with the degree of curvature controlled by $s_i$. For $p > 2$, all remaining dimensions are independent Gaussian noise: $X_j \sim N(0, 0.1^2), \quad \text{for } j \notin \{i1, i2\}$.

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
<img src="paper-cardinalR_files/figure-html5/fig-orgcurvybranches-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `expbranches`, `linearbranches`, `curvybranches`, `orglinearbranches`, `orgcurvybranches` data." width="100%" />
<p class="caption">(\#fig:fig-orgcurvybranches-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `expbranches`, `linearbranches`, `curvybranches`, `orglinearbranches`, `orgcurvybranches` data.</p>
</div>

</div>


### Cone

To simulate a cone-shaped structure in arbitrary dimensions, we define a function `gen_cone(n, p, h, ratio)`, which creates a high-dimensional cone with options for a sharp or blunted apex, allowing for a dense concentration of points near the tip.

This function generates $n$ points in a $p\text{-}D$, where the last dimension ($X_p$) represents height along the cone's axis, and the remaining dimensions define a shrinking hyperspherical cross-section as one moves toward the tip. Points along the height axis are drawn from an exponential distribution to increase density near the tip. The $X_p = h_i \sim \text{Exp}(\lambda = 2/h)$ truncated at $h$. The effective radius at height $h_i$ decreases linearly from base to tip, controlled by a shape ratio parameter $r_i = r_{\text{min}} + (r_{\text{max}} - r_{\text{min}})h_i/h, \quad \text{where } r_{\text{min}} = \text{ratio},\ r_{\text{max}} = 1$.

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

A cube structure represents uniformly or systematically distributed points within a high-dimensional hypercube, providing a useful framework for assessing how well algorithms preserve uniformity, spacing, and boundary properties in high dimensions. We provide a set of functions to generate high-dimensional cube structures with flexible configurations, including regular grids, uniform random points, and cubes with missing regions or holes. These structures are valuable for testing the ability of algorithms to maintain uniform spacing or to detect gaps in the data. Table \@ref(tab:cube-tb-html) outlines these functions and their purposes. 

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


#### `gen_gridcube()`

The `gen_gridcube(n, p)` constructs a regular grid using approximately $n$ points by evenly partitioning each of the $p$ dimensions. Specifically, the number of grid points along each axis is determined by `gen_nproduct(n, p)`, which calculates the nearest balanced integer factors whose product is close to $n$. The full grid is generated via `expand_grid()`, giving Cartesian combinations of these evenly spaced positions.

Each variable $X_j$ represents integer grid coordinates (e.g., 1, 2, 3, ...) in dimension $j$: $X_j \in {1, \dots, k_j},\text{ where }\prod_{j=1}^p k_j \approx n$. This results in a hypercube-shaped lattice in $p\text{-}D$.

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


#### `gen_unifcube()`

The `gen_unifcube(n, p)` function generates $n$ points uniformly distributed within a $3\text{-}D$ cube centered at the origin, optionally embedded in $p\text{-}D$ with additional noise dimensions.

Points are sampled independently from $X_1, X_2, X_3 \sim U(-0.5, 0.5)$ of a cube of side length $1$. This results in a uniform cloud of points filling the unit cube in $3\text{-}D$ space. For $p > 3$, Gaussian noise $X_j \sim N(0, 0.05^2)$ is added to embed the $3\text{-}D$ structure into $p\text{-}D$, where $j = 4, \dots, p$.

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


#### `gen_cubehole()`

The `gen_cubehole(n, p)` function generates a dataset of $n$ points sampled uniformly inside a cube, then removes points that fall within a central spherical hole, resulting in a hollow cube structure in $p\text{-}D$.

The initial points are drawn from a uniform cube centered at the origin: $X_1, X_2, X_3 \sim U(-0.5, 0.5)$. The center of the cube is $(0, 0, 0)$. A spherical hole of radius $0.5$ is carved out by filtering out points whose Euclidean distance from the origin is less than or equal to $0.5$: remove if $\sqrt{X_1^2 + X_2^2 + X_3^2} \leq 0.5$. This results in a shell-like point cloud that fills the cube but avoids the spherical center. For $p > 3$, Gaussian noise $X_j \sim N(0, 0.05^2)$ is added to embed the $3\text{-}D$ structure into $p\text{-}D$, where $j = 4, \dots, p$.

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
<img src="paper-cardinalR_files/figure-html5/fig-cubehole-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `gridcube`, `unifcube`, and `cubehole` data." width="100%" />
<p class="caption">(\#fig:fig-cubehole-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `gridcube`, `unifcube`, and `cubehole` data.</p>
</div>

</div>


### Gaussian

The `gen_gaussian(n, p, s)` function generates a multivariate Gaussian cloud in $p\text{-}D$, centered at the origin with user-defined covariance structure. Each point is independently drawn using the multivariate normal distribution with $X_i \sim N_p(\boldsymbol{0}, \Sigma)$, where $\Sigma$ is a user-defined $p \times p$ positive-definite matrix.

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

The `gen_longlinear(n, p)` function simulates a high-dimensional linear structure with a dominant linear trend and small additive noise. Each variable $X_i$ is created as $X_i = \text{scale}_i \left(0, 1, \dots, n{-}1 + \epsilon\right) + \text{shift}_i$, where $\text{scale}_i \sim U(-10, 10)$ is randomly chosen direction and stretch, $\text{shift}_i \sim U(-300, 300)$ is large offset to spread features apart, and $\epsilon \sim N(0, 0.03n)$ is Gaussian noise.

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

The `gen_mobius(n, p)` function generates a dataset of $n$ points that form a Mobius strip embedded in the first three dimensions of a $p\text{-}D$ structure. This classical non-orientable surface loops back on itself with a half-twist.

The Mobius strip is generated using `geozoo::mobius(n, p = 3)$points`, which samples $n$ points from a parametrization of the surface defined by angle $\theta$ and strip width $w$. The cartesian coordinates are $X_1 = \left(1 + w/2 \cos(\theta/2)\right) \cos(\theta)$, $X_2 = \left(1 + w/2 \cos(\theta/2)\right) \sin(\theta)$, and $X_3 = w/2 \sin(\theta/2)$. This maps a $2\text{-}D$ band with a half-twist into $3\text{-}D$ space, forming a non-orientable one-sided surface. For $p > 3$, Gaussian noise $X_j \sim N(0, 0.05^2)$ is added to embed the $3\text{-}D$ Mobius into $p\text{-}D$, where $j = 4, \dots, p$.

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

A polynomial structure generates data points that follow non-linear curvilinear relationships, such as quadratic or cubic trends, in high-dimensional space. These patterns are useful for evaluating how well algorithms capture smooth, non-linear trajectories and curvature in the data. We provide functions for generating quadratic and cubic structures, enabling controlled experiments with different degrees of polynomial complexity. Table \@ref(tab:polynomial-tb-html) summarizes these functions and their purposes.

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


#### `gen_quadratic()`

The `gen_quadratic(n, p, range)` function generates a dataset of $n$ points forming a quadratic curve in the first two dimensions. This $2\text{-}D$ parabolic structure is embedded within a higher-dimensional space with additive noise in the remaining dimensions.

The curve is constructed by drawing uniformly spaced inputs and applying a second-degree polynomial transformation. Let $X_1 \sim U(\text{range}[1], \text{range}[2])$ be the independent variable. A raw polynomial basis of degree 2 is used to form $X_2 = X_1 - X_1^2 + \varepsilon_2$, where $\varepsilon_2 \sim U(0, 0.5)$. This creates a smooth parabolic arc that opens downward, with jitter in the vertical direction to simulate noise. For $p > 2$, Gaussian noise $X_j \sim N(0, 0.1^2)$ is added to embed the $2\text{-}D$ structure into $p\text{-}D$, where $j = 3, \dots, p$.

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


#### `gen_cubic()`

The `gen_cubic(n, p, range)` function generates a dataset of $n$ points forming a cubic curve in the first two dimensions. This function creates a more complex curvilinear structure than a simple parabola.

The shape is generated using a third-degree raw polynomial basis expansion. Let $X_1 \sim U(\text{range}[1], \text{range}[2])$ be the base input. A cubic transformation with vertical jitter is used to define $X_2 = X_1 + X_1^2 - X_1^3 + \varepsilon_2$, where $\varepsilon_2 \sim U(0, 0.5)$. For $p > 2$, Gaussian noise $X_j \sim N(0, 0.1^2)$ is added to embed the $2\text{-}D$ structure into $p\text{-}D$, where $j = 3, \dots, p$.

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
<img src="paper-cardinalR_files/figure-html5/fig-cubic-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `quadratic` and `cubic` data." width="100%" />
<p class="caption">(\#fig:fig-cubic-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `quadratic` and `cubic` data.</p>
</div>

</div>


### Pyramid

A pyramid structure represents data arranged around a central apex and base, useful for exploring how algorithms handle pointed or layered geometries in high-dimensional space. The functions provided allow users to generate pyramids with various base shapes—including rectangular, triangular, and star-shaped bases—with options for sharp or blunted apexes. Additionally, we offer functionality for creating pyramids containing structured holes, enabling the study of non-convex and sparse regions. These designs are valuable for testing the ability of dimension reduction and clustering algorithms to preserve and detect complex geometric features. Table \@ref(tab:pyramid-tb-html) summarizes these functions.

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


#### `gen_pyrrect()`

The `gen_pyrrect(n, p, h, l_vec, rt)` function generates a dataset of $n$ points forming a high-dimensional pyramid-like structure with a rectangular base. The pyramid is embedded in $p\text{-}D$, with a tip at height zero and base at height $h$. The shape tapers linearly from the base dimensions $(l_x, l_y)$ to a smaller rectangular section with side lengths $(2r_t, 2r_t)$ at the tip. Points are distributed more densely near the tip, simulating a natural skew toward smaller height values.

Let $X_1, X_2, \dots, X_p$ denote the coordinates of the generated points. The final dimension $X_p$ encodes the height of each point and is drawn from an exponential distribution capped at $h$: $X_p = z \sim \min\left(\text{Exp}(\lambda = 2/h),\ h\right)$. Let $r_x(z)$ and $r_y(z)$ denote the half-widths of the rectangular cross-section at height $z$: $r_x(z) = r_t + (l_x - r_t)z/h$, $r_y(z) = r_t + (l_y - r_t)z/h$. The first three coordinates are then defined as: $X_1 \sim U(-r_x(z),\ r_x(z))$, $X_2 \sim U(-r_y(z),\ r_y(z))$, and $X_3 \sim U(-r_x(z),\ r_x(z))$. For $p > 3$, the remaining $p - 4$ dimensions (i.e., $X_4$ to $X_{p-1}$) are tapered toward zero with decreasing height and generated as: $X_j \sim U(-0.1, 0.1)\left(1 - z/h\right), \quad \text{for } j = 4, \dots, p-1$. This tapering ensures that the structure narrows in all directions as it approaches the tip.

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


#### `gen_pyrtri()`

The `gen_pyrtri(n, p, h, l, rt)` function generates a dataset of $n$ points forming a high-dimensional pyramid-like structure with a triangular cross-section. The structure is embedded in a $p\text{-}D$, with the tip located at height $0$ and the base at height $h$. The triangle expands linearly in size from tip to base, with more points concentrated near the tip.

Let $X_1, X_2, \dots, X_p$ denote the coordinates of the generated points. The final coordinate $X_p$ encodes the height $z$ of each point and is drawn from an exponential distribution capped at $h$: $X_p = z \sim \min\left(\text{Exp}(\lambda = 2/h),\ h\right)$. Let $r(z)$ denote the scaling factor (distance from the origin to triangle vertices) at height $z$: $r(z) = r_t + (l - r_t)z/h$.

A point in the triangle at height $z$ is generated using barycentric coordinates $(u, v)$ to ensure uniform sampling within the triangular cross-section: $u, v \sim U(0, 1), \quad \text{if } u + v > 1: u \leftarrow 1 - u,\ v \leftarrow 1 - v$. The first three coordinates (triangle plane) are then: $X_1 = r(z)(1 - u - v)$, $X_2 = r(z)u$, and $X_3 = r(z)v$. For dimensions $j = 4, \dots, p-1$, values are tapered linearly toward zero near the tip: $X_j \sim U(-0.1, 0.1)\left(1 - z/h\right)$.

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


#### `gen_pyrstar()`

The `gen_pyrstar(n, p, h, rb)` function generates a dataset of $n$ points forming a high-dimensional pyramid-shaped structure with a hexagonal base. The pyramid extends vertically from height $z = 0$ (tip) to height $z = h$ (base), embedded in a $p$-dimensional space. The distribution concentrates more points near the base, and the hexagonal spread tapers toward the tip.

Let $X_1, X_2, \dots, X_p$ denote the coordinates of the generated points. The final coordinate $X_p$ encodes the height $z$: $X_p = z \sim U(0, h)$.

The radius at height $z$ scales linearly from zero (tip) to the base radius $r_b$: $r(z) = r_b\left(1 - z/h\right)$.

Each point is placed within a regular hexagon in the plane $(X_1, X_2)$, using a randomly chosen hexagon sector angle $\theta \in \{0, \pi/3, 2\pi/3, \pi, 4\pi/3, 5\pi/3\}$ and a uniformly random radial scaling factor: $\theta \sim \text{Uniform sample from 6 hexagon angles}$,
$r_{\text{point}} \sim \sqrt{U(0, 1)}$. Then, the first two coordinates are: $X_1 = r(z)r_{\text{point}}\cos(\theta)$, and $X_2 = r(z)r_{\text{point}}\sin(\theta)$. For dimensions $j = 3, \dots, p-1$, values are tapered toward zero near the tip: $X_j \sim U(-0.1, 0.1)\left(1 - z/h \right)$.

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


#### `gen_pyrholes()`

The `gen_pyrholes(n, p)` function generates $n$ points embedded in a $p\text{-}D$ simplex using a chaotic attractor-like midpoint algorithm. The result is a fractal-like structure that reveals holes or gaps in the data cloud, forming a "Sierpinski-like pyramid" in high dimensions.

Let $X_1, X_2, \dots, X_p$ denote the coordinates of the generated points. The generation process begins with an initial point $T_0 \in [0, 1]^p$ drawn from a uniform distribution: $T_0 \sim U(0, 1)^p$.

Let $C_1, C_2, \dots, C_{p+1}$ denote the corner vertices of a $p\text{-}D$ simplex. At each iteration $i = 1, \dots, n$, a new point is computed by taking the midpoint between the previous point $T_{i-1}$ and a randomly selected vertex $C_k$: $T_i = 1/2(T_{i-1} + C_k), \quad C_k \in \{C_1, \dots, C_{p+1}\}$. This recursive midpoint rule generates self-similar patterns with systematic voids (holes) between clusters of points. The points remain bounded inside the convex hull of the simplex. The final output is a $n \times p$ matrix where each row represents a point: $X = \{T_1, T_2, \dots, T_n\}, \quad X \in \mathbb{R}^{n \times p}$.


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
<img src="paper-cardinalR_files/figure-html5/fig-pyrholes-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `pyrrect`, `pyrtri`, `pyrstar`, and `pyrholes` data." width="100%" />
<p class="caption">(\#fig:fig-pyrholes-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `pyrrect`, `pyrtri`, `pyrstar`, and `pyrholes` data.</p>
</div>

</div>


### S-curve

An S-curve structure simulates data that lies along a smooth, non-linear manifold, making it a classic example for testing the performance of non-linear dimension reduction methods. This package provides functions to generate standard S-curve shapes as well as variants containing holes to introduce missing or incomplete regions. These variations are useful for evaluating how well algorithms capture non-linear geometry and handle incomplete manifolds in high-dimensional data. Table \@ref(tab:scurve-tb-html) summarizes these functions.

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


#### `gen_scurve()`

To simulate an S-curve structure in a higher-dimensional space, we define the function `gen_scurve(n, p)`, which generates $n$ observations in $p\text{-}D$. 

The $3\text{-}D$ geometry is constructed by introducing a latent parameter, $\theta \sim U\left(-3\pi/2, 3\pi/2\right)$. This parameter controls the curvature of the manifold. The first three dimensions form the S-curve structure: $X_1 = \sin(\theta)$, $X_2 \sim U(0, 2)$, $X_3 = \text{sign}(\theta)(\cos(\theta) - 1)$. This configuration creates a horizontally curled shape in $(X_1, X_3)$, with additional band thickness in the $X_2$ direction. For $p > 3$, additional noise dimensions are appended introducing structured, wavy noise.

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


#### `gen_scurvehole()`

To simulate a variant of the S-curve structure with a removed region ("hole"), we define the function `gen_scurvehole(n, p)`. This function produces $n$ observations in $p\text{-}D$ where the first three dimensions describe the S-curve manifold, and remaining dimensions add low-variance Gaussian noise. A subset of observations near a designated anchor point is excluded to introduce a hole in the manifold.

To simulate missing regions on the manifold, a fixed anchor point $(0, 1, 0, \ldots)$ is defined in $p\text{-}D$. All observations within a Euclidean distance of $\sqrt{0.3} \approx 0.5477$ from the anchor are removed if $\sum_{j=1}^p (X_j - a_j)^2 \leq 0.3$. This exclusion creates a hole in the manifold centered near the middle vertical region of the S-curve.

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
<img src="paper-cardinalR_files/figure-html5/fig-scurve-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `scurve` and `scurvehole` data." width="100%" />
<p class="caption">(\#fig:fig-scurve-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `scurve` and `scurvehole` data.</p>
</div>

</div>


### Sphere

Sphere-shaped structures are useful for evaluating how dimension reduction and clustering algorithms handle curved, symmetric manifolds in high-dimensional spaces. The package provides functions to generate a variety of spherical forms, including simple circles, uniform spheres, grid-based spheres, and complex arrangements like clustered spheres within a larger sphere. These shapes help test how well methods preserve symmetry, curvature, and cluster separation. Table \@ref(tab:sphere-tb-html) summarizes these functions.

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


#### `gen_circle()`

The function `gen_circle(n, p)` generates a $p$-dimensional dataset of $n$ observations, where the first two dimensions form a unit circle, and the remaining dimensions are structured sinusoidal extensions of the angular parameter with progressively smaller scale.

A latent angle variable $\theta$ is uniformly sampled from the interval $[0, 2\pi]$. Coordinates in the first two dimensions represent a perfect circle on the plane: $X_1 = \cos(\theta), \quad X_2 = \sin(\theta)$. For dimensions $X_3$ through $X_p$, sinusoidal transformations of the angle $\theta$ are introduced. The first component is a scaling factor that decreases with the dimension index, defined as $\text{scale}_j = \sqrt{(0.5)^{j-2}}$ for $j = 3, \dots, p$. The second component is a phase shift that is proportional to the dimension index, specifically designed to decorrelate the curves, given by the formula $\phi_j = (j - 2)\pi/2p$. Each additional dimension is computed as: $X_j = \text{scale}_{j}\sin(\theta + \phi_j), \quad j = 3, \dots, p$.

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


#### `gen_curvycycle()`

The `gen_curvycycle(n, p)` function generates a $p$-dimensional dataset of $n$ observations lying on a curved closed loop with controlled high-dimensional sinusoidal deviations. The structure forms a one-dimensional nonlinear cycle embedded in higher-dimensional space.

A latent angle variable $\theta$ is uniformly sampled from the interval $[0, 2\pi]$. The first three dimensions define a non-circular closed curve, referred to as a "curvy cycle." In this configuration, $X_1 = \cos(\theta)$ represents horizontal oscillation, while $X_2 = \sqrt{3}/3 + \sin(\theta)$ introduces a vertical offset to avoid centering the curve at the origin. Additionally, $X_3 = 1/3\cos(3\theta)$ introduces a third harmonic perturbation that intricately folds the curve three times along its path, creating a unique and complex shape that oscillates in both dimensions while incorporating the effects of the harmonic perturbation.

Together, these define a periodic, non-trivial, closed curve in $3\text{-}D$ with internal folds that produce a more complex geometry than a standard circle or ellipse. For dimensions $X_4$ through $X_p$, additional structured variability is introduced through decreasing amplitude scaling and phase-shifted sine waves. The scaling factor is defined as $\text{scale}_j = \sqrt{(0.5)^{j-3}}$ for $j$ ranging from $4$ to $p$, which means that the amplitude decreases as the dimension increases. Each dimension $X_j$ is then calculated using the formula $X_j = \text{scale}_j\sin(\theta + \phi_j)$, where the phase shift $\phi_j$ is given by $\phi_j = (j - 2)\pi/2p$. 

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


#### `gen_unifsphere()`

The `gen_unifsphere(n, p, r)` function generates a $p$-dimensional dataset of $n$ observations distributed approximately uniformly on the surface of a $3\text{-}D$ sphere of radius $r$, with additional Gaussian noise dimensions added when $p > 3$.

Each observation lies on the surface of a sphere in $3\text{-}D$, constructed by generating $u \sim U(-1, 1)$ which represents the cosine of the polar angle $\phi$ and $\theta \sim U(0, 2\pi)$ which represents the azimuthal angle. The corresponding Cartesian coordinates are calculated as; $X_1 = r\sqrt{1 - u^2}\cos(\theta)$, $X_2 = r\sqrt{1 - u^2}\sin(\theta)$, $X_3 = ru$, which gives points uniformly distributed on the surface of a $3\text{-}D$ sphere (not within). For $p > 3$, additional dimensions $X_4$ to $X_p$ are generated as low-variance Gaussian noise: $X_j \sim N(0, 0.05^2),\text{ for }j = 4, \dots, p$.

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


#### `gen_gridedsphere()`

The `gen_gridedsphere(n, p)` function generates a $p$-dimensional dataset of approximately $n$ observations evenly distributed on the surface of a $3\text{-}D$ unit sphere, with optional Gaussian noise dimensions when $p > 3$.

The base structure consists of a $3\text{-}D$ spherical surface created using a regular grid in spherical coordinates, where $\theta \in [0, 2\pi]$ represents the azimuthal angle and $\phi \in [0, \pi]$ denotes the polar angle.

The number of grid steps along each dimension is determined by factoring $n$ into two approximately equal integers via `gen_nproduct(n, p = 2)`.

Each point on the sphere is computed using the spherical-to-Cartesian transformation: $X_1 = \sin(\phi)\cos(\theta)$, $X_2 = \sin(\phi)\sin(\theta)$, $X_3 = \cos(\phi)$. For $p > 3$, the manifold is embedded in a higher-dimensional space by adding Gaussian noise dimensions: $X_j \sim N(0, 0.05^2),\text{ for }j = 4, \dots, p$.

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


#### `gen_clusteredspheres()`

The `gen_clusteredspheres(n, k, p, r, loc)` function generates a synthetic dataset of $n_1 + kn_2$ observations in $p$-dimensional space, consisting of one large sphere of radius $r_1$ and $k$ smaller spheres of radius $r_2$, each centered at a different random location.

A large uniform sphere centered at the origin is created by sampling $n_1$ points uniformly on the surface of a $p\text{-}D$ sphere with a radius of $r_1$. The sampling is executed using the function `gen_unifsphere(n_1, p, r_1)`, which generates the desired points in the specified dimensional space.

In generation of $k$ smaller uniform spheres, each sphere contains $n_2$ points that are sampled uniformly on a sphere with a radius of $r_2$. These spheres are positioned at distinct random locations in $p$-space, with the center of each sphere being drawn from a normal distribution $N(0, \texttt{loc}^2 I_p)$.
    
Points on spheres are generated using the standard hyperspherical method, which involves sampling $u \sim U(-1, 1)$ to determine the cosine of the polar angle, and sampling $\theta \sim U(0, 2\pi)$ to determine the azimuthal angle (for $3\text{-}D$). Each observation is classified by cluster, with labels such as "big" for the large central sphere and "small_1" to "small_k" for the smaller spheres.

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


#### `gen_hemisphere()`

The `gen_hemisphere(n, p)` function generates a $p$-dimensional dataset of $n$ observations distributed approximately uniformly on a $4\text{-}D$ hemisphere, optionally extended with Gaussian noise in additional dimensions when $p > 4$.

Each observation is situated on a restricted $4\text{-}D$ spherical surface, defined by spherical coordinates. The azimuthal angle $\theta_1 \sim U(0, \pi)$ in the $(x_1, x_2)$ plane, while the elevation angle $\theta_2 \sim U(0, \pi)$ in the $(x_2, x_3)$ plane. Additionally, $\theta_3 \sim U(0, \pi/2)$ in the $(x_3, x_4)$ plane, ensuring that the points remain restricted to a hemisphere. The coordinates are transformed into $4\text{-}D$ Cartesian space: $X_1 = \sin(\theta_1)\cos(\theta_2)$, $X_2 = \sin(\theta_1)\sin(\theta_2)$, $X_3 = \cos(\theta_1)\cos(\theta_3)$, $X_4 = \cos(\theta_1)\sin(\theta_3)$. This produces points on one side of a $4\text{-}D$ unit sphere, effectively generating a $4\text{-}D$ hemisphere. For $p > 4$, additional dimensions $X_5$ to $X_p$ are added as low-variance Gaussian noise: $X_j \sim N(0, 0.05^2),\text{ for }j = 5, \dots, p$.

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
<div class="figure" style="text-align: center">
<img src="paper-cardinalR_files/figure-html5/fig-hemisphere-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `circle`, `curvycycle`, `unifsphere`, `gridedsphere`, `clusteredspheres`, and `hemisphere` data." width="80%" />
<p class="caption">(\#fig:fig-hemisphere-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `circle`, `curvycycle`, `unifsphere`, `gridedsphere`, `clusteredspheres`, and `hemisphere` data.</p>
</div>

</div>


### Swiss Roll  

To further generalize the Swiss roll structure and introduce realistic noise, we define a function `gen_swissroll(n, p, w)`, where $n$ is the number of points, $p$ is the total number of dimensions, and $w$ is the vertical range in the third dimension. 
The first three dimensions form the classic $3\text{-}D$ Swiss roll shape. The $X_1 = t \cos(t)$, $X_2 = t \sin(t)$, $X_3 \sim U(w_1, w_2), \text{where } t \sim U(0, 3\pi)$. For $p > 3$, the remaining $p - 3$ dimensions are filled with small Gaussian noise to simulate high-dimensional complexity. 

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

Trigonometric-based structures provide flexible ways to simulate complex curved patterns and spirals that often arise in real-world high-dimensional data, such as in biological trajectories, or physical systems. The package includes functions to generate a wide range of these forms from crescents and curvy cylinders to spherical, helical, and conic spirals, as well as nonlinear hyperbolas. These structures are particularly valuable for testing how well dimension reduction and clustering algorithms preserve intricate geometric and topological features. Table \@ref(tab:trigonometric-tb-html) summarizes these functions.

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


#### `gen_crescent()`

The `gen_crescent(n, p)` function generates a $p$-dimensional dataset of $n$ observations based on a $2\text{-}D$ crescent-shaped manifold with optional structured high-dimensional noise.

The first two dimensions define a crescent-shaped curve using a semi-circular arc. Let $\theta \in [\pi/6, 2\pi]$ be a sequence of $n$ evenly spaced angles. The corresponding $2\text{-}D$ coordinates are defined by: $X_1 = \cos(\theta)$, $X_2 = \sin(\theta)$. For $p > 2$, additional dimensions $X_3$ to $X_p$ are generated using `gen_wavydims1()`: $X_j = s_j\theta + \varepsilon_j,\text{ where }\varepsilon_j \sim N(0, 0.5^2),\text{ and }s_j\text{ is a random scale}$. These noise dimensions are nonlinearly correlated with $\theta$, producing structured, wave-like variation that aligns with the progression along the crescent curve.

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


#### `gen_curvycylinder()`

The `gen_curvycylinder(n, p, h)` function generates a $p$-dimensional dataset of $n$ observations structured as a $3\text{-}D$ cylindrical manifold with an added nonlinear curvy dimension, and optional noise dimensions when $p > 4$.

The core structure consists of a circular base and height values, extended by a nonlinear fourth dimension. Let $\theta \sim U(0, 3\pi)$ represent a random angle on a circular base and $z \sim U(0, h)$ represent the height along the cylinder. The coordinates are defined as: $X_1 = \cos(\theta)$ (Circular base, x-axis), $X_2 = \sin(\theta)$ (Circular base, y-axis), $X_3 = z$ (Linear height), and $X_4 = \sin(z)$ (Nonlinear curvy variation along height). This forms a curvy cylindrical surface in $4\text{-}D$, where the fourth dimension bends periodically along the height axis, resembling a helicoid or twisting wave along the cylinder. For $p > 4$, dimensions $X_5$ through $X_p$ are generated as: $X_j \sim N(0, 0.05^2),\text{ for }j = 5, \ldots, p$.

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


#### `gen_sphericalspiral()`

The `gen_sphericalspiral(n, p, spins)` function simulates a dataset of $n$ observations that form a spiraling path on a spherical surface in the first four dimensions. When extended beyond $4\text{-}D$, structured nonlinear noise dimensions are added to simulate more realistic high-dimensional manifolds.

The first three dimensions represent points on a unit sphere. Let $\theta \in [0, 2\pi \times \text{spins}]$ be the azimuthal angle (longitude), controls the number of spiral turns and the $\phi \in [0, \pi]$be the polar angle (latitude), controls the vertical sweep from the north to the south pole.

Cartesian coordinates from spherical conversion: $X_1 = \sin(\phi)\cos(\theta)$, $X_2 = \sin(\phi)\sin(\theta)$, $X_3 = \cos(\phi) + \varepsilon$, where $\varepsilon \sim U(-0.5, 0.5)$ introduces vertical jitter, and $X_4 = \theta / \max(\theta)$: a normalized progression along the spiral path. This generates a spherical spiral curve embedded in $4\text{-}D$ space, combining both circular and vertical movement, with gentle curvature and non-linear progression.

If $p > 4$, the function appends structured, non-linear noise via `gen_wavydims2()`. These dimensions are functions of the first coordinate $X_1$, introducing dependencies that preserve some geometric coherence. Each added dimension follows the form: $X_j = s_j(-1)^{\lfloor j/2 \rfloor}X_1^{a_j} + \eta_j$, where $a_j \in \{2, 3, 4, 5\}$ is a randomly chosen polynomial power, $s_j \sim U(0.5, 2)$ is a scale factor, $\eta_j \sim U(-\sigma_j, 2\sigma_j)$, with $\sigma_j \sim U(0, 0.05)$, adds mild randomness.

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


#### `gen_helicalspiral()`

The `gen_helicalspiral(n, p)` function generates a dataset of $n$ observations forming a helical spiral, embedded in the first four dimensions of $p\text{-}D$. Additional dimensions (if $p > 4$) are filled with structured noise to mimic high-dimensional complexity.

The first four coordinates follow a $3\text{-}D$ helix with an additional oscillating component. Let $\theta \in [0, 5\pi/4]$ be a sequence of angles controlling rotation around a circle. Cartesian coordinates; $X_1 = \cos(\theta)$: circular trajectory along the x-axis, $X_2 = \sin(\theta)$: circular trajectory along the y-axis, $X_3 = 0.05\theta + \varepsilon_3$, with $\varepsilon_3 \sim U(-0.5, 0.5)$: linear progression (height) with vertical jitter, simulating a helix, and $X_4 = 0.1\sin(\theta)$: oscillates with $\theta$, representing a periodic "wobble" along the fourth dimension. This results in a helical spiral winding upward along the third axis, with gentle sinusoidal fluctuation in the fourth dimension. When $p > 4$, the remaining $p - 4$ dimensions are populated using `gen_noisedims()`. These are independent Gaussian noise dimensions: $X_j \sim N(0, 0.05^2), \quad j = 5, \dots, p$.

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


#### `gen_conicspiral()`

The `gen_conicspiral(n, p, spins)` function generates a dataset of $n$ points forming a conical spiral in the first four dimensions of $p\text{-}D$. The geometry combines radial expansion, vertical elevation, and spiral deformation, simulating a structure that fans out like a $3\text{-}D$ conic helix.

The shape is defined by parameter $\theta \in [0, 2\pi\text{spins}]$, controlling the angular progression of the spiral. The Archimedean spiral in the horizontal plane is represented by; $X_1 = \theta\cos(\theta)$ for radial expansion in x, and $X_2 = \theta\sin(\theta)$ for radial expansion in y. The growth pattern resembles a cone, with the height increasing according to $X_3 = 2\theta / \max(\theta) + \varepsilon_3$, with $\varepsilon_3 \sim U(-0.1, 0.6).$ Spiral modulation in the fourth dimension is represented by $X_4 = \theta\sin(2\theta) + \varepsilon_4$, with $\varepsilon_4 \sim U(-0.1, 0.6)$ which simulates a twisting helical component in a non-radial dimension. This results in a $3\text{-}D$ spiral surface expanding upward and outward like a cone, with an oscillatory fourth dimension capturing spiral irregularities. For $p > 4$, the dataset includes isotropic Gaussian noise in the remaining dimensions via `gen_noisedims()`: $X_j \sim N(0, 0.05^2), \quad j = 5, \dots, p$.

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


#### `gen_nonlinear()`

The `gen_nonlinear(n, p, hc, non_fac)` function simulates a non-linear $2\text{-}D$ surface embedded in higher dimensions, constructed using inverse and trigonometric transformations applied to independent variables.

The $X_{1} \sim U(0.1, 2)$: base variable (avoids zero to prevent division errors), $X_{3} \sim U(0.1, 0.8)$: independent auxiliary variable, $X_{2} = hc/X_{1} + \text{nonfac}\sin(X_{1})$: non-linear combination of hyperbolic and sinusoidal transformations, creating sharp curvature and oscillation, and $X_{4} = \cos(\pi X_{1}) + \varepsilon$, with $\varepsilon \sim U(-0.1, 0.1)$: additional nonlinear variation based on cosine, simulating more subtle periodic structure. These transformations together result in a non-linear surface warped in multiple ways: sharp vertical shifts due to inverse terms, smooth waves from sine and cosine, and additional jitter. If $p > 4$, the remaining dimensions are populated with Gaussian noise using `gen_noisedims()`: $X_j \sim N(0, 0.05^2), \quad j = 5, \dots, p$.

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
<div class="figure" style="text-align: center">
<img src="paper-cardinalR_files/figure-html5/fig-triginometric-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `crescent`, `curvycylinder`, `sphericalspiral`, `helicalspiral`, `conicspiral`, and `nonlinear` data." width="80%" />
<p class="caption">(\#fig:fig-triginometric-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `crescent`, `curvycylinder`, `sphericalspiral`, `helicalspiral`, `conicspiral`, and `nonlinear` data.</p>
</div>

</div>


### Trefoil knots

<!--https://laustep.github.io/stlahblog/posts/TorusKnot4D.html-->

The Trefoil is a closed, nontrivial one-dimensional manifold embedded in $3\text{-}D$ or $4\text{-}D$ space. The trefoil features topological complexity in the form of self-overlaps, making it a valuable test case for evaluating the ability of NLDR methods to preserve global structure, loops, and embeddings in high-dimensional data. Table \@ref(tab:trefoil-tb-html) summarizes these functions.

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:trefoil-tb-html)cardinalR trefoil data generation functions

|Function      |Explanation                         |
|:-------------|:-----------------------------------|
|gen_trefoil4d |Generate a trefoil in $4\text{-}D$. |
|gen_trefoil3d |Generate a trefoil in $3\text{-}D$. |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


#### `gen_trefoil4d()`

The function `gen_trefoil4d()` generates a $4\text{-}D$ trefoil knot using two angular parameters, $\theta$ and $\phi$. The knot is constructed on the $3$-sphere ($S^3 \subset \mathbb{R}^4$), with a band of thickness around the knot path, controlled by `steps`.

The coordinates of the $4\text{-}D$ trefoil knot are defined as $X_1 = \cos(\theta) \cos(\phi)$, $X_2 = \cos(\theta) \sin(\phi)$, $X_3 = \sin(\theta) \cos(1.5 \phi)$, and $X_4 = \sin(\theta) \sin(1.5 \phi)$, where $\theta$ and $\phi$ are angular parameters that trace out the knot's structure on the $3$-sphere $S^3 \subset \mathbb{R}^4$.

The number of `theta` and `phi` values is determined by the `steps` and `n` arguments, respectively. Additional independent noise dimensions can be added via `gen_noisedims()` to extend the structure into $p > 4$ dimensions.

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>trefoil4d</span> <span class='op'>&lt;-</span> <span class='fu'>gen_trefoil4d</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>500</span>, p <span class='op'>=</span> <span class='fl'>4</span>, steps <span class='op'>=</span> <span class='fl'>5</span><span class='op'>)</span></span></code></pre></div>

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">


</div>


#### `gen_trefoil3d()`

The function `gen_trefoil3d()` generates a $3\text{-}D$ stereographic projection of the $4\text{-}D$ trefoil knot by mapping each point $(X_1, X_2, X_3, X_4) \in \mathbb{R}^4$ to $(X_1', X_2', X_3') \in \mathbb{R}^3$ using the transformation $X_1' = X_1 / (1 - X_4)$, $X_2' = X_2 / (1 - X_4)$, and $X_3' = X_3 / (1 - X_4)$, while excluding points where $X_4 = 1$ to avoid division by zero.

<div class="layout-chunk" data-layout="l-body">
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span><span class='va'>trefoil3d</span> <span class='op'>&lt;-</span> <span class='fu'>gen_trefoil3d</span><span class='op'>(</span>n <span class='op'>=</span> <span class='fl'>500</span>, p <span class='op'>=</span> <span class='fl'>4</span>, steps <span class='op'>=</span> <span class='fl'>5</span><span class='op'>)</span></span></code></pre></div>

</div>


As with the $4\text{-}D$ version, this function supports optional noise dimensions to embed the projected knot into higher dimensions.

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
<img src="paper-cardinalR_files/figure-html5/fig-trefoil-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the `trefoil4d` and `trefoil3d` data." width="100%" />
<p class="caption">(\#fig:fig-trefoil-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the `trefoil4d` and `trefoil3d` data.</p>
</div>

</div>


### Multiple cluster examples

By using the shape generators mentioned above, we can create various examples of multiple clusters. The package includes some of these examples, which are described in Table \@ref(tab:odd-shape-tb-html).

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:odd-shape-tb-html)cardinalR multiple clusters generation functions

|Function              |Explanation |
|:---------------------|:-----------|
|make_mobiusgau        |            |
|make_multigau         |            |
|make_curvygau         |            |
|make_klink_circles    |            |
|make_chain_circles    |            |
|make_klink_curvycycle |            |
|make_chain_curvycycle |            |
|make_gaucircles       |            |
|make_gaucurvycycle    |            |
|make_onegrid          |            |
|make_twogrid_overlap  |            |
|make_twogrid_shift    |            |
|make_shape_para       |            |
|make_three_clust_     |            |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


### Additional functions

The package includes various supplementary tools in addition to the shape generating functions mentioned earlier. These tools allow users to generate noise dimensions with a normal distribution and various wavy patterns, create background noise, randomize the rows of the data, reposition clusters, generate a vector whose product and sum are approximately equal to a target value, rotate structures, and normalize the data. Table \@ref(tab:add-tb-html) details these functions.

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

<!-- ## Assessing the performance of dimension reduction on different geometric structures in high-dimensions -->

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
<img src="paper-cardinalR_files/figure-html5/fig-highd-proj-1.png" alt="Three $2\text{-}D$ projections from $4\text{-}D$, for the five clusters data. The helical spiral cluster is represented in dark green, the hemisphere cluster in orange, the uniform cube-shaped cluster in purple, the blunted cone cluster in pink, and the Gaussian-shaped cluster in light green." width="100%" />
<p class="caption">(\#fig:fig-highd-proj)Three $2\text{-}D$ projections from $4\text{-}D$, for the five clusters data. The helical spiral cluster is represented in dark green, the hemisphere cluster in orange, the uniform cube-shaped cluster in purple, the blunted cone cluster in pink, and the Gaussian-shaped cluster in light green.</p>
</div>

</div>


The five clusters have different geometric structures and each contain different number of points. Specifically, the helical spiral cluster includes $2250$ points and was generated with a scale parameter of $0.4$. The hemisphere cluster consists of $1500$ points with a scale parameter of $0.35$. The uniform cube-shaped cluster contains $750$ points and uses a scale parameter of $0.3$. The blunted cone cluster includes $1250$ points, generated with a scale parameter of $1$. Finally, the Gaussian-shaped cluster contains $1750$ points and was generated with a scale parameter of $0.3$.

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">
<div class="figure">
<img src="paper-cardinalR_files/figure-html5/fig-nldr-layouts-1.png" alt="Six different dimension reduction representations of the five clusters data using default hyperparameter settings: (a) tSNE, (b) UMAP, (c) PAHTE, (d) TriMAP, (e) PaCMAP, and (f) PCA." width="100%" />
<p class="caption">(\#fig:fig-nldr-layouts)Six different dimension reduction representations of the five clusters data using default hyperparameter settings: (a) tSNE, (b) UMAP, (c) PAHTE, (d) TriMAP, (e) PaCMAP, and (f) PCA.</p>
</div>

</div>


UMAP, PHATE, TriMAP, and PaCMAP effectively separate the five clusters and show the preservation of the global structure (Figure \@ref(fig:fig-nldr-layouts)). However, PHATE reveals three non-linear clusters, even though two of them do not show non-linearity. UMAP, TriMAP, and PaCMAP successfully maintain the local structures of the data. In contrast, tSNE divides the non-linear cluster into sub-clusters. Also, tSNE fails to preserve the distances between the clusters. PCA, on the other hand, preserves the local structures of the clusters, but some clusters are incorrectly merged that should remain distinct.

# Conclusion

The `cardinalR` package contributes a flexible and extensible framework for generating high-dimensional data structures with well-defined geometric properties. It addresses a growing need in the evaluation of machine learning, clustering, and nonlinear dimensionality reduction (NLDR) methods—offering researchers the ability to design customized datasets with interpretable structures, noise characteristics, and clustering arrangements. This makes `cardinalR` a useful complement to existing tools like `geozoo`, `snedata`, and `mlbench`, expanding the scope to higher dimensions and more complex shapes.

The suite of included structures is diverse and targeted. For example, **branching shapes** allow investigation of continuity and topological preservation in low-dimensional embeddings. The **S-curve with a hole** enables exploration of how methods handle incomplete manifolds. **Clustered spheres** assess cluster separation on curved surfaces, while the **Möbius strip** challenges NLDR methods with non-orientable geometry. **Gridded cubes** test spatial regularity, and **pyrholes** represent non-convex, sparse shapes useful for testing clustering performance in irregular high-dimensional regions.

These structures are not only valuable for algorithm diagnostics but may also be used for **teaching high-dimensional concepts**, **benchmarking reproducibility**, and **evaluating hyperparameter sensitivity**. The package's design encourages users to adjust dimensionality, noise, sample size, and clustering properties, promoting **transparent experimentation** and **comparative model evaluation**.

Looking ahead, future extensions of `cardinalR` could incorporate dynamic shape generation, integration with supervised learning simulations, or visual interfaces to assist users in interactively exploring generated structures. Expanding the library to include more biologically inspired or real-world data analogs may also broaden its utility across domains like bioinformatics, forensic science, and spatial data analysis.

<!-- - Branching: These functions create a controlled environment for testing how effectively various algorithms preserve branching topology and continuity in their low-dimensional embeddings. -->

<!-- - Scurve with a hole allowing for evaluation of how well algorithms handle incomplete manifolds or missing local structure. -->

<!-- - clusteredsphere: This structure allows for cluster separation on curved manifolds in high-dimensional space and can be used to test the ability of NLDR methods and clustering algorithms to detect spherical clusters of different sizes and separations. -->

<!-- - Mobius: The core geometric structure is a Mobius strip—a classic one-sided surface with a half-twist—useful for evaluating how well methods capture non-orientability and twisted manifolds. -->

<!-- - Grided cube: This function is useful for assessing how algorithms preserve uniformly spaced data in high-dimensional spaces. -->

<!-- - Pyrholes: This structure is useful for testing clustering and NLDR algorithms on non-convex and sparse high-dimensional shapes. -->

<!-- The application of our high-dimensional data generation package to evaluate the interplay between dimensionality reduction, nuisance variables, and hierarchical clustering yielded several key insights. The ability to generate synthetic datasets with well-defined underlying structures, coupled with the controlled introduction of nuisance variables, provided a valuable platform for assessing the robustness of downstream unsupervised learning techniques. -->

<!-- Our findings demonstrated that the choice of dimensionality reduction method significantly impacted the ability of hierarchical clustering to recover the true underlying clusters. Methods that effectively preserved the global structure of the data, as defined by our generation process, generally led to more accurate and interpretable hierarchical clustering results. However, the presence of nuisance variables often confounded the low-dimensional embeddings, making it more challenging for hierarchical clustering to separate truly distinct groups. This highlights a critical consideration in real-world data analysis, where unmeasured or latent factors can obscure the signal of interest. -->

<!-- The hierarchical clustering analysis itself, and the choice of linkage criteria, also played a crucial role. Different linkage methods revealed varying degrees of sensitivity to the distorted representations caused by the nuisance variables. For instance, methods that prioritize compact clusters might have been more susceptible to being misled by variance introduced by nuisance factors, while others focusing on the distance between clusters might have shown more resilience. The dendrograms generated by hierarchical clustering provided a visual means to explore the relationships between samples and the potential influence of nuisance, although determining the optimal number of clusters remained a challenge in the presence of these confounding factors. -->

<!-- This application underscores the utility of our data generation package as a powerful tool for controlled experimentation in unsupervised learning. By providing the ground truth cluster assignments and the ability to systematically manipulate data characteristics like dimensionality, geometric structure, and the presence of nuisance variables, researchers can gain a deeper understanding of the strengths and limitations of various DR and clustering algorithms. This controlled environment allows for a more objective evaluation than often possible with real-world datasets where the underlying structure is unknown. -->

<!-- One limitation of this particular application was the specific type and magnitude of the nuisance variables introduced. Future work could explore a wider range of nuisance types (e.g., batch effects, technical noise with specific distributions) and their varying degrees of influence on different DR and clustering methodologies. Furthermore, investigating strategies for mitigating the impact of nuisance variables, either during the DR step or within the clustering process itself, would be a valuable extension. -->

<!-- In conclusion, this example demonstrates the critical role of synthetic data generation in dissecting the complex interactions within unsupervised learning pipelines. Our package provides a flexible and controlled means to create such data, enabling researchers to systematically evaluate the performance and robustness of dimensionality reduction and clustering algorithms under well-defined conditions, including the presence of confounding factors. This capability contributes to a more rigorous and informed approach to high-dimensional data analysis. -->

# Acknowledgements

The source material for this paper is available at [https://github.com/JayaniLakshika/paper-cardinalR](https://github.com/JayaniLakshika/paper-cardinalR).

These `R` packages were used for this work: `cli` [@gabor2025], `tibble` [@kirill2023], `gtools` [@gregory2023], `dplyr` [@hadley2023], `stats` [@core2025], `tidyr` [@hadley2024], `purrr` [@hadley2025], `mvtnorm` [@alan2009], `geozoo` [@barret2016], and `MASS` [@venables2002]. This article is created using \CRANpkg{knitr} [@yihui2015] and \CRANpkg{rmarkdown} [@yihui2018] in R with the `rjtools::rjournal_article` template. 
```{.r .distill-force-highlighting-css}
```


## CRAN packages used {.appendix}

[knitr](https://cran.r-project.org/package=knitr), [rmarkdown](https://cran.r-project.org/package=rmarkdown)

## CRAN Task Views implied by cited packages {.appendix}

[ReproducibleResearch](https://cran.r-project.org/view=ReproducibleResearch)




