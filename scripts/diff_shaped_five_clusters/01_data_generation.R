library(cardinalR)
library(readr)
set.seed(20240412)

positions <- geozoo::simplex(p=4)$points

## To generate data
five_clusts <- gen_multicluster(n = c(450, 300, 150, 250, 350), p = 4, k = 5,
                       loc = positions,
                       scale = c(0.4, 0.35, 0.3, 1, 0.3),
                       shape = c("helicalspiral", "hemisphere", "unifcube", "bluntedcone", "gaussian"),
                       rotation = NULL,
                       is_bkg = FALSE)

langevitour::langevitour(five_clusts[, -5])

## Run only once
write_rds(five_clusts, "data/five_clusts.rds")
