---
title       : Analysis of Yeast RNA-seq Data
subtitle    : by Karl, the segmenTier
author      : Rainer Machne
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : mathjax       # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

--- .centertext
<style>
em {
  font-style: italic
}
</style>
<style>
oq {
    background-color:yellow;
    color:#CC2904;
    font-weight: bold;
}
</style>


### Karl, the segmenTier

---

### Primary Segmentation 

length distribution, border scanning

script `presegment.R` 

---

### Test Sets: Karl on busy feet
example primary segment 
-> problems: too little or too much fragmentation
-> scan overlaps and select best hits

script `clusterSegment.R`  (`segmenTier`)

---

### Genome-wide Parameter Scans

$$latex
\begin{aligned}
    I(Q,T) =& |Q \cap T|\\
    U(Q,T) =& |Q \cup T|\\
	J(Q,T) =& \frac{I}{U}\\
	R(Q,T) =& \frac{|Q|}{|T|}
\end{aligned}
$$

Figures:
* measures: jaccard, fragmentation and ratio thresholds
* ratio CDF (clustered) & .8-1.2 range (sorted)
* heights & jaccard vs. numhits & clusterpval
* above for A vs. D, ORF vs. CUT/SUT

1. optimization of settings: 
   best: dcash, E1-5; 
   not much influence from K and ccor/icor;
   TODO: test M, and more internal parameters
2. biology: difference A, D, CUT

scripts `testSegment.R` (`segmenTools`)

---

### Best Segmentation

* ratio CDF for all transcripts & cltranscripts

1. optimize for different targets?
2. hierarchical approach?

---

### Segment Annotation

classes: 
* ID, rank, covers, inside, upstream or downstream, jaccard
* next upstream/downstream, distance
* same for antisense

figures:
* by clusters: highest rank vs. sense/antisense 

---

### Segment Dynamics

* read-count
* phase-dist (pval-dist)

-> compare to annotation; e.g. upstream-downstream pairs,
sense-antisense pairs

