### Bibliometric analysis of evo-devo publications related to the word morphology.

This repository contains scripts and data to analyze the trends in evo-devo publcations. 

Data was obtained using the Scopus server. Criteria to obtain the references included the words evolution or development and evo-devo, and morphology in the title, abstract or keywords sections. Those words were chose to see if there is any bias in studying the evo-devo of morphology. 

The searching criteria used in scoups is the following:

`TITLE-ABS-KEY ( ( evodevo OR evo-devo ) AND ( morphology OR organism OR phenotype OR genotype OR modularity OR homology OR ontogeny OR evolvability OR heterochrony OR metamorphosis ) )`

We decided to limit publications from 2018 to the present to see the recent trends. 

We also downloaded all articles from to specialized journals to see if theres any bias or more frequent subject of study within the evo-devo journals. Data was downloaded from Evolution & Development and EvoDevo. 

Within the script folder there is script NAMED `bibliographic_analysis.R` that uses the `R` package [bibliometrix](https://www.bibliometrix.org/home/index.php/blog/133-the-exponential-growth-of-scientific-publications)
to generate some useful plots. 

One additional search refinement was the following: 
`TITLE-ABS-KEY ( ( evolution AND development AND ( evodevo OR evo-devo ) ) AND ( morphology OR organism OR phenotype OR genotype OR modularity OR homology ) )`




