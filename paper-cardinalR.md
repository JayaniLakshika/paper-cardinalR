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
type: application
creative_commons: CC BY
date: '2025-03-11'
preamble: |
  \usepackage{amsmath} \usepackage{array}
output:
  distill::distill_article:
    css: style.css
    keep_md: yes
bibliography: RJreferences.bib
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

# Background

# Methods

# Discussion

# Code

The code is available at <https://github.com/JayaniLakshika/cardinalR>, and source material for this paper is available at <https://github.com/JayaniLakshika/paper-cardinalR>.

# Acknowledgements

This article is created using \CRANpkg{knitr} [@knitr] and \CRANpkg{rmarkdown} [@rmarkdown] in R with the `rjtools::rjournal_article` template. 
```{.r .distill-force-highlighting-css}
```


## CRAN packages used {.appendix}

[knitr](https://cran.r-project.org/package=knitr), [rmarkdown](https://cran.r-project.org/package=rmarkdown)

## CRAN Task Views implied by cited packages {.appendix}

[ReproducibleResearch](https://cran.r-project.org/view=ReproducibleResearch)




