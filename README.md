# findRspeakers

## What?
Let's say that you run something like an [R Meetup Group](http://www.meetup.com/topics/r-project-for-statistical-computing/) or other organization where you have people give presentations about their awesome work using R.  How do you manage to find new interesting speakers?  

Of course you should **use R to find people to give presentations about R**.  This R package scans through all the metadata on CRAN packages to find potential speakers in your area.

## Features

* Search by pattern in domain (in author, maintainer, url fields)
* Search by geo distance to geolocated domains

## Installation
```
library(devtools)
install_github("cbdavis/findRspeakers")
```

## Example use
Find all speakers with e-mail addresses in the Netherlands or Germany, within the default distance (100 km) of the coordinates given.  Information on the packages is returned as a data frame, below `pander` is used to format the dataframe into an html table.

`data_file` stores the results of geolocating domains.  When you run the code the first time, it may take 20-30 minutes to generate this file due to API request limits for the geolocation service being used.

`domainPattern` is a regular expression that is used to search by domains mentioned in the package metadata from CRAN.  The code finds domains in email addresses of authors and maintainers and also searches through package urls.

```
library(findRspeakers)
library(pander)

possibleSpeakers = findRspeakers(lat = 53.21667, lon = 6.566667, 
                                 data_file="/path/to/geoLocatedDomains.csv")

# more restrictive search 
#possibleSpeakers = findRspeakers(domainPattern = "\\.nl|\\.de|\\.com|\\.org|\\.edu", 
#                                 lat = 53.21667, lon = 6.566667, 
#                                 data_file="/path/to/geoLocatedDomains.csv")


# split the results into several subtables
pander(possibleSpeakers[,c("Package", "Title",  "Author", "Maintainer", "Distance")], split.table=Inf)
pander(possibleSpeakers[,c("Package", "Title",  "Description")], split.table=Inf)
pander(possibleSpeakers[,c("Package", "Title",  "Version", "URL", "Published")], split.table=Inf)

```

<table>
<colgroup>
<col width="10%"></col>
<col width="25%"></col>
<col width="30%"></col>
<col width="25%"></col>
<col width="8%"></col>
</colgroup>
<thead>
<tr class="header">
<th align="center">Package</th>
<th align="center">Title</th>
<th align="center">Author</th>
<th align="center">Maintainer</th>
<th align="center">Distance</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">BDgraph</td>
<td align="center">Bayesian Graph Selection Based on Birth-Death MCMC Approach</td>
<td align="center">Abdolreza Mohammadi and Ernst Wit</td>
<td align="center">Abdolreza Mohammadi <a href="mailto:a.mohammadi@rug.nl">a.mohammadi@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="even">
<td align="center">DAISIE</td>
<td align="center">Dynamical Assembly of Islands by Speciation, Immigration and Extinction</td>
<td align="center">Rampal S. Etienne, Luis M. Valente, Albert B. Phillimore &amp; Bart Haegenan</td>
<td align="center">Rampal S. Etienne <a href="mailto:r.s.etienne@rug.nl">r.s.etienne@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="odd">
<td align="center">DAMOCLES</td>
<td align="center">Dynamic Assembly Model of Colonization, Local Extinction and Speciation</td>
<td align="center">Rampal S. Etienne &amp; Alex L. Pigot</td>
<td align="center">Rampal S. Etienne <a href="mailto:r.s.etienne@rug.nl">r.s.etienne@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="even">
<td align="center">DDD</td>
<td align="center">Diversity-Dependent Diversification</td>
<td align="center">Rampal S. Etienne &amp; Bart Haegeman</td>
<td align="center">Rampal S. Etienne <a href="mailto:r.s.etienne@rug.nl">r.s.etienne@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="odd">
<td align="center">designGG</td>
<td align="center">Computational tool for designing genetical genomics experiments</td>
<td align="center">Yang Li <a href="mailto:yang.li@rug.nl">yang.li@rug.nl</a>, Morris Swertz <a href="mailto:m.a.swertz@rug.nl">m.a.swertz@rug.nl</a>, Gonzalo Vera <a href="mailto:gonzalo.vera.rodriguez@gmail.com">gonzalo.vera.rodriguez@gmail.com</a>, Rainer Breitling <a href="mailto:r.breitling@rug.nl">r.breitling@rug.nl</a>, Ritsert Jansen <a href="mailto:r.c.jansen@rug.nl">r.c.jansen@rug.nl</a></td>
<td align="center">Yang Li <a href="mailto:yang.li@rug.nl">yang.li@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="even">
<td align="center">gemtc</td>
<td align="center">Network Meta-Analysis Using Bayesian Methods</td>
<td align="center">Gert van Valkenhoef, Joel Kuiper</td>
<td align="center">Gert van Valkenhoef <a href="mailto:g.h.m.van.valkenhoef@rug.nl">g.h.m.van.valkenhoef@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="odd">
<td align="center">gemtc.jar</td>
<td align="center">GeMTC Java binary</td>
<td align="center">Gert van Valkenhoef, Joel Kuiper</td>
<td align="center">Gert van Valkenhoef <a href="mailto:g.h.m.van.valkenhoef@rug.nl">g.h.m.van.valkenhoef@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="even">
<td align="center">hitandrun</td>
<td align="center">“Hit and Run” and “Shake and Bake” for Sampling Uniformly from Convex Shapes</td>
<td align="center">Gert van Valkenhoef, Tommi Tervonen</td>
<td align="center">Gert van Valkenhoef <a href="mailto:g.h.m.van.valkenhoef@rug.nl">g.h.m.van.valkenhoef@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="odd">
<td align="center">maddison</td>
<td align="center">Maddison Project Database</td>
<td align="center">Eric Persson [aut, cre]</td>
<td align="center">Eric Persson <a href="mailto:expersso5@gmail.com">expersso5@gmail.com</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="even">
<td align="center">neat</td>
<td align="center">Network Enrichment Analysis Test (NEAT)</td>
<td align="center">Mirko Signorelli, Veronica Vinciotti and Ernst C. Wit</td>
<td align="center">Mirko Signorelli <a href="mailto:m.signorelli@rug.nl">m.signorelli@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="odd">
<td align="center">NetSim</td>
<td align="center">A Social Networks Simulation Tool in R</td>
<td align="center">Christoph Stadtfeld</td>
<td align="center">Christoph Stadtfeld <a href="mailto:c.stadtfeld@rug.nl">c.stadtfeld@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="even">
<td align="center">PBD</td>
<td align="center">Protracted Birth-Death Model of Diversification</td>
<td align="center">Rampal S. Etienne</td>
<td align="center">Rampal S. Etienne <a href="mailto:r.s.etienne@rug.nl">r.s.etienne@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="odd">
<td align="center">PerFit</td>
<td align="center">Person Fit</td>
<td align="center">Jorge N. Tendeiro</td>
<td align="center">Jorge N. Tendeiro <a href="mailto:j.n.tendeiro@rug.nl">j.n.tendeiro@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="even">
<td align="center">pheno2geno</td>
<td align="center">High-Throughput Generation of Genetic Markers and Maps from Molecular Phenotypes for Crosses Between Inbred Strains</td>
<td align="center">Konrad Zych <a href="mailto:k.zych@rug.nl">k.zych@rug.nl</a> and Danny Arends <a href="mailto:danny.arends@gmail.com">danny.arends@gmail.com</a></td>
<td align="center">Konrad Zych <a href="mailto:k.zych@rug.nl">k.zych@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="odd">
<td align="center">pnea</td>
<td align="center">Parametric Network Enrichment Analysis</td>
<td align="center">Mirko Signorelli, Veronica Vinciotti and Ernst C. Wit</td>
<td align="center">Mirko Signorelli <a href="mailto:m.signorelli@rug.nl">m.signorelli@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="even">
<td align="center">reGenotyper</td>
<td align="center">Detecting Mislabeled Samples in Genetic Data</td>
<td align="center">Yang Li <a href="mailto:yang.li@rug.nl">yang.li@rug.nl</a></td>
<td align="center">Yang Li <a href="mailto:yang.li@rug.nl">yang.li@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="odd">
<td align="center">smaa</td>
<td align="center">Stochastic Multi-Criteria Acceptability Analysis</td>
<td align="center">Gert van Valkenhoef</td>
<td align="center">Gert van Valkenhoef <a href="mailto:g.h.m.van.valkenhoef@rug.nl">g.h.m.van.valkenhoef@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="even">
<td align="center">SparseTSCGM</td>
<td align="center">Sparse Time Series Chain Graphical Models</td>
<td align="center">Fentaw Abegaz and Ernst Wit</td>
<td align="center">Fentaw Abegaz <a href="mailto:f.abegaz.yazew@rug.nl">f.abegaz.yazew@rug.nl</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="odd">
<td align="center">wiod</td>
<td align="center">World Input Output Database 1995-2011</td>
<td align="center">Bastiaan Quast [aut, cre]</td>
<td align="center">Bastiaan Quast <a href="mailto:bquast@gmail.com">bquast@gmail.com</a></td>
<td align="center">0.2816469</td>
</tr>
<tr class="even">
<td align="center">bootnet</td>
<td align="center">Bootstrap Methods for Various Network Estimation Routines</td>
<td align="center">Sacha Epskamp</td>
<td align="center">Sacha Epskamp <a href="mailto:mail@sachaepskamp.com">mail@sachaepskamp.com</a></td>
<td align="center">51.2579359</td>
</tr>
<tr class="odd">
<td align="center">graphicalVAR</td>
<td align="center">Graphical VAR for Experience Sampling Data</td>
<td align="center">Sacha Epskamp</td>
<td align="center">Sacha Epskamp <a href="mailto:mail@sachaepskamp.com">mail@sachaepskamp.com</a></td>
<td align="center">51.2579359</td>
</tr>
<tr class="even">
<td align="center">IsingSampler</td>
<td align="center">Sampling Methods and Distribution Functions for the Ising Model</td>
<td align="center">Sacha Epskamp</td>
<td align="center">Sacha Epskamp <a href="mailto:mail@sachaepskamp.com">mail@sachaepskamp.com</a></td>
<td align="center">51.2579359</td>
</tr>
<tr class="odd">
<td align="center">lisrelToR</td>
<td align="center">Import output from LISREL into R</td>
<td align="center">Sacha Epskamp</td>
<td align="center">Sacha Epskamp <a href="mailto:mail@sachaepskamp.com">mail@sachaepskamp.com</a></td>
<td align="center">51.2579359</td>
</tr>
<tr class="even">
<td align="center">mlVAR</td>
<td align="center">Multi-Level Vector Autoregression</td>
<td align="center">Sacha Epskamp, Marie K. Deserno and Laura F. Bringmann</td>
<td align="center">Sacha Epskamp <a href="mailto:mail@sachaepskamp.com">mail@sachaepskamp.com</a></td>
<td align="center">51.2579359</td>
</tr>
<tr class="odd">
<td align="center">qgraph</td>
<td align="center">Graph Plotting Methods, Psychometric Data Visualization and Graphical Model Estimation</td>
<td align="center">Sacha Epskamp, Giulio Costantini, Angelique O. J. Cramer, Lourens J. Waldorp, Verena D. Schmittmann and Denny Borsboom</td>
<td align="center">Sacha Epskamp <a href="mailto:mail@sachaepskamp.com">mail@sachaepskamp.com</a></td>
<td align="center">51.2579359</td>
</tr>
<tr class="even">
<td align="center">semPlot</td>
<td align="center">Path diagrams and visual analysis of various SEM packages’ output</td>
<td align="center">Sacha Epskamp</td>
<td align="center">Sacha Epskamp <a href="mailto:mail@sachaepskamp.com">mail@sachaepskamp.com</a></td>
<td align="center">51.2579359</td>
</tr>
<tr class="odd">
<td align="center">AF</td>
<td align="center">Model-Based Estimation of Confounder-Adjusted Attributable Fractions</td>
<td align="center">Elisabeth Dahlqwist and Arvid Sjölander</td>
<td align="center">Elisabeth Dahlqwist <a href="mailto:elisabeth.dahlqwist@ki.se">elisabeth.dahlqwist@ki.se</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="even">
<td align="center">bigRR</td>
<td align="center">Generalized Ridge Regression (with special advantage for p &gt;&gt; n cases)</td>
<td align="center">Xia Shen, Moudud Alam and Lars Ronnegard</td>
<td align="center">Xia Shen <a href="mailto:xia.shen@ki.se">xia.shen@ki.se</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="odd">
<td align="center">dosresmeta</td>
<td align="center">Performing Multivariate Dose-Response Meta-Analysis</td>
<td align="center">Alessio Crippa</td>
<td align="center">Alessio Crippa <a href="mailto:alessio.crippa@ki.se">alessio.crippa@ki.se</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="even">
<td align="center">drgee</td>
<td align="center">Doubly Robust Generalized Estimating Equations</td>
<td align="center">Johan Zetterqvist <a href="mailto:johan.zetterqvist@ki.se">johan.zetterqvist@ki.se</a> , Arvid Sjölander <a href="mailto:arvid.sjolander@ki.se">arvid.sjolander@ki.se</a> with contributions from Alexander Ploner.</td>
<td align="center">Johan Zetterqvist <a href="mailto:johan.zetterqvist@ki.se">johan.zetterqvist@ki.se</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="odd">
<td align="center">flexPM</td>
<td align="center">Flexible Parametric Models for Censored and Truncated Data</td>
<td align="center">Paolo Frumento <a href="mailto:paolo.frumento@ki.se">paolo.frumento@ki.se</a></td>
<td align="center">Paolo Frumento <a href="mailto:paolo.frumento@ki.se">paolo.frumento@ki.se</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="even">
<td align="center">hetmeta</td>
<td align="center">Heterogeneity Measures in Meta-Analysis</td>
<td align="center">Alessio Crippa</td>
<td align="center">Alessio Crippa <a href="mailto:alessio.crippa@ki.se">alessio.crippa@ki.se</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="odd">
<td align="center">hglm</td>
<td align="center">Hierarchical Generalized Linear Models</td>
<td align="center">Moudud Alam, Lars Ronnegard, Xia Shen</td>
<td align="center">Xia Shen <a href="mailto:xia.shen@ki.se">xia.shen@ki.se</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="even">
<td align="center">hqmisc</td>
<td align="center">Miscellaneous convenience functions and dataset</td>
<td align="center">Hugo Quené [aut, cre]</td>
<td align="center">Hugo Quene <a href="mailto:h.quene@uu.nl">h.quene@uu.nl</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="odd">
<td align="center">ms.sev</td>
<td align="center">Package for Calculation of ARMSS, Local MSSS and Global MSSS</td>
<td align="center">Helga Westerlind, Ali Manouchehrinia</td>
<td align="center">Helga Westerlind <a href="mailto:Helga.Westerlind@ki.se">Helga.Westerlind@ki.se</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="even">
<td align="center">NEArender</td>
<td align="center">Network Enrichment Analysis</td>
<td align="center">Andrey Alexeyenko [aut, cph, ths], Ashwini Jeggari [aut, cre]</td>
<td align="center">Ashwini Jeggari <a href="mailto:ashwinipriya.jeggari@ki.se">ashwinipriya.jeggari@ki.se</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="odd">
<td align="center">pch</td>
<td align="center">Piecewise Constant Hazards Models for Censored and Truncated Data</td>
<td align="center">Paolo Frumento</td>
<td align="center">Paolo Frumento <a href="mailto:paolo.frumento@ki.se">paolo.frumento@ki.se</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="even">
<td align="center">qrcm</td>
<td align="center">Quantile Regression Coefficients Modeling</td>
<td align="center">Paolo Frumento <a href="mailto:paolo.frumento@ki.se">paolo.frumento@ki.se</a></td>
<td align="center">Paolo Frumento <a href="mailto:paolo.frumento@ki.se">paolo.frumento@ki.se</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="odd">
<td align="center">rstpm2</td>
<td align="center">Generalized Survival Models</td>
<td align="center">Mark Clements [aut, cre], Xing-Rong Liu [aut], Paul Lambert [ctb]</td>
<td align="center">Mark Clements <a href="mailto:mark.clements@ki.se">mark.clements@ki.se</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="even">
<td align="center">SSrat</td>
<td align="center">Two-dimensional sociometric status determination with rating scales</td>
<td align="center">Hans Landsheer</td>
<td align="center">Hans Landsheer <a href="mailto:j.a.landsheer@uu.nl">j.a.landsheer@uu.nl</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="odd">
<td align="center">stdReg</td>
<td align="center">Regression Standardization</td>
<td align="center">Arvid Sjolander</td>
<td align="center">Arvid Sjolander <a href="mailto:arvid.sjolander@ki.se">arvid.sjolander@ki.se</a></td>
<td align="center">65.3116101</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col width="16%"></col>
<col width="38%"></col>
<col width="45%"></col>
</colgroup>
<thead>
<tr class="header">
<th align="center">Package</th>
<th align="center">Title</th>
<th align="center">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">BDgraph</td>
<td align="center">Bayesian Graph Selection Based on Birth-Death MCMC Approach</td>
<td align="center">Provides statistical tools for Bayesian structure learning in undirected graphical models with both continuous and discrete variables.</td>
</tr>
<tr class="even">
<td align="center">DAISIE</td>
<td align="center">Dynamical Assembly of Islands by Speciation, Immigration and Extinction</td>
<td align="center">Simulates and computes the (maximum) likelihood of a dynamical model of island biota assembly through speciation, immigration and extinction. See Valente et al. 2015. Ecology Letters 18: 844-852.</td>
</tr>
<tr class="odd">
<td align="center">DAMOCLES</td>
<td align="center">Dynamic Assembly Model of Colonization, Local Extinction and Speciation</td>
<td align="center">Simulates and computes (maximum) likelihood of a dynamical model of community assembly that takes into account phylogenetic history.</td>
</tr>
<tr class="even">
<td align="center">DDD</td>
<td align="center">Diversity-Dependent Diversification</td>
<td align="center">Implements maximum likelihood methods based on the diversity-dependent birth-death process to test whether speciation or extinction are diversity-dependent. See Etienne et al. 2012, Proc. Roy. Soc. B 279: 1300-1309, <a href="DOI:10.1098/rspb.2011.1439" class="uri">DOI:10.1098/rspb.2011.1439</a>. Also implements maximum likelihood methods to detect various types of key innovations in the light of diversity-dependence. See Etienne &amp; Haegeman 2012, Am. Nat. 180: E75-E89, <a href="DOI:10.1086/667574" class="uri">DOI:10.1086/667574</a>. Finally, DDD contains a function to simulate the diversity-dependent process.</td>
</tr>
<tr class="odd">
<td align="center">designGG</td>
<td align="center">Computational tool for designing genetical genomics experiments</td>
<td align="center">The package provides R scripts for designing genetical genomics experiments.</td>
</tr>
<tr class="even">
<td align="center">gemtc</td>
<td align="center">Network Meta-Analysis Using Bayesian Methods</td>
<td align="center">Network meta-analyses (mixed treatment comparisons) in the Bayesian framework using JAGS. Includes methods to assess heterogeneity and inconsistency, and a number of standard visualizations.</td>
</tr>
<tr class="odd">
<td align="center">gemtc.jar</td>
<td align="center">GeMTC Java binary</td>
<td align="center">An R package providing the Java JAR for the gemtc package</td>
</tr>
<tr class="even">
<td align="center">hitandrun</td>
<td align="center">“Hit and Run” and “Shake and Bake” for Sampling Uniformly from Convex Shapes</td>
<td align="center">The “Hit and Run” Markov Chain Monte Carlo method for sampling uniformly from convex shapes defined by linear constraints, and the “Shake and Bake” method for sampling from the boundary of such shapes. Includes specialized functions for sampling normalized weights with arbitrary linear constraints.</td>
</tr>
<tr class="odd">
<td align="center">maddison</td>
<td align="center">Maddison Project Database</td>
<td align="center">Contains the Maddison Project database, which provides estimates of GDP per capita for all countries in the world between AD 1 and 2010. See <a href="http://www.ggdc.net/maddison" class="uri">http://www.ggdc.net/maddison</a> for more information.</td>
</tr>
<tr class="even">
<td align="center">neat</td>
<td align="center">Network Enrichment Analysis Test (NEAT)</td>
<td align="center">Includes functions and examples to compute NEAT, a network-based test for gene enrichment analysis.</td>
</tr>
<tr class="odd">
<td align="center">NetSim</td>
<td align="center">A Social Networks Simulation Tool in R</td>
<td align="center">NetSim allows to combine and simulate a variety of micro-models to research their impact on the macro-features of social networks.</td>
</tr>
<tr class="even">
<td align="center">PBD</td>
<td align="center">Protracted Birth-Death Model of Diversification</td>
<td align="center">Conducts maximum likelihood analysis and simulation of the protracted speciation model.</td>
</tr>
<tr class="odd">
<td align="center">PerFit</td>
<td align="center">Person Fit</td>
<td align="center">Several person-fit statistics (PFSs) are offered. These statistics allow assessing whether individual response patterns to tests or questionnaires are (im)plausible given the other respondents in the sample or given a specified item response theory model. Some PFSs apply to dichotomous data, such as the likelihood-based PFSs (lz, lz*) and the group-based PFSs (personal biserial correlation, caution index, (normed) number of Guttman errors, agreement/disagreement/dependability statistics, U3, ZU3, NCI, Ht). PFSs suitable to polytomous data include extensions of lz, U3, and (normed) number of Guttman errors.</td>
</tr>
<tr class="even">
<td align="center">pheno2geno</td>
<td align="center">High-Throughput Generation of Genetic Markers and Maps from Molecular Phenotypes for Crosses Between Inbred Strains</td>
<td align="center">High-throughput generation of genetic markers from molecular phenotypes for crosses between inbred strains. These markers can be use to saturate existing genetic map or creating a new one.</td>
</tr>
<tr class="odd">
<td align="center">pnea</td>
<td align="center">Parametric Network Enrichment Analysis</td>
<td align="center">Includes functions and examples to compute Parametric Network Enrichment Analysis.</td>
</tr>
<tr class="even">
<td align="center">reGenotyper</td>
<td align="center">Detecting Mislabeled Samples in Genetic Data</td>
<td align="center">Detecting mislabeled samples in genetic data.</td>
</tr>
<tr class="odd">
<td align="center">smaa</td>
<td align="center">Stochastic Multi-Criteria Acceptability Analysis</td>
<td align="center">Implementation of the Stochastic Multi-Criteria Acceptability Analysis (SMAA) family of Multiple Criteria Decision Analysis (MCDA) methods.</td>
</tr>
<tr class="even">
<td align="center">SparseTSCGM</td>
<td align="center">Sparse Time Series Chain Graphical Models</td>
<td align="center">Computes sparse vector autoregressive coefficients and precision matrices for time series chain graphical models.</td>
</tr>
<tr class="odd">
<td align="center">wiod</td>
<td align="center">World Input Output Database 1995-2011</td>
<td align="center">Data sets from the World Input Output Database, for the years 1995-2011.</td>
</tr>
<tr class="even">
<td align="center">bootnet</td>
<td align="center">Bootstrap Methods for Various Network Estimation Routines</td>
<td align="center">Bootstrap standard errors on various network estimation routines, such as EBICglasso() from the ‘qgraph’ package and IsingFit() from the ‘IsingFit’ package.</td>
</tr>
<tr class="odd">
<td align="center">graphicalVAR</td>
<td align="center">Graphical VAR for Experience Sampling Data</td>
<td align="center">Estimates within and between time point interactions in experience sampling data, using the Graphical VAR model in combination with LASSO and EBIC.</td>
</tr>
<tr class="even">
<td align="center">IsingSampler</td>
<td align="center">Sampling Methods and Distribution Functions for the Ising Model</td>
<td align="center">Sample states from the Ising model and compute the probability of states. Sampling can be done for any number of nodes, but due to the intractibility of the Ising model the distribution can only be computed up to ~10 nodes.</td>
</tr>
<tr class="odd">
<td align="center">lisrelToR</td>
<td align="center">Import output from LISREL into R</td>
<td align="center">This is an unofficial package aimed at automating the import of LISREL output in R. This package or its maintainer is not in any way affiliated with the creators of LISREL and SSI, Inc.</td>
</tr>
<tr class="even">
<td align="center">mlVAR</td>
<td align="center">Multi-Level Vector Autoregression</td>
<td align="center">Compute estimates of the multivariate vector autoregression model as used to (but not limited to) analyze experience sampling method data in clinical psychology. The model can be extended through treatment effects, covariates and pre- and post-assessment effects.</td>
</tr>
<tr class="odd">
<td align="center">qgraph</td>
<td align="center">Graph Plotting Methods, Psychometric Data Visualization and Graphical Model Estimation</td>
<td align="center">The qgraph package can be used to visualize data as networks as well as provides an interface for visualizing weighted graphical models.</td>
</tr>
<tr class="even">
<td align="center">semPlot</td>
<td align="center">Path diagrams and visual analysis of various SEM packages’ output</td>
<td align="center">Path diagrams and visual analysis of various SEM packages’ output</td>
</tr>
<tr class="odd">
<td align="center">AF</td>
<td align="center">Model-Based Estimation of Confounder-Adjusted Attributable Fractions</td>
<td align="center">Estimates the attributable fraction in different sampling designs adjusted for measured confounders using logistic regression (cross-sectional and case-control designs), conditional logistic regression (matched case-control design) and Cox proportional hazard regression (cohort design with time-to-event outcome). The variance of the estimator is obtained by combining the delta method with the the sandwich formula.</td>
</tr>
<tr class="even">
<td align="center">bigRR</td>
<td align="center">Generalized Ridge Regression (with special advantage for p &gt;&gt; n cases)</td>
<td align="center">The package fits large-scale (generalized) ridge regression for various distributions of response. The shrinkage parameters (lambdas) can be pre-specified or estimated using an internal update routine (fitting a heteroscedastic effects model, or HEM). It gives possibility to shrink any subset of parameters in the model. It has special computational advantage for the cases when the number of shrinkage parameters exceeds the number of observations. For example, the package is very useful for fitting large-scale omics data, such as high-throughput genotype data (genomics), gene expression data (transcriptomics), metabolomics data, etc.</td>
</tr>
<tr class="odd">
<td align="center">dosresmeta</td>
<td align="center">Performing Multivariate Dose-Response Meta-Analysis</td>
<td align="center">It estimates a dose-response relation from either a single or multiple summarized data. The trend estimation takes into account the correlation among sets of log relative risks and use it to efficiently estimate the dose-response relation. To obtain a pooled functional relation, the study-specific trends are combined according to principles of multivariate random-effects meta-analysis.</td>
</tr>
<tr class="even">
<td align="center">drgee</td>
<td align="center">Doubly Robust Generalized Estimating Equations</td>
<td align="center">Fit restricted mean models for the conditional association between an exposure and an outcome, given covariates. Three methods are implemented: O-estimation, where a nuisance model for the association between the covariates and the outcome is used; E-estimation where a nuisance model for the association between the covariates and the exposure is used, and doubly robust (DR) estimation where both nuisance models are used. In DR-estimation, the estimates will be consistent when at least one of the nuisance models is correctly specified, not necessarily both.</td>
</tr>
<tr class="odd">
<td align="center">flexPM</td>
<td align="center">Flexible Parametric Models for Censored and Truncated Data</td>
<td align="center">Estimation of flexible parametric models for survival data.</td>
</tr>
<tr class="even">
<td align="center">hetmeta</td>
<td align="center">Heterogeneity Measures in Meta-Analysis</td>
<td align="center">Assess the presence of statistical heterogeneity and quantify its impact in the context of meta-analysis. It includes test for heterogeneity as well as other statistical measures (R_b, I^2, R_I).</td>
</tr>
<tr class="odd">
<td align="center">hglm</td>
<td align="center">Hierarchical Generalized Linear Models</td>
<td align="center">Procedures for fitting hierarchical generalized linear models (HGLM). It can be used for linear mixed models and generalized linear mixed models with random effects for a variety of links and a variety of distributions for both the outcomes and the random effects. Fixed effects can also be fitted in the dispersion part of the mean model.</td>
</tr>
<tr class="even">
<td align="center">hqmisc</td>
<td align="center">Miscellaneous convenience functions and dataset</td>
<td align="center">This package contains some miscellaneous convenience functions, to create a matrix of dummy columns from a factor, to determine whether x lies in range [a,b], to add a rectangular bracket to an existing plot, and to convert frequencies between Hz, semitones, mel and Bark. This package also contains an example data set of a stratified sample of 80 talkers of Dutch.</td>
</tr>
<tr class="odd">
<td align="center">ms.sev</td>
<td align="center">Package for Calculation of ARMSS, Local MSSS and Global MSSS</td>
<td align="center">Calculates ARMSS (age related multiple sclerosis severity), and both local and global MSSS (multiple sclerosis severity score).</td>
</tr>
<tr class="even">
<td align="center">NEArender</td>
<td align="center">Network Enrichment Analysis</td>
<td align="center">Performs network enrichment analysis against functional gene sets. Benchmarks networks. Renders raw gene profile matrices of dimensionality “Ngenes x Nsamples” into the space of gene set (typically pathway) enrichment scores of dimensionality “Npathways x Nsamples”.</td>
</tr>
<tr class="odd">
<td align="center">pch</td>
<td align="center">Piecewise Constant Hazards Models for Censored and Truncated Data</td>
<td align="center">Using piecewise constant hazards models is a very flexible approach for the analysis of survival data. The time line is divided into sub-intervals; for each interval, a different hazard is estimated using Poisson regression.</td>
</tr>
<tr class="even">
<td align="center">qrcm</td>
<td align="center">Quantile Regression Coefficients Modeling</td>
<td align="center">Parametric modeling of quantile regression coefficient functions.</td>
</tr>
<tr class="odd">
<td align="center">rstpm2</td>
<td align="center">Generalized Survival Models</td>
<td align="center">R implementation of generalized survival models, where g(S(t|x))=eta(t,x) for a link function g, survival S at time t with covariates x and a linear predictor eta(t,x). The main assumption is that the time effect(s) are smooth. For fully parametric models, this re-implements Stata’s ‘stpm2’ function, which are flexible parametric survival models developed by Royston and colleagues. We have extended the parametric models to include any smooth parametric smoothers for time. We have also extended the model to include any smooth penalized smoothers from the ‘mgcv’ package, using penalized likelihood. These models include left truncation, right censoring, interval censoring, gamma frailties and normal random effects.</td>
</tr>
<tr class="even">
<td align="center">SSrat</td>
<td align="center">Two-dimensional sociometric status determination with rating scales</td>
<td align="center">SSRAT is a computer program for two-dimensional sociometric status determination with rating scales. For each person assessed, SSRAT computes probability distributions of the total scores for <code>sympathy' (S),</code>antipathy’ (A), <code>social preference' (P) and</code>social impact’ (I), and applies the criteria for sociometric status categorization.</td>
</tr>
<tr class="odd">
<td align="center">stdReg</td>
<td align="center">Regression Standardization</td>
<td align="center">Contains functionality for regression standardization. Two general classes of models are allowed; generalized linear models and Cox proportional hazards models.</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col width="10%"></col>
<col width="24%"></col>
<col width="7%"></col>
<col width="49%"></col>
<col width="8%"></col>
</colgroup>
<thead>
<tr class="header">
<th align="center">Package</th>
<th align="center">Title</th>
<th align="center">Version</th>
<th align="center">URL</th>
<th align="center">Published</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">BDgraph</td>
<td align="center">Bayesian Graph Selection Based on Birth-Death MCMC Approach</td>
<td align="center">2.27</td>
<td align="center"><a href="https://www.tilburguniversity.edu/webwijs/show/a.mohammadi.htm" class="uri">https://www.tilburguniversity.edu/webwijs/show/a.mohammadi.htm</a></td>
<td align="center">2016-04-22</td>
</tr>
<tr class="even">
<td align="center">DAISIE</td>
<td align="center">Dynamical Assembly of Islands by Speciation, Immigration and Extinction</td>
<td align="center">1.0.2</td>
<td align="center">NA</td>
<td align="center">2015-09-29</td>
</tr>
<tr class="odd">
<td align="center">DAMOCLES</td>
<td align="center">Dynamic Assembly Model of Colonization, Local Extinction and Speciation</td>
<td align="center">1.1</td>
<td align="center">NA</td>
<td align="center">2015-03-05</td>
</tr>
<tr class="even">
<td align="center">DDD</td>
<td align="center">Diversity-Dependent Diversification</td>
<td align="center">3.2</td>
<td align="center">NA</td>
<td align="center">2016-02-09</td>
</tr>
<tr class="odd">
<td align="center">designGG</td>
<td align="center">Computational tool for designing genetical genomics experiments</td>
<td align="center">1.1</td>
<td align="center"><a href="http://www.rug.nl/research/bioinformatics/" class="uri">http://www.rug.nl/research/bioinformatics/</a></td>
<td align="center">2013-02-19</td>
</tr>
<tr class="even">
<td align="center">gemtc</td>
<td align="center">Network Meta-Analysis Using Bayesian Methods</td>
<td align="center">0.8</td>
<td align="center"><a href="http://github.com/gertvv/gemtc" class="uri">http://github.com/gertvv/gemtc</a></td>
<td align="center">2016-03-01</td>
</tr>
<tr class="odd">
<td align="center">gemtc.jar</td>
<td align="center">GeMTC Java binary</td>
<td align="center">0.14.3</td>
<td align="center">NA</td>
<td align="center">2013-01-21</td>
</tr>
<tr class="even">
<td align="center">hitandrun</td>
<td align="center">“Hit and Run” and “Shake and Bake” for Sampling Uniformly from Convex Shapes</td>
<td align="center">0.5-2</td>
<td align="center"><a href="http://github.com/gertvv/hitandrun" class="uri">http://github.com/gertvv/hitandrun</a></td>
<td align="center">2015-07-10</td>
</tr>
<tr class="odd">
<td align="center">maddison</td>
<td align="center">Maddison Project Database</td>
<td align="center">0.1</td>
<td align="center"><a href="http://www.ggdc.net/maddison" class="uri">http://www.ggdc.net/maddison</a> <a href="https://github.com/expersso/maddison" class="uri">https://github.com/expersso/maddison</a></td>
<td align="center">2015-12-09</td>
</tr>
<tr class="even">
<td align="center">neat</td>
<td align="center">Network Enrichment Analysis Test (NEAT)</td>
<td align="center">0.0</td>
<td align="center">NA</td>
<td align="center">2016-04-21</td>
</tr>
<tr class="odd">
<td align="center">NetSim</td>
<td align="center">A Social Networks Simulation Tool in R</td>
<td align="center">0.9</td>
<td align="center">NA</td>
<td align="center">2013-12-15</td>
</tr>
<tr class="even">
<td align="center">PBD</td>
<td align="center">Protracted Birth-Death Model of Diversification</td>
<td align="center">1.2</td>
<td align="center">NA</td>
<td align="center">2016-03-04</td>
</tr>
<tr class="odd">
<td align="center">PerFit</td>
<td align="center">Person Fit</td>
<td align="center">1.4</td>
<td align="center">NA</td>
<td align="center">2015-07-20</td>
</tr>
<tr class="even">
<td align="center">pheno2geno</td>
<td align="center">High-Throughput Generation of Genetic Markers and Maps from Molecular Phenotypes for Crosses Between Inbred Strains</td>
<td align="center">1.3.1</td>
<td align="center">NA</td>
<td align="center">2015-03-25</td>
</tr>
<tr class="odd">
<td align="center">pnea</td>
<td align="center">Parametric Network Enrichment Analysis</td>
<td align="center">1.2.4</td>
<td align="center">NA</td>
<td align="center">2016-01-12</td>
</tr>
<tr class="even">
<td align="center">reGenotyper</td>
<td align="center">Detecting Mislabeled Samples in Genetic Data</td>
<td align="center">1.2.0</td>
<td align="center">NA</td>
<td align="center">2015-05-05</td>
</tr>
<tr class="odd">
<td align="center">smaa</td>
<td align="center">Stochastic Multi-Criteria Acceptability Analysis</td>
<td align="center">0.2-4</td>
<td align="center"><a href="http://github.com/gertvv/rsmaa" class="uri">http://github.com/gertvv/rsmaa</a></td>
<td align="center">2015-07-10</td>
</tr>
<tr class="even">
<td align="center">SparseTSCGM</td>
<td align="center">Sparse Time Series Chain Graphical Models</td>
<td align="center">2.2</td>
<td align="center">NA</td>
<td align="center">2015-07-16</td>
</tr>
<tr class="odd">
<td align="center">wiod</td>
<td align="center">World Input Output Database 1995-2011</td>
<td align="center">0.3.0</td>
<td align="center"><a href="http://www.wiod.org/" class="uri">http://www.wiod.org/</a> <a href="http://qua.st/wiod" class="uri">http://qua.st/wiod</a>, <a href="https://github.com/bquast/wiod" class="uri">https://github.com/bquast/wiod</a></td>
<td align="center">2015-07-29</td>
</tr>
<tr class="even">
<td align="center">bootnet</td>
<td align="center">Bootstrap Methods for Various Network Estimation Routines</td>
<td align="center">0.2</td>
<td align="center">NA</td>
<td align="center">2016-01-19</td>
</tr>
<tr class="odd">
<td align="center">graphicalVAR</td>
<td align="center">Graphical VAR for Experience Sampling Data</td>
<td align="center">0.1.3</td>
<td align="center">NA</td>
<td align="center">2015-06-19</td>
</tr>
<tr class="even">
<td align="center">IsingSampler</td>
<td align="center">Sampling Methods and Distribution Functions for the Ising Model</td>
<td align="center">0.2</td>
<td align="center">github.com/SachaEpskamp/IsingSampler</td>
<td align="center">2015-03-02</td>
</tr>
<tr class="odd">
<td align="center">lisrelToR</td>
<td align="center">Import output from LISREL into R</td>
<td align="center">0.1.4</td>
<td align="center">NA</td>
<td align="center">2013-05-08</td>
</tr>
<tr class="even">
<td align="center">mlVAR</td>
<td align="center">Multi-Level Vector Autoregression</td>
<td align="center">0.1.0</td>
<td align="center">NA</td>
<td align="center">2015-06-10</td>
</tr>
<tr class="odd">
<td align="center">qgraph</td>
<td align="center">Graph Plotting Methods, Psychometric Data Visualization and Graphical Model Estimation</td>
<td align="center">1.3.3</td>
<td align="center"><a href="http://sachaepskamp.com/qgraph" class="uri">http://sachaepskamp.com/qgraph</a></td>
<td align="center">2016-04-29</td>
</tr>
<tr class="even">
<td align="center">semPlot</td>
<td align="center">Path diagrams and visual analysis of various SEM packages’ output</td>
<td align="center">1.0.1</td>
<td align="center"><a href="https://github.com/SachaEpskamp/semPlot" class="uri">https://github.com/SachaEpskamp/semPlot</a></td>
<td align="center">2014-08-15</td>
</tr>
<tr class="odd">
<td align="center">AF</td>
<td align="center">Model-Based Estimation of Confounder-Adjusted Attributable Fractions</td>
<td align="center">0.1.2</td>
<td align="center">NA</td>
<td align="center">2016-02-19</td>
</tr>
<tr class="even">
<td align="center">bigRR</td>
<td align="center">Generalized Ridge Regression (with special advantage for p &gt;&gt; n cases)</td>
<td align="center">1.3-10</td>
<td align="center">NA</td>
<td align="center">2014-08-23</td>
</tr>
<tr class="odd">
<td align="center">dosresmeta</td>
<td align="center">Performing Multivariate Dose-Response Meta-Analysis</td>
<td align="center">1.3.2</td>
<td align="center">NA</td>
<td align="center">2015-08-11</td>
</tr>
<tr class="even">
<td align="center">drgee</td>
<td align="center">Doubly Robust Generalized Estimating Equations</td>
<td align="center">1.1.5</td>
<td align="center">NA</td>
<td align="center">2016-04-25</td>
</tr>
<tr class="odd">
<td align="center">flexPM</td>
<td align="center">Flexible Parametric Models for Censored and Truncated Data</td>
<td align="center">2.0</td>
<td align="center">NA</td>
<td align="center">2015-11-23</td>
</tr>
<tr class="even">
<td align="center">hetmeta</td>
<td align="center">Heterogeneity Measures in Meta-Analysis</td>
<td align="center">0.1.0</td>
<td align="center">NA</td>
<td align="center">2016-05-01</td>
</tr>
<tr class="odd">
<td align="center">hglm</td>
<td align="center">Hierarchical Generalized Linear Models</td>
<td align="center">2.1-1</td>
<td align="center">NA</td>
<td align="center">2015-08-31</td>
</tr>
<tr class="even">
<td align="center">hqmisc</td>
<td align="center">Miscellaneous convenience functions and dataset</td>
<td align="center">0.1-1</td>
<td align="center">NA</td>
<td align="center">2014-03-10</td>
</tr>
<tr class="odd">
<td align="center">ms.sev</td>
<td align="center">Package for Calculation of ARMSS, Local MSSS and Global MSSS</td>
<td align="center">1.0.3</td>
<td align="center">NA</td>
<td align="center">2016-04-09</td>
</tr>
<tr class="even">
<td align="center">NEArender</td>
<td align="center">Network Enrichment Analysis</td>
<td align="center">1.0</td>
<td align="center">NA</td>
<td align="center">2016-04-19</td>
</tr>
<tr class="odd">
<td align="center">pch</td>
<td align="center">Piecewise Constant Hazards Models for Censored and Truncated Data</td>
<td align="center">1.1</td>
<td align="center">NA</td>
<td align="center">2016-02-18</td>
</tr>
<tr class="even">
<td align="center">qrcm</td>
<td align="center">Quantile Regression Coefficients Modeling</td>
<td align="center">1.0</td>
<td align="center">NA</td>
<td align="center">2015-12-16</td>
</tr>
<tr class="odd">
<td align="center">rstpm2</td>
<td align="center">Generalized Survival Models</td>
<td align="center">1.3.2</td>
<td align="center"><a href="http://github.com/mclements/rstpm2" class="uri">http://github.com/mclements/rstpm2</a></td>
<td align="center">2016-04-13</td>
</tr>
<tr class="even">
<td align="center">SSrat</td>
<td align="center">Two-dimensional sociometric status determination with rating scales</td>
<td align="center">1.0</td>
<td align="center">NA</td>
<td align="center">2014-11-27</td>
</tr>
<tr class="odd">
<td align="center">stdReg</td>
<td align="center">Regression Standardization</td>
<td align="center">1.1</td>
<td align="center">NA</td>
<td align="center">2016-04-04</td>
</tr>
</tbody>
</table>

