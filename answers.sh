 #! /usr/bin/env bash
datasets='/vol3/home/johnsonr/data-sets'
#Which state has the highest population?
states="$datasets/states.tab.gz"

answer_1=$(zcat $states \
| grep -v '^#' \
| sort -k6n \
| head -n1 \
| cut -f1 \
| sed 's/"//g')

echo "answer-1: $answer_1"
#sed 'substitute/this/forthat/global-allofthem'
#How many sequence records are in the sample.fa file?
sample="$datasets/sample.fa"

answer_2=$(cat $sample \
| grep -c '^>')

echo "answer-2: $answer_2"

#How many unique CpG IDs are in cpg.bed.gz?
#unique IDs in column 4
cpg="$datasets/cpg.bed.gz"

answer_3=$(zcat $cpg \
| cut -f4 | sort | uniq | wc -l)

echo "answer-3: $answer_3"

#How many sequence records are in the SP1.fq file?
#id starts with @
#grep begins with @cluster
sp1="$datasets/SP1.fq"

answer_4=$(cat $sp1 \
| grep -c '^@cluster')

echo "answer-4: $answer_4"

#How many words on are lines containing the word bloody in hamlet.txt? (Hint: use wc to count words).
hamlet="$datasets/hamlet.txt"

answer_5=$(cat $hamlet \
| grep -i 'bloody' \
| wc -w )

echo "answer-5: $answer_5"
#grep bloody, count words on those lines (wc)

#What is the length of the sequence in the first record of sample.fa? (Hint: use wc to count characters).
answer_6=$(cat $sample \
| head -n2 \
| tail -n1 \
| tr -d '\n\r' \
| wc -m )

echo "answer-6: $answer_6"

#What is the name of the longest gene in genes.hg19.bed.gz?
#subtract column 3-2 to get length of genes
#zcat genes.hg19.bed.gz | awk '{print $4, $3 - $2}' | sort -k2nr | cut -f1 -d' '
hg19="$datasets/genes.hg19.bed.gz"
answer_7=$(zcat $hg19 \
| awk '{print $4, $3 - $2}' \
| sort -k2nr \
| head -n1 \
| cut -f1 -d' ')

echo "answer-7: $answer_7"

#How many unique chromosomes are in genes.hg19.bed.gz?
answer_8=$(zcat $hg19 \
| cut -f1 \
| sort \
| uniq \
| wc -l )

echo "answer-8: $answer_8"

#How many intervals are associated with CTCF (not CTCFL) in peaks.chr22.bed.gz?
#$denotes end of line
peaks="$datasets/peaks.chr22.bed.gz"
answer_9=$(zcat $peaks \
| cut -f4 \
| grep -v 'L$' \
| grep -c 'CTCF' )

echo "answer-9: $answer_9"

#On what chromosome is the largest interval in lamina.bed?
#Q10 same as 7 
lamina="$datasets/lamina.bed"
answer_10=$(cat $lamina \
| awk '{print $1, $3 - $2}' \
| sort -k2nr \
| head -n1 \
| cut -f1 -d' ')

echo "answer-10: $answer_10"



# ...
# echo "answer-2: $answer_2" >> answers.yml

