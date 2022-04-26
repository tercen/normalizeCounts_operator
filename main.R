library(SingleCellExperiment)
library(scater)
library(tidyr)
library(dplyr)
library(tercen)

ctx <- tercenCtx()

log.par <- ctx$op.value('log', as.logical, TRUE)
center.size.factors <- ctx$op.value('center.size.factors', as.logical, TRUE)

count_matrix <- ctx$as.matrix()

logcounts <- scater::normalizeCounts(
  count_matrix,
  librarySizeFactors(count_matrix),
  log = log.par,
  center.size.factors = center.size.factors
)

output <- logcounts %>%
  as_tibble() %>%
  dplyr::mutate(.ri = 0:(n() - 1)) %>%
  gather(key = "column", value = "normalised_counts", -.ri) %>%
  dplyr::mutate(.ci = as.integer(as.integer(stringr::str_remove(column, "V")) - 1)) %>%
  select(-column)

ctx$addNamespace(output) %>%
  ctx$save()