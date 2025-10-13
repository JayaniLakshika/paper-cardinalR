library(tidyverse)
library(reticulate)
library(here)

set.seed(20240412)

# Configure Python
use_python("~/miniforge3/envs/pcamp_env/bin/python")
use_condaenv("pcamp_env")

# Run the Python evaluation script
py_run_file("~/Desktop/PhD Monash research files/Research papers/paper-nldr-vis-algorithm/scripts/evaluation.py")

# Load data
data <- read_rds(here("data/five_clusts/five_clusts.rds"))
data_features <- data |> select(-cluster)

# Define list of DR methods and file paths
dr_methods <- c(
  tSNE   = "data/five_clusts/five_clusts_tsne_perplexity_30.rds",
  UMAP   = "data/five_clusts/five_clusts_umap_n-neigbors_15_min-dist_0.1.rds",
  PHATE  = "data/five_clusts/five_clusts_phate_knn_5.rds",
  TriMAP = "data/five_clusts/five_clusts_trimap_n-inliers_12_n-outliers_4_n-random_3.rds",
  PaCMAP = "data/five_clusts/five_clusts_pacmap_n-neighbors_10_init_random_MN-ratio_0.5_FP-ratio_2.rds",
  PCA    = "data/five_clusts/five_clusts_pca.rds"
)

# Loop over methods and combine results
all_results <- map2_dfr(names(dr_methods), dr_methods, ~{
  dr_data <- read_rds(.y) |> select(-cluster)
  py$evaluate_output(
    X       = as.matrix(data_features),
    X_new   = as.matrix(dr_data),
    y       = data$cluster,
    name    = .x,
    baseline = FALSE,
    labelled = TRUE
  )
})

# Create an instance of the Python class
my_instance <- py$MyClass()

all_results_gl <- map2_dfr(names(dr_methods), dr_methods, ~{
  dr_data <- read_rds(.y) |> select(-cluster)
  list(
    name = .x,
    global_score = my_instance$global_score(
    as.matrix(data_features),
    as.matrix(dr_data)
  ))
})

# View results
all_results <- all_results |>
  select(-knn) |>
  distinct()

all_results <- dplyr::inner_join(all_results, all_results_gl, by = "name")

write_rds(all_results, "data/five_clusts/dr_summary.rds")
