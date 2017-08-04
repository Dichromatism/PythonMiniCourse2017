#!/bin/bash
#
while read j

do
   i=`printf $j`;
   curl -L "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=${i}&rettype=fasta"
   j=$((j+1))

done < list.txt