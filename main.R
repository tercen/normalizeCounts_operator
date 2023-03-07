suppressPackageStartupMessages(expr = {
  library(Seurat)
  library(tidyr)
  library(dplyr)
  library(tercen)
})

source("./utils.R")

ctx = tercenCtx()

obj <- as_Seurat(ctx)

normalization.method <- ctx$op.value("normalization.method", as.character, "LogNormalize")
scale.factor <- ctx$op.value("scale.factor", as.double, 10000)

obj <- NormalizeData(
  obj,
  normalization.method = normalization.method,
  scale.factor = scale.factor,
  verbose = FALSE
)

obj %>%
  seurat_to_tercen() %>%
  as_tibble() %>%
  rename(.ci = j, .ri = i, value = x) %>%
  mutate(.ci = .ci - 1L, .ri = .ri - 1L) %>%
  ctx$addNamespace() %>%
  ctx$save()