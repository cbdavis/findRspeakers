# findRspeakers
Find people nearby who can give presentations about their interesting work with R.  Currently this only tries to match patterns in the e-mail addresses of package authors and maintainers.

## Installation
```
library(devtools)
install_github("cbdavis/findRspeakers")
```

## Example use
Find all speakers with e-mail addresses containing rug.nl.  Information on the packages is returned as a data frame, below `pander` is used to format the dataframe into an html table.
```
library(findRspeakers)
library(pander)
possibleSpeakers = findRspeakers("rug\\.nl")
pander(possibleSpeakers, split.table=Inf)
```


<table style="width:100%;">
<colgroup>
<col width="4%" />
<col width="4%" />
<col width="12%" />
<col width="14%" />
<col width="12%" />
<col width="15%" />
<col width="4%" />
<col width="26%" />
<col width="4%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">Package</th>
<th align="center">Title</th>
<th align="center">Author</th>
<th align="center">Maintainer</th>
<th align="center">Description</th>
<th align="center">Version</th>
<th align="center">URL</th>
<th align="center">Published</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>1527</strong></td>
<td align="center">designGG</td>
<td align="center">Computational tool for designing genetical genomics experiments</td>
<td align="center">Yang Li <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#x79;&#x61;&#110;&#x67;&#46;&#108;&#x69;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x79;&#x61;&#110;&#x67;&#46;&#108;&#x69;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript>, Morris Swertz <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#x6d;&#46;&#x61;&#46;&#x73;&#x77;&#x65;&#114;&#116;&#122;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x6d;&#46;&#x61;&#46;&#x73;&#x77;&#x65;&#114;&#116;&#122;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript>, Gonzalo Vera <script type="text/javascript">
<!--
h='&#x67;&#x6d;&#x61;&#x69;&#108;&#46;&#x63;&#x6f;&#x6d;';a='&#64;';n='&#x67;&#x6f;&#110;&#122;&#x61;&#108;&#x6f;&#46;&#118;&#x65;&#114;&#x61;&#46;&#114;&#x6f;&#100;&#114;&#x69;&#x67;&#x75;&#x65;&#122;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x67;&#x6f;&#110;&#122;&#x61;&#108;&#x6f;&#46;&#118;&#x65;&#114;&#x61;&#46;&#114;&#x6f;&#100;&#114;&#x69;&#x67;&#x75;&#x65;&#122;&#32;&#x61;&#116;&#32;&#x67;&#x6d;&#x61;&#x69;&#108;&#32;&#100;&#x6f;&#116;&#32;&#x63;&#x6f;&#x6d;</noscript>, Rainer Breitling <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#114;&#46;&#98;&#114;&#x65;&#x69;&#116;&#108;&#x69;&#110;&#x67;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#114;&#46;&#98;&#114;&#x65;&#x69;&#116;&#108;&#x69;&#110;&#x67;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript>, Ritsert Jansen <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#114;&#46;&#x63;&#46;&#106;&#x61;&#110;&#x73;&#x65;&#110;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#114;&#46;&#x63;&#46;&#106;&#x61;&#110;&#x73;&#x65;&#110;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">Yang Li <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#x79;&#x61;&#110;&#x67;&#46;&#108;&#x69;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x79;&#x61;&#110;&#x67;&#46;&#108;&#x69;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">The package provides R scripts for designing genetical genomics experiments.</td>
<td align="center">1.1</td>
<td align="center"><a href="http://www.rug.nl/research/bioinformatics/" class="uri">http://www.rug.nl/research/bioinformatics/</a></td>
<td align="center">2013-02-19</td>
</tr>
<tr class="even">
<td align="center"><strong>5233</strong></td>
<td align="center">pheno2geno</td>
<td align="center">High-Throughput Generation of Genetic Markers and Maps from Molecular Phenotypes for Crosses Between Inbred Strains</td>
<td align="center">Konrad Zych <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#x6b;&#46;&#122;&#x79;&#x63;&#104;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x6b;&#46;&#122;&#x79;&#x63;&#104;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript> and Danny Arends <script type="text/javascript">
<!--
h='&#x67;&#x6d;&#x61;&#x69;&#108;&#46;&#x63;&#x6f;&#x6d;';a='&#64;';n='&#100;&#x61;&#110;&#110;&#x79;&#46;&#x61;&#114;&#x65;&#110;&#100;&#x73;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#100;&#x61;&#110;&#110;&#x79;&#46;&#x61;&#114;&#x65;&#110;&#100;&#x73;&#32;&#x61;&#116;&#32;&#x67;&#x6d;&#x61;&#x69;&#108;&#32;&#100;&#x6f;&#116;&#32;&#x63;&#x6f;&#x6d;</noscript></td>
<td align="center">Konrad Zych <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#x6b;&#46;&#122;&#x79;&#x63;&#104;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x6b;&#46;&#122;&#x79;&#x63;&#104;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">High-throughput generation of genetic markers from molecular phenotypes for crosses between inbred strains. These markers can be use to saturate existing genetic map or creating a new one.</td>
<td align="center">1.3.1</td>
<td align="center">NA</td>
<td align="center">2015-03-25</td>
</tr>
<tr class="odd">
<td align="center"><strong>6052</strong></td>
<td align="center">reGenotyper</td>
<td align="center">Detecting Mislabeled Samples in Genetic Data</td>
<td align="center">Yang Li <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#x79;&#x61;&#110;&#x67;&#46;&#108;&#x69;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x79;&#x61;&#110;&#x67;&#46;&#108;&#x69;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">Yang Li <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#x79;&#x61;&#110;&#x67;&#46;&#108;&#x69;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x79;&#x61;&#110;&#x67;&#46;&#108;&#x69;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">Detecting mislabeled samples in genetic data.</td>
<td align="center">1.2.0</td>
<td align="center">NA</td>
<td align="center">2015-05-05</td>
</tr>
<tr class="even">
<td align="center"><strong>472</strong></td>
<td align="center">BDgraph</td>
<td align="center">Bayesian Graph Selection Based on Birth-Death MCMC Approach</td>
<td align="center">Abdolreza Mohammadi and Ernst Wit</td>
<td align="center">Abdolreza Mohammadi <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#x61;&#46;&#x6d;&#x6f;&#104;&#x61;&#x6d;&#x6d;&#x61;&#100;&#x69;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x61;&#46;&#x6d;&#x6f;&#104;&#x61;&#x6d;&#x6d;&#x61;&#100;&#x69;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">Provides statistical tools for Bayesian structure learning in undirected graphical models with both continuous and discrete variables.</td>
<td align="center">2.27</td>
<td align="center"><a href="https://www.tilburguniversity.edu/webwijs/show/a.mohammadi.htm" class="uri">https://www.tilburguniversity.edu/webwijs/show/a.mohammadi.htm</a></td>
<td align="center">2016-04-22</td>
</tr>
<tr class="odd">
<td align="center"><strong>1389</strong></td>
<td align="center">DAISIE</td>
<td align="center">Dynamical Assembly of Islands by Speciation, Immigration and Extinction</td>
<td align="center">Rampal S. Etienne, Luis M. Valente, Albert B. Phillimore &amp; Bart Haegenan</td>
<td align="center">Rampal S. Etienne <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#114;&#46;&#x73;&#46;&#x65;&#116;&#x69;&#x65;&#110;&#110;&#x65;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#114;&#46;&#x73;&#46;&#x65;&#116;&#x69;&#x65;&#110;&#110;&#x65;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">Simulates and computes the (maximum) likelihood of a dynamical model of island biota assembly through speciation, immigration and extinction. See Valente et al. 2015. Ecology Letters 18: 844-852.</td>
<td align="center">1.0.2</td>
<td align="center">NA</td>
<td align="center">2015-09-29</td>
</tr>
<tr class="even">
<td align="center"><strong>1393</strong></td>
<td align="center">DAMOCLES</td>
<td align="center">Dynamic Assembly Model of Colonization, Local Extinction and Speciation</td>
<td align="center">Rampal S. Etienne &amp; Alex L. Pigot</td>
<td align="center">Rampal S. Etienne <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#114;&#46;&#x73;&#46;&#x65;&#116;&#x69;&#x65;&#110;&#110;&#x65;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#114;&#46;&#x73;&#46;&#x65;&#116;&#x69;&#x65;&#110;&#110;&#x65;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">Simulates and computes (maximum) likelihood of a dynamical model of community assembly that takes into account phylogenetic history.</td>
<td align="center">1.1</td>
<td align="center">NA</td>
<td align="center">2015-03-05</td>
</tr>
<tr class="odd">
<td align="center"><strong>1451</strong></td>
<td align="center">DDD</td>
<td align="center">Diversity-Dependent Diversification</td>
<td align="center">Rampal S. Etienne &amp; Bart Haegeman</td>
<td align="center">Rampal S. Etienne <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#114;&#46;&#x73;&#46;&#x65;&#116;&#x69;&#x65;&#110;&#110;&#x65;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#114;&#46;&#x73;&#46;&#x65;&#116;&#x69;&#x65;&#110;&#110;&#x65;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">Implements maximum likelihood methods based on the diversity-dependent birth-death process to test whether speciation or extinction are diversity-dependent. See Etienne et al. 2012, Proc. Roy. Soc. B 279: 1300-1309, <a href="DOI:10.1098/rspb.2011.1439" class="uri">DOI:10.1098/rspb.2011.1439</a>. Also implements maximum likelihood methods to detect various types of key innovations in the light of diversity-dependence. See Etienne &amp; Haegeman 2012, Am. Nat. 180: E75-E89, <a href="DOI:10.1086/667574" class="uri">DOI:10.1086/667574</a>. Finally, DDD contains a function to simulate the diversity-dependent process.</td>
<td align="center">3.2</td>
<td align="center">NA</td>
<td align="center">2016-02-09</td>
</tr>
<tr class="even">
<td align="center"><strong>2552</strong></td>
<td align="center">gemtc</td>
<td align="center">Network Meta-Analysis Using Bayesian Methods</td>
<td align="center">Gert van Valkenhoef, Joel Kuiper</td>
<td align="center">Gert van Valkenhoef <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#x67;&#46;&#104;&#46;&#x6d;&#46;&#118;&#x61;&#110;&#46;&#118;&#x61;&#108;&#x6b;&#x65;&#110;&#104;&#x6f;&#x65;&#102;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x67;&#46;&#104;&#46;&#x6d;&#46;&#118;&#x61;&#110;&#46;&#118;&#x61;&#108;&#x6b;&#x65;&#110;&#104;&#x6f;&#x65;&#102;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">Network meta-analyses (mixed treatment comparisons) in the Bayesian framework using JAGS. Includes methods to assess heterogeneity and inconsistency, and a number of standard visualizations.</td>
<td align="center">0.8</td>
<td align="center"><a href="http://github.com/gertvv/gemtc" class="uri">http://github.com/gertvv/gemtc</a></td>
<td align="center">2016-03-01</td>
</tr>
<tr class="odd">
<td align="center"><strong>2553</strong></td>
<td align="center">gemtc.jar</td>
<td align="center">GeMTC Java binary</td>
<td align="center">Gert van Valkenhoef, Joel Kuiper</td>
<td align="center">Gert van Valkenhoef <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#x67;&#46;&#104;&#46;&#x6d;&#46;&#118;&#x61;&#110;&#46;&#118;&#x61;&#108;&#x6b;&#x65;&#110;&#104;&#x6f;&#x65;&#102;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x67;&#46;&#104;&#46;&#x6d;&#46;&#118;&#x61;&#110;&#46;&#118;&#x61;&#108;&#x6b;&#x65;&#110;&#104;&#x6f;&#x65;&#102;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">An R package providing the Java JAR for the gemtc package</td>
<td align="center">0.14.3</td>
<td align="center">NA</td>
<td align="center">2013-01-21</td>
</tr>
<tr class="even">
<td align="center"><strong>3072</strong></td>
<td align="center">hitandrun</td>
<td align="center">&quot;Hit and Run&quot; and &quot;Shake and Bake&quot; for Sampling Uniformly from Convex Shapes</td>
<td align="center">Gert van Valkenhoef, Tommi Tervonen</td>
<td align="center">Gert van Valkenhoef <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#x67;&#46;&#104;&#46;&#x6d;&#46;&#118;&#x61;&#110;&#46;&#118;&#x61;&#108;&#x6b;&#x65;&#110;&#104;&#x6f;&#x65;&#102;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x67;&#46;&#104;&#46;&#x6d;&#46;&#118;&#x61;&#110;&#46;&#118;&#x61;&#108;&#x6b;&#x65;&#110;&#104;&#x6f;&#x65;&#102;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">The &quot;Hit and Run&quot; Markov Chain Monte Carlo method for sampling uniformly from convex shapes defined by linear constraints, and the &quot;Shake and Bake&quot; method for sampling from the boundary of such shapes. Includes specialized functions for sampling normalized weights with arbitrary linear constraints.</td>
<td align="center">0.5-2</td>
<td align="center"><a href="http://github.com/gertvv/hitandrun" class="uri">http://github.com/gertvv/hitandrun</a></td>
<td align="center">2015-07-10</td>
</tr>
<tr class="odd">
<td align="center"><strong>4635</strong></td>
<td align="center">neat</td>
<td align="center">Network Enrichment Analysis Test (NEAT)</td>
<td align="center">Mirko Signorelli, Veronica Vinciotti and Ernst C. Wit</td>
<td align="center">Mirko Signorelli <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#x6d;&#46;&#x73;&#x69;&#x67;&#110;&#x6f;&#114;&#x65;&#108;&#108;&#x69;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x6d;&#46;&#x73;&#x69;&#x67;&#110;&#x6f;&#114;&#x65;&#108;&#108;&#x69;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">Includes functions and examples to compute NEAT, a network-based test for gene enrichment analysis.</td>
<td align="center">0.0</td>
<td align="center">NA</td>
<td align="center">2016-04-21</td>
</tr>
<tr class="even">
<td align="center"><strong>4659</strong></td>
<td align="center">NetSim</td>
<td align="center">A Social Networks Simulation Tool in R</td>
<td align="center">Christoph Stadtfeld</td>
<td align="center">Christoph Stadtfeld <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#x63;&#46;&#x73;&#116;&#x61;&#100;&#116;&#102;&#x65;&#108;&#100;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x63;&#46;&#x73;&#116;&#x61;&#100;&#116;&#102;&#x65;&#108;&#100;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">NetSim allows to combine and simulate a variety of micro-models to research their impact on the macro-features of social networks.</td>
<td align="center">0.9</td>
<td align="center">NA</td>
<td align="center">2013-12-15</td>
</tr>
<tr class="odd">
<td align="center"><strong>5100</strong></td>
<td align="center">PBD</td>
<td align="center">Protracted Birth-Death Model of Diversification</td>
<td align="center">Rampal S. Etienne</td>
<td align="center">Rampal S. Etienne <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#114;&#46;&#x73;&#46;&#x65;&#116;&#x69;&#x65;&#110;&#110;&#x65;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#114;&#46;&#x73;&#46;&#x65;&#116;&#x69;&#x65;&#110;&#110;&#x65;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">Conducts maximum likelihood analysis and simulation of the protracted speciation model.</td>
<td align="center">1.2</td>
<td align="center">NA</td>
<td align="center">2016-03-04</td>
</tr>
<tr class="even">
<td align="center"><strong>5187</strong></td>
<td align="center">PerFit</td>
<td align="center">Person Fit</td>
<td align="center">Jorge N. Tendeiro</td>
<td align="center">Jorge N. Tendeiro <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#106;&#46;&#110;&#46;&#116;&#x65;&#110;&#100;&#x65;&#x69;&#114;&#x6f;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#106;&#46;&#110;&#46;&#116;&#x65;&#110;&#100;&#x65;&#x69;&#114;&#x6f;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">Several person-fit statistics (PFSs) are offered. These statistics allow assessing whether individual response patterns to tests or questionnaires are (im)plausible given the other respondents in the sample or given a specified item response theory model. Some PFSs apply to dichotomous data, such as the likelihood-based PFSs (lz, lz*) and the group-based PFSs (personal biserial correlation, caution index, (normed) number of Guttman errors, agreement/disagreement/dependability statistics, U3, ZU3, NCI, Ht). PFSs suitable to polytomous data include extensions of lz, U3, and (normed) number of Guttman errors.</td>
<td align="center">1.4</td>
<td align="center">NA</td>
<td align="center">2015-07-20</td>
</tr>
<tr class="odd">
<td align="center"><strong>5360</strong></td>
<td align="center">pnea</td>
<td align="center">Parametric Network Enrichment Analysis</td>
<td align="center">Mirko Signorelli, Veronica Vinciotti and Ernst C. Wit</td>
<td align="center">Mirko Signorelli <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#x6d;&#46;&#x73;&#x69;&#x67;&#110;&#x6f;&#114;&#x65;&#108;&#108;&#x69;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x6d;&#46;&#x73;&#x69;&#x67;&#110;&#x6f;&#114;&#x65;&#108;&#108;&#x69;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">Includes functions and examples to compute Parametric Network Enrichment Analysis.</td>
<td align="center">1.2.4</td>
<td align="center">NA</td>
<td align="center">2016-01-12</td>
</tr>
<tr class="even">
<td align="center"><strong>7074</strong></td>
<td align="center">smaa</td>
<td align="center">Stochastic Multi-Criteria Acceptability Analysis</td>
<td align="center">Gert van Valkenhoef</td>
<td align="center">Gert van Valkenhoef <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#x67;&#46;&#104;&#46;&#x6d;&#46;&#118;&#x61;&#110;&#46;&#118;&#x61;&#108;&#x6b;&#x65;&#110;&#104;&#x6f;&#x65;&#102;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#x67;&#46;&#104;&#46;&#x6d;&#46;&#118;&#x61;&#110;&#46;&#118;&#x61;&#108;&#x6b;&#x65;&#110;&#104;&#x6f;&#x65;&#102;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">Implementation of the Stochastic Multi-Criteria Acceptability Analysis (SMAA) family of Multiple Criteria Decision Analysis (MCDA) methods.</td>
<td align="center">0.2-4</td>
<td align="center"><a href="http://github.com/gertvv/rsmaa" class="uri">http://github.com/gertvv/rsmaa</a></td>
<td align="center">2015-07-10</td>
</tr>
<tr class="odd">
<td align="center"><strong>7241</strong></td>
<td align="center">SparseTSCGM</td>
<td align="center">Sparse Time Series Chain Graphical Models</td>
<td align="center">Fentaw Abegaz and Ernst Wit</td>
<td align="center">Fentaw Abegaz <script type="text/javascript">
<!--
h='&#114;&#x75;&#x67;&#46;&#110;&#108;';a='&#64;';n='&#102;&#46;&#x61;&#98;&#x65;&#x67;&#x61;&#122;&#46;&#x79;&#x61;&#122;&#x65;&#x77;';e=n+a+h;
document.write('<a h'+'ref'+'="ma'+'ilto'+':'+e+'" clas'+'s="em' + 'ail">'+e+'<\/'+'a'+'>');
// -->
</script><noscript>&#102;&#46;&#x61;&#98;&#x65;&#x67;&#x61;&#122;&#46;&#x79;&#x61;&#122;&#x65;&#x77;&#32;&#x61;&#116;&#32;&#114;&#x75;&#x67;&#32;&#100;&#x6f;&#116;&#32;&#110;&#108;</noscript></td>
<td align="center">Computes sparse vector autoregressive coefficients and precision matrices for time series chain graphical models.</td>
<td align="center">2.2</td>
<td align="center">NA</td>
<td align="center">2015-07-16</td>
</tr>
</tbody>
</table>
