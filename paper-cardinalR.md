---
title: 'cardinalR: Generating interesting high-dimensional data structures'
description: |
  A high-dimensional dataset is where each observation is described by many features, or dimensions. Such a dataset might contain various types of structures that have complex geometric properties, such as nonlinear manifolds, clusters, or sparse distributions. We can generate data containing a variety of structures using mathematical functions and statistical distributions. Sampling from a multivariate normal distribution will generate data in an elliptical shape. Using a trigonometric function we can generate a spiral. A torus function can create a donut shape. High-dimensional data structures are useful for testing, validating, and improving algorithms used in dimensionality reduction, clustering, machine learning, and visualization. Their controlled complexity allows researchers to understand challenges posed in data analysis and helps to develop robust analytical methods across diverse scientific fields like bioinformatics, machine learning, and forensic science. Functions to generate a large variety of structures in high dimensions are organized into the R package `cardinalR`, along with some already generated examples.
draft: yes
author:
- name: Jayani P.G. Lakshika
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
date: '2025-04-20'
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


# Introduction

Generating synthetic datasets with clearly defined geometric properties is essential for evaluating and benchmarking algorithms in various fields, such as machine learning, data mining, and computational biology. Researchers often need to generate data with specific dimensions, noise characteristics, and complex underlying structures to test the performance and robustness of their methods.

There are numerous packages available in R for generating synthetic data, each designed with unique characteristics and focus areas. For example, `geozoo` (@barret2016) offers a large collection of geometric objects, allowing users to create and analyze specific shapes, primarily in lower-dimensional spaces. Another useful package is `snedata` (@james2025), which provides tools for generating simplified datasets useful for evaluating dimensionality reduction techniques like tSNE, often focusing on understanding and evaluating low-dimensional embeddings of complex data structures. Additionally, `mlbench` (@friedrich2024) includes a collection of well-known benchmark datasets commonly associated with established classification or regression challenges. In the field of single-cell omics, `splatter` (@luke2017) is particularly simulate complex biological data, effectively capturing nuances such as batch effects and differential expression.

There is a valuable opportunity to improve the generation of high-dimensional data structures by integrating geometric principles with advanced noise control and customizable clustering. The `geozoo` package provides a strong foundation but could be enhanced to support high-dimensional extensions with controlled noise and user-defined parameters for clustering. Similarly, while `snedata` focuses on abstract datasets for dimensionality reduction, adding features for generating high-dimensional data from geometric layouts would enhance its usability. The `mlbench` package could also benefit from allowing users to create datasets with specific geometric structures and noise profiles. Additionally, although `splatter` specializes in biological data simulation, it could be expanded to offer a broader framework for generating diverse geometric structures across dimensions, enabling detailed control over noise and clustering. Addressing these areas could lead to more robust high-dimensional data generation tools.

To address this gap, this paper introduces the `cardinalR` R package. This package provides a collection of functions designed to generate customizable data structures in any number of dimensions, starting from basic geometric shapes. `cardinalR` offers important functionalities that extend beyond the capabilities of existing tools, allowing users to: (i) construct high-dimensional datasets based on geometric shapes, including the option to enhance dimensionality by adding controlled noise dimensions; (ii) introduce adjustable levels of background noise to these structures; and (iii) create complex clustered data arrangements by using fundamental geometric forms, while maintaining their positions, scales, orientations, and sample sizes in arbitrary dimensional spaces. By providing these integrated features, `cardinalR` aims to provide researchers to generate more explainable and challenging synthetic datasets focused to the specific needs of evaluating algorithms in high-dimensions. This bridges the gap between geometric foundations and the flexible generation of complex synthetic data.

The paper is organized as follows. In next section, introduces the implementation of `cardinalR` package on CRAN and GitHub, including demonstration of the package's key functions. We illustrate how a clustering data structure affect the Non-linear dimension reductions in **Example** section. Finally, we give a brief conclusion of the paper and discuss potential opportunities for use of our data collection.

# Implementation

## Installation

The package can be installed from CRAN using 

> ```install.packages("cardinalR")```

and from GitHub using 

> ```remotes::install_github("jayanilakshika/cardinalR")```

to install the development version.

## Web site

More documentation of the package can be found at the web site https://jayanilakshika.github.io/cardinalR/.

## Data sets

The `cardinalR` package comes with several data sets that load with the package. These are described in Table \@ref(tab:datasets-tb-html).

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:datasets-tb-html)cardinalR data sets

|data                     |explanation |
|:------------------------|:-----------|
|mobius_clust_data        |            |
|mobius_clust_tsne_param1 |            |
|mobius_clust_tsne_param2 |            |
|mobius_clust_tsne_param3 |            |
|mobius_clust_umap_param1 |            |
|mobius_clust_umap_param2 |            |
|mobius_clust_umap_param3 |            |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>


## Functions

### Main function

### Branching

<div class="layout-chunk" data-layout="l-body">


</div>


<div class="layout-chunk" data-layout="l-body">

Table: (\#tab:branching-tb-html)cardinalR branching data generation functions

|Function              |Explanation |
|:---------------------|:-----------|
|gen_expbranches       |            |
|gen_linearbranches    |            |
|gen_curvybranches     |            |
|gen_orglinearbranches |            |
|gen_orgcurvybranches  |            |

</div>


<div class="layout-chunk" data-layout="l-body">


</div>



### Cone

### Cube

### Gaussian

### Linear

### Mobius

### Polynomial

### Pyramid

### S-curve

### Sphere

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

### Odd shapes

### Additional functions

# Example

Add one or two datasets and evaluate how it will be useful.... (one with NLDR, one with clustering)

# Discussion

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




