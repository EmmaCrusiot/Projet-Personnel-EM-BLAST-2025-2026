# Projet personnel : Analyse en génétique et bio-informatique

Le but du projet est d'étudier deux gènes : 
- Le gène LVRN 
- Le gène MYH7 

Pour le premier, notre étude se fera sur comment calculer les fréquences alléliques à partir de deux méthodes, le principe d'Hardy-Weinberg et l'algorithme d'espérance-maximisation (EM).

Pour le second, l'étude se porte sur la comparaison des séquences nucléotides chez différents mammifères avec BLAST puis la visualisation des regroupements avec un clustering hiérarchique. 

Le rapport complet est trouvable dans  `rapport/projet_EM_BLAST.pdf`. 

## Structure du dossier 

Le projet a été séparé en deux sous-projets : 

- `subprojet_EM` qui concerne le gène LVRN.
- `subprojet_BLAST` qui concerne le gène MYH7. 

Dans chacuns des sous-projets, vous trouverez : 

- `data/` qui contient les données brutes. 
- `scripts/` qui contient les scripts R. 
- `resultats/` qui contient les résultats générés. 

## Prérequis 

### Packages nécessaires

- package rBLAST à partir de <https://github.com/mhahsler/rBLAST>
- package Biostrings à partir de <https://bioconductor.org/packages/release/bioc/html/Biostrings.html>

### Dépendance externe 

En plus des packages R, il faut télécharger BLAST+ à partir de <https://www.ncbi.nlm.nih.gov/books/NBK569861/>

### Versions des softwares

- Version R : 4.4.1
- Version package rBLAST : 1.2.0
- Version package Biostrings : 2.74.1
