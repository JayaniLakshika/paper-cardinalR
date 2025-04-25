library(cardinalR)
library(readr)
set.seed(20240412)

positions <- geozoo::simplex(p=4)$points[1:3, ]
positions <- positions * 0.8

## To generate data
three_clusts <- gen_multicluster(n = c(750, 500, 250), p = 4, k = 3,
                       loc = positions,
                       scale = c(1, 1, 0.3),
                       shape = c("nonlinear", "pyrtri", "gaussian"),
                       rotation = NULL,
                       is_bkg = FALSE)

noise_df <- gen_noisedims(n = 1500, p = 3, m = rep(0, 3), s = rep(0.1, 3))
names(noise_df) <- paste0("x", 5:7)

three_clusts <- dplyr::bind_cols(three_clusts, noise_df)

three_clusts <- three_clusts |>
  dplyr::select(c(tidyselect::starts_with("x"), "cluster"))

three_clusts <- normalize_data(data = three_clusts)

langevitour::langevitour(three_clusts[, -8])

## Run only once
write_rds(three_clusts, "data/three_clusts/three_clusts.rds")
