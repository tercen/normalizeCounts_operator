# scRNA-seq normalisation operator

##### Description
`scRNA-seq normalisation` performs library-size normalisation on single-cell RNA-seq count data and returns the logged (optional), normalized counts of the filtered cells and genes.

##### Usage

Input projection|.
---|---
`y-axis`              | numeric, count data, per cell 
`column names`        | character, cell ID
`row names`           | character, gene ID

| Input parameters | Description                                                                              |
| -----------------| ---------------------------------------------------------------------------------------- |
| `logged_values`  | Logical, whether the counts should be logged as well as library-size normalised (default = TRUE) |
| `centre_size_factors`  | Logical, whether the calculated size factors should be centered (default = TRUE) |


Output relations|.
---|---
`logcounts` | numeric, normalised count data, per cell 



##### Details
The operator uses the normalisation worklfow described in the corresponding chapter of the ["Orchestrating Single-Cell Analysis"](https://osca.bioconductor.org/normalization.html) book. For this it uses the _scRNAseq_ BioConductor package.

#### References
Amezquita, et. al. ["Orchestrating single-cell analysis with BioConductor"](https://www.nature.com/articles/s41592-019-0654-x), Nature Methods (2019)

##### See Also

#### Examples