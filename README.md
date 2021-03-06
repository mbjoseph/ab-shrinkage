Partial pooling for NBA freethrows
================

This repository contains code to generate the slides for a presentation
“Sporstcasters don’t get shrinkage” to Analyze Boulder on 2016-12-07.

### Making the slides

The slides are produced from R Markdown (`slides.Rmd`), which requires
that you have LaTeX, beamer, and the following R packages installed from
CRAN:

``` r
install.packages(c("ggplot2", "tidyr", "dplyr", "rstan", 
                   "modeest", "rmarkdown", "viridis", "flux", 
                   "Lahman", "bayesplot", "devtools", "knitr"))
```

The basketball data are scraped using an in-development package
[`bbr`](https://www.github.com/mbjoseph/bbr), which can be installed
directly from GitHub using devtools:

``` r
devtools::install_github("mbjoseph/bbr")
```

Once the dependencies are satisfied, knit the document with:

``` r
rmarkdown::render("slides.Rmd")
```

If this runs successfully, you will see a pdf in the top level
directory: `slides.pdf`.

### I don’t want to make the slides, I just want to download them!

You can download the pdf here:
<https://dl.dropboxusercontent.com/u/18637425/ab-shrinkage-slides.pdf>
