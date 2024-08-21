FROM rocker/rstudio:latest

# Add custom R packages that are required for typical day to day analysis
RUN R -e "install.packages(c('tidyverse', 'magrittr', 'BiocManager'))"
RUN R -e "BiocManager::install(c('Seurat', 'TxDb.Hsapiens.UCSC.hg38.knownGene', 'GO.db', 'org.Hs.eg.db'))"

# Example: Expose a port
EXPOSE 3838

# Example: Set the entrypoint command
CMD ["R", "-e", "shiny::runApp('/app', port = 3838, host = '0.0.0.0')"]