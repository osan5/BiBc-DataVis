library(ggplot2)

data <- read.csv('ensembl-gtp.csv')
df <- as.data.frame(data)

unique_genes <- unique(df$gene)
unique_transcripts <- unique(df$transcript)
unique_proteins <- unique(df$protein)

gene_count <- length(unique_genes)
transcript_count <- length(unique_transcripts)
protein_count <- length(unique_proteins)

category_list <- c('Genes','Transcipts','Proteins')
category <- factor(category_list, ordered = TRUE,levels = c('Genes','Transcipts','Proteins'))
counts <- c(gene_count,transcript_count,protein_count)

df_counts <- data.frame(category,counts)

ggplot(df_counts, aes(x=category,y=counts)) + geom_col(aes(fill=category)) + ggtitle('Drosophila Melanogaster Genome Annotation')
