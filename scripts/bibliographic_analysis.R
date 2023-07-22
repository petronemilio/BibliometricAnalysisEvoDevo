#Load bibliographic library
library(bibliometrix)
library(ggplot2)
#Set directory to fil location
#getwd()
#####Script to analyze publications in the evodevo field
#Keywords use to download the data were:
#
data_evodevo<-"../data/scopus_210723.bib" 
#
M <- convert2df(file = data_evodevo, dbsource = "scopus", format = "bibtex")
# Create keyword co-occurrences network
results <- biblioAnalysis(M, sep = ";")
#
S <- summary(object = results, k = 10, pause = FALSE)
plot(x = results, k = 10, pause = FALSE)
##
NetMatrix <- biblioNetwork(M, analysis = "co-occurrences", network = "keywords", sep = ";")
# Plot the network
net<-networkPlot(NetMatrix, normalize="association", weighted=T, n = 30, Title = "Keyword Co-occurrences", type = "fruchterman", size=T,edgesize = 5,labelsize=0.7)
#
CS <- conceptualStructure(M,field="ID", method="CA", minDegree=4, clust=5, stemming=FALSE, labelsize=10, documents=10)
#Plot histogram
###Plotting histogram of common words
# get the unique strings
string <- unique(unlist(strsplit(M$DE,'; ')))
# create a list with the rows for each unique string
lst <- lapply(string, function(x) grep(x, M$DE, fixed = TRUE))
# get the counts for each string
count <- lengths(lst)
# collpase the list string positions into a string with the rownumbers for each string
pos <- sapply(lst, toString)
# put everything together in one dataframe
d <- data.frame(string, count, pos)
d <- subset(d, d$count > 25)
d <- subset(d, d$string != "NA")
#
# Create factor column with decreasing order TRUE
d$string <- factor(d$string, levels = d$string[order(d$count, decreasing = TRUE)])
#   
ggplot(data= d)+
  aes(x= string, y= count) + 
  geom_bar(stat = "identity") + coord_flip()
#

###### Repeat analysis with the bibliography of specialized journals
data_evodevo<-"../data/scopus_specializedjournals.bib" 
#
M <- convert2df(file = data_evodevo, dbsource = "scopus", format = "bibtex")
# Create keyword co-occurrences network
results <- biblioAnalysis(M, sep = ";")
#
S <- summary(object = results, k = 10, pause = FALSE)
plot(x = results, k = 10, pause = FALSE)
##
NetMatrix <- biblioNetwork(M, analysis = "co-occurrences", network = "keywords", sep = ";")
# Plot the network
net<-networkPlot(NetMatrix, normalize="association", weighted=T, n = 30, Title = "Keyword Co-occurrences", type = "fruchterman", size=T,edgesize = 5,labelsize=0.7)
###Plotting histogram of common words
# get the unique strings
string <- unique(unlist(strsplit(M$DE,'; ')))
# create a list with the rows for each unique string
lst <- lapply(string, function(x) grep(x, M$DE, fixed = TRUE))
# get the counts for each string
count <- lengths(lst)
# collpase the list string positions into a string with the rownumbers for each string
pos <- sapply(lst, toString)
# put everything together in one dataframe
d <- data.frame(string, count, pos)
d <- subset(d, d$count > 9)
d <- subset(d, d$string != "NA")
#
# Create factor column with decreasing order TRUE
d$string <- factor(d$string, levels = d$string[order(d$count, decreasing = TRUE)])
#   
ggplot(data= d)+
  aes(x= string, y= count) + 
  geom_bar(stat = "identity") + coord_flip()

#(aes(linetype=habit),size = 1)+
  #scale_color_manual(values = c("#CB2314","#FAD510","#273046"))