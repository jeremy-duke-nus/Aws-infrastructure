FROM rocker/rstudio:latest

# Add custom R packages that are required for typical day to day analysis
RUN R -e "install.packages(c('tidyverse', 'magrittr', 'BiocManager'))"
RUN R -e "BiocManager::install(c('Seurat', 'TxDb.Hsapiens.UCSC.hg38.knownGene', 'GO.db', 'org.Hs.eg.db'))"