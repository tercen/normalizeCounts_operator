# scRNA-seq normalisation

##### Description

`scRNA-seq normalisation` performs library-size normalisation on single-cell RNA-seq count data and returns the logged (optional), normalized counts of the filtered cells and genes.

##### Usage

Input projection|.
---|---
`y-axis`        | numeric, count data
`columns`        | character, cell ID
`rows`           | character, gene ID

Input parameters | Description                                                               
---|---
`logged_values`  | Logical, whether the counts should be logged as well as library-size normalised (default = TRUE)
`centre_size_factors`  | Logical, whether the calculated size factors should be centered (default = TRUE)

Output relations|.
---|---
`value` | numeric, normalised count data, per cell 


##### Details

The operator uses the `Seurat` R package and the preprocessing workflow described in the ["package website"](https://satijalab.org/seurat/).

##### References

> Hao, Y., Hao, S., Andersen-Nissen, E., Mauck, W. M., Zheng, S., Butler, A., ... & Satija, R. (2021). Integrated analysis of multimodal single-cell data. Cell, 184(13), 3573-3587.

[Link to Seurat reference](https://doi.org/10.1016/j.cell.2021.04.048)
