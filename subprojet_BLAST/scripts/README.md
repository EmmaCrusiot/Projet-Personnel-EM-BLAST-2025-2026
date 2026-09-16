# Scripts du sous-projet BLAST et Clustering hiérarchique

Vous trouverez un script R nommé `analyse_BLAST_CH.R` qui contient les commandes et les explications. 

En résumé, ce script permet de : 

- télécharger les fichiers FASTA des séquences nucléotidiques des espèces de mammifères dans `data/` et ce de manière automatique.
- de faire une analyse BLAST sur R en utilisant le fichier FASTA du Chat comme séquence de référence pour le comparer avec les autres fichiers.
- d'effectuer un clustering hiérarchique avec le paramètre choisi qui est le pourcentage d'identité et de générer un dendogramme.  
- de créer deux fichiers dans `resultats/` : 
    - un tableau sous format csv contenant les résultats après analyse BLAST sous le nom `tableau_BLAST.csv`.
    - une image sous format png contenant le dendrogramme obtenu après clustering hiérarchique sous le nom `dendrogramme_CH.png`. 

## Packages nécessaires

Il vous faudra télécharger le package rBLAST depuis GitHub et le package Biostrings de Bioconductor en utilisant ces commandes sur R  : 

- pour le package rBLAST : 
    install.packages("devtools")
    devtools::install_github("mhahsler/rBLAST")

- pour le package Biostrings : 
    if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

    BiocManager::install("Biostrings")

## Dépendance externe 

Il faut en plus télécharger BLAST+ à partir de <https://www.ncbi.nlm.nih.gov/books/NBK569861/>.