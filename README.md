# findRspeakers

## What?
Let's say that you run something like an [R Meetup Group](http://www.meetup.com/topics/r-project-for-statistical-computing/) or other organization where you have people give presentations about their awesome work using R.  How do you manage to find new interesting speakers?  

Of course you should **use R to find people to give presentations about R**.  This R package scans through all the metadata on CRAN packages to find potential speakers in your area.

## Features

* Search by pattern in e-mail domain
* Search by geo distance to geolocated e-mail domains

## Installation
The code needs a patched version of the [rgeolocate](https://github.com/Ironholds/rgeolocate) library which includes a longer time delay between API requests.  Without this, you will likely exceed the request rate limit and will need to [request to unblock your ip address](http://ip-api.com/docs/unban).  [Future versions of rgeolocate will incorporate this patch](https://github.com/Ironholds/rgeolocate/pull/29). 

```
library(devtools)
install_github("cbdavis/rgeolocate")
install_github("cbdavis/findRspeakers")
```

## Example use
Find all speakers with e-mail addresses in the Netherlands or Germany, within the default distance (100 km) of the coordinates given.  Information on the packages is returned as a data frame, below `pander` is used to format the dataframe into an html table.

`data_file` stores the results of geolocating e-mail domains.  When you run the code the first time, it may take 20-30 minutes to generate this file due to API request limits for the geolocation service being used.

```
library(findRspeakers)
library(pander)
possibleSpeakers = findRspeakers(emailPattern = "\\.nl|\\.de", 
                                 lat = 53.21667, lon = 6.566667, 
                                 data_file="/path/to/geoLocatedEMailDomains.csv")

# split the results into several subtables
pander(possibleSpeakers[,c("Package", "Title",  "Author", "Maintainer", "Distance")], split.table=Inf)
pander(possibleSpeakers[,c("Package", "Title",  "Description")], split.table=Inf)
pander(possibleSpeakers[,c("Package", "Title",  "Version", "URL", "Published")], split.table=Inf)

```

<table>
<colgroup>
<col width="10%"></col>
<col width="26%"></col>
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
<td align="center">lavaan</td>
<td align="center">Latent Variable Analysis</td>
<td align="center">Yves Rosseel [aut, cre], Daniel Oberski [ctb], Jarrett Byrnes [ctb], Leonard Vanbrabant [ctb], Victoria Savalei [ctb], Ed Merkle [ctb], Michael Hallquist [ctb], Mijke Rhemtulla [ctb], Myrsini Katsikatsou [ctb], Mariska Barendse [ctb]</td>
<td align="center">Yves Rosseel <a href="mailto:Yves.Rosseel@UGent.be">Yves.Rosseel@UGent.be</a></td>
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
<td align="center">hqmisc</td>
<td align="center">Miscellaneous convenience functions and dataset</td>
<td align="center">Hugo Quené [aut, cre]</td>
<td align="center">Hugo Quene <a href="mailto:h.quene@uu.nl">h.quene@uu.nl</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="even">
<td align="center">mice</td>
<td align="center">Multivariate Imputation by Chained Equations</td>
<td align="center">Stef van Buuren [aut, cre], Karin Groothuis-Oudshoorn [aut], Alexander Robitzsch [ctb], Gerko Vink [ctb], Lisa Doove [ctb], Shahab Jolani [ctb]</td>
<td align="center">Stef van Buuren <a href="mailto:stef.vanbuuren@tno.nl">stef.vanbuuren@tno.nl</a></td>
<td align="center">65.3116101</td>
</tr>
<tr class="odd">
<td align="center">SSrat</td>
<td align="center">Two-dimensional sociometric status determination with rating scales</td>
<td align="center">Hans Landsheer</td>
<td align="center">Hans Landsheer <a href="mailto:j.a.landsheer@uu.nl">j.a.landsheer@uu.nl</a></td>
<td align="center">65.3116101</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col width="15%"></col>
<col width="39%"></col>
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
<td align="center">lavaan</td>
<td align="center">Latent Variable Analysis</td>
<td align="center">Fit a variety of latent variable models, including confirmatory factor analysis, structural equation modeling and latent growth curve models.</td>
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
<td align="center">hqmisc</td>
<td align="center">Miscellaneous convenience functions and dataset</td>
<td align="center">This package contains some miscellaneous convenience functions, to create a matrix of dummy columns from a factor, to determine whether x lies in range [a,b], to add a rectangular bracket to an existing plot, and to convert frequencies between Hz, semitones, mel and Bark. This package also contains an example data set of a stratified sample of 80 talkers of Dutch.</td>
</tr>
<tr class="even">
<td align="center">mice</td>
<td align="center">Multivariate Imputation by Chained Equations</td>
<td align="center">Multiple imputation using Fully Conditional Specification (FCS) implemented by the MICE algorithm. Each variable has its own imputation model. Built-in imputation models are provided for continuous data (predictive mean matching, normal), binary data (logistic regression), unordered categorical data (polytomous logistic regression) and ordered categorical data (proportional odds). MICE can also impute continuous two-level data (normal model, pan, second-level variables). Passive imputation can be used to maintain consistency between variables. Various diagnostic plots are available to inspect the quality of the imputations.</td>
</tr>
<tr class="odd">
<td align="center">SSrat</td>
<td align="center">Two-dimensional sociometric status determination with rating scales</td>
<td align="center">SSRAT is a computer program for two-dimensional sociometric status determination with rating scales. For each person assessed, SSRAT computes probability distributions of the total scores for <code>sympathy' (S),</code>antipathy’ (A), <code>social preference' (P) and</code>social impact’ (I), and applies the criteria for sociometric status categorization.</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col width="9%"></col>
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
<td align="center">lavaan</td>
<td align="center">Latent Variable Analysis</td>
<td align="center">0.5-20</td>
<td align="center"><a href="http://lavaan.org" class="uri">http://lavaan.org</a></td>
<td align="center">2015-11-07</td>
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
<td align="center">hqmisc</td>
<td align="center">Miscellaneous convenience functions and dataset</td>
<td align="center">0.1-1</td>
<td align="center">NA</td>
<td align="center">2014-03-10</td>
</tr>
<tr class="even">
<td align="center">mice</td>
<td align="center">Multivariate Imputation by Chained Equations</td>
<td align="center">2.25</td>
<td align="center"><a href="http://www.stefvanbuuren.nl" class="uri">http://www.stefvanbuuren.nl</a> , <a href="http://www.multiple-imputation.com" class="uri">http://www.multiple-imputation.com</a></td>
<td align="center">2015-11-09</td>
</tr>
<tr class="odd">
<td align="center">SSrat</td>
<td align="center">Two-dimensional sociometric status determination with rating scales</td>
<td align="center">1.0</td>
<td align="center">NA</td>
<td align="center">2014-11-27</td>
</tr>
</tbody>
</table>


