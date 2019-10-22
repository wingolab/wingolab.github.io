---
layout: page
title: People
permalink: /people/
---

{% for group in site.lab_members %}

## **{{group.category}}**

{% for person in group.people %}

<div class="row bio-description">

{% if person.pic_name %}

<div class="col-md-auto">
<img class="picture" alt="{{person.pic_name}}" src="/assets/{{person.pic_name}}.jpg">
</div>

{% endif %}

<div markdown="1" class="col-md">

### {{person.title}}

{% for link in person.links %} \[[{{link.name}}]({{link.href}})\] {% endfor %}

{{person.description}}
</div>
</div>
{% endfor %}
{% endfor %}

## **Collaborators**

### [David Bennett, M.D.](https://www.rushu.rush.edu/faculty/david-bennett-md)
\[[NCBI Bibliography](https://www.ncbi.nlm.nih.gov/myncbi/browse/collection/40704410/?sort=date&direction=descending)\]
Dr. Bennett is the Director of the Rush Alzheimer’s Disease Core Center and
Principal Investigator of the Rush Memory and Aging Project. Dr. Bennett is an
internationally known Alzheimer's disease researcher.

### [Patricia Boyle, Ph.D.](https://www.rushu.rush.edu/faculty/patricia-boyle-phd)
\[[NCBI Bibliography](https://www.ncbi.nlm.nih.gov/myncbi/browse/collection/40700873/?sort=date&direction=descending)\]
Dr. Boyle is a neuropsychologist with the Rush Alzheimer’s Disease Center and
professor in the Department of Behavioral Sciences. Her primary interest is
the prevention of age-related cognitive and functional decline and dementia.

### [David Cutler, Ph.D.](http://genetics.emory.edu/faculty/faculty.php?facultyid=541)
\[[NCBI Bibliography](https://www.ncbi.nlm.nih.gov/pubmed/?term=cutler+DJ%5BAuthor%5D+OR+cutler+DJ%5BInvestigator%5D)\]
Dr. Cutler is a population and statistical geneticist, talented programmer,
and collaborates with us on family- and population-based studies of Alzheimer's
disease. His own work focuses on mapping, base-calling, and deep thinking about
the problems of next-generation sequencing and statistical genetics.

### [Greg Gibson, Ph.D.](http://gibsongatech.wordpress.com/)
\[[NCBI Bibliography](https://www.ncbi.nlm.nih.gov/myncbi/browse/collection/45886246/?sort=date&direction=descending)\]
Dr. Gibson is a Professor in the School of Biology at Georgia Tech. He obtained
his Ph.D. in genetics at the University of Basel and completed a Post-Doc training
at Stanford. Dr. Gibson's research focuses on how transcriptome profiling can be
used to understand more about the genetic basis of complex traits and disease
susceptibility.

### [Chadwick Hales, M.D., Ph.D.](http://neurology.emory.edu/faculty/cognitive/hales_chadwick.html)
\[[NCBI Bibliography](https://www.ncbi.nlm.nih.gov/myncbi/browse/collection/40511134/?sort=date&direction=descending)\]
Dr. Hales is a neurocognitive neurologist, neuroscientist, molecular biologist,
and electrophysiologist. His major focus is to understand pathological
accumulation of proteins in traumatic brain injury and neurodegenerative disease.

### [Peng Jin, Ph.D.](http://genetics.emory.edu/faculty/faculty.php?facultyid=124)
\[[NCBI Bibliography](https://www.ncbi.nlm.nih.gov/myncbi/browse/collection/40929012/?sort=date&direction=descending)\]
Dr. Jin is a geneticist interested in trinucleotide repeat disorders, microRNA,
and methylation and epigenetic changes as they related to neurodegenerative
illnesses. He is particularly interested in Fragile-X associated tremor-ataxia
syndrome and G4C2 expanded repeats in C9Orf72 implicated in amyotrophic lateral
sclerosis and frontotemporal dementia.

### [James Lah, M.D., Ph.D.](http://neurology.emory.edu/faculty/cognitive/lah_james.html)
\[[NCBI Bibliography](https://www.ncbi.nlm.nih.gov/myncbi/browse/collection/9513763/?sort=date&direction=descending)\]
Dr. Lah is a cognitive neurologist, Clinical Director of the Emory Alzheimer's
disease Research Center, and the vice-chair for the Emory University Department
of Neurology. His interests include in RNA splicing and using proteomics to
understand the pathogenesis of Alzheimer's disease.

### [Allan I. Levey, M.D., Ph.D.](http://neurology.emory.edu/faculty/cognitive/levey_allan.html)
\[[NCBI Bibliography](https://www.ncbi.nlm.nih.gov/myncbi/browse/collection/41138971/?sort=date&direction=descending)\]
Dr. Levey is a Chair of the Emory University Department of Neurology, Director
of the Emory Alzheimer's Disease Research Center, cognitive neurologist, and
neuroscientist/neuroanatomist.

### [Benjamin Logsdon, Ph.D.](https://www.synapse.org/#!Profile:274008)
\[[NCBI Bibliography](https://www.ncbi.nlm.nih.gov/myncbi/browse/collection/51097519/?sort=date&direction=descending)\]
Dr. Logsdon received his Ph.D. in Computational Biology at Cornell University
and post-doctoral training in statistical genetics and genome sciences at the
Fred Hutchinson Cancer Research Center and University of Washington. Dr. Logsdon
is a senior scientist at [Sage Bionetworks](http://sagebase.org/).

### [Kerry Ressler, M.D., Ph.D.](https://www.mcleanhospital.org/biography/kerry-ressler)
\[[NCBI Bibliography](https://www.ncbi.nlm.nih.gov/myncbi/browse/collection/41158960/?sort=date&direction=descending)\]
Dr. Ressler is chief scientific officer and James and Patricia Poitras Chair
in Psychiatry at McLean Hospital. Dr. Ressler’s lab focuses on translational
research bridging molecular neurobiology in animal models with human genetic
research on emotion, particularly fear and anxiety disorders. Dr. Ressler has
been mentor for Dr. Aliza Wingo on her career development award and continues
to collaborate with her on different projects.

### [Nicholas Seyfried, DPhil.](http://proteox.genetics.emory.edu/emory/people.html)
\[[NCBI Bibliography](https://www.ncbi.nlm.nih.gov/myncbi/browse/collection/47321017/?sort=date&direction=descending)\]
Dr. Seyfried is a biochemist and proteomics expert. He and Dr. Thomas Wingo lead
a project that focuses on understanding genes identified in Alzheimer's Disease
genome-wide association studies may contribute to pathologic accumulation of
aggregated proteins
([NIH Reporter](https://projectreporter.nih.gov/project_info_description.cfm?aid=9280749&icde=0)).

## **Alumni**

### Melissa Armendariz, B.S.
Ms. Armendariz Ms. Armendariz graduated from Virginia Tech with a B.S. in Biochemistry and a minor in Chemistry and Psychology. She was a research coordinator for the Wingo lab from 2016-2019. She left to work for a private company in Georgia.


### Alex Kotlar, Ph.D.
Dr. Kotlar received his Ph.D. in Genetics at Emory University in 2018 where
he was guided by Dr. Wingo in the development of online services (e.g.,
[https://bystro.io](https://bystro.io)) that assisted researchers in analyzing
terabytes of genomic data, decreasing analysis times by an order of magnitude.
He briefly joined the Wingo Lab as a postdoctoral fellow working on next-generation
online proteomics services. He is currently a [postdoctoral fellow](http://www.atgu.mgh.harvard.edu/people/1144/)
at the Broad Institute of Harvard and MIT.

### Brittney Innocente, B.A.
Ms. Innocente was a research coordinator in 2015-2016 who led Dr. Aliza 
Wingo's Genome-wide Association Study of Resilience until its completion
in 2016.

### Eleanor A. Sharp, M.D., M.S.
As an undergraduate student at University of Georgia, Ms. Sharp examined patterns of Inheritance among families with Early-onset Alzheimer’s Disease with Dr. Wingo as a student in the 2012 [SURE program](http://college.emory.edu/undergraduate-research/index.html). She went on to obtain her medical and masters degree from Virginia School of Medicine and is now a pediatric resident at UPMC Children's Hospital of Pittsburgh.

### Stephanie Stennett, M.A.
Ms. Stennett was a research coordinator from 2012-2013 who led Dr. Aliza
Wingo's Genome-wide Association Study of Resilience before she moved to
Texas to work for a private company.

### Zoe White, B.S.
Ms. White was a senior research technician from 2012-2017. She performed
targeted capture and next-generation sequencing experiments to identify
new genetic causes of Alzheimer's Disease.

### Maohua Xie, Ph.D.
Dr. Xie was a Bioinformatic Scientist from 2018-2019. He received his
Master Degree in Analytics at Georgia State University and Ph.D. in
Biochemistry and Molecular Biology at Wuhan University, China. His work
focused on proteogenomic approaches to identifing novel genetic variants
related to AD.

### Ha Eun Kong, B.S.
Ms. Kong was an M.D./Ph.D. student in [Genetics and Molecular Biology Graduate Program](http://www.biomed.emory.edu/PROGRAM_SITES/GMB/index.html) co-mentored by Drs. Peng Jin and Thomas Wingo. The focus of her work was to identify new genetic modifiers of Fragile X Tremor Ataxia Syndrome and causes of Alzheimer's disease. Ms. Kong is currently completing her medical degree at Emory University.

### Wen Fan, MS.
Ms. Fan was a biostatistician from 2018-2019 who led the quality control efforts of brain proteomics data and analysis of large omics datasets generated by the Wingo Lab and our collaborators. She left the lab in 2019 to work for a private company in North Carolina.