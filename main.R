library(scater)
library(tidyr)
library(dplyr)
library(tercen)

(ctx = tercenCtx())

logged_values <- as.logical(ctx$op.value('logged_values'))
centre_size_factors <- as.logical(ctx$op.value('centre_size_factors'))

count_matrix <- ctx$as.matrix()

logcounts <- normalizeCounts(count_matrix,
                             librarySizeFactors(count_matrix),
                             centre_size_factors = centre_size_factors,
                             return_log = logged_values)

output <- logcounts %>%
  as_tibble() %>%
  dplyr::mutate(.ri = 0:(n()-1)) %>%
  gather(key = "column", value = "logcounts", -.ri) %>%
  dplyr::mutate(.ci = as.integer(as.integer(stringr::str_remove(column, "V")) - 1)) %>%
  select(-column)

ctx$addNamespace(output) %>%
  ctx$save()
