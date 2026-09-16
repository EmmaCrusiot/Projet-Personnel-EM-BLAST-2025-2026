# Données pour BLAST 

Les données sont des séquences nucléotidiques du gène MYH7 chez 11 espèces de mammifères (Chat, Chien, Cheval, Cochon, Vache, Souris, Rat, Elephant, Dauphin, Humain, Chimpanzé). 

Les données ont été obtenu en janvier 2026.

## Pour les obtenir 

Les fichiers FASTA sont téléchargés de manière automatique par le script R suivant : `scripts/analyse_BLAST.R`

Dans le script, le téléchargment se fait grâce à un format de lien du NCBI qui est : "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgidb=nucleotide&id=<uid_list>&rettype=fasta&retmode=text". 

Il suffit alors de remplacer "<uid_list>" par l'identifiant NCBI de la séquence. 

De plus, un autre fichier FASTA est télécharger automatiquement grâce au même script contenant tous les fichiers FASTA réunis pour permettre la création d'une base de données locale. 

## Sources 

- Source : NCBI GenBank 
- Identifiant NCBI de chaque séquence : 

| Espèce  | Identifiant NCBI |
| ------| -------------- |
 Chat    | XM_006932746.5
  Chien   | NM_001113711.1
  Cheval  | XM_014733468.3
  Cochon  | NM_213855.2
  Vache   | NM_174727.1
  Souris  | NM_080728.3
  Rat     | NM_017240.2
  Elephant| XM_064292317.1
  Dauphin | XM_007449562.1
  Humain  | NM_000257.4
  Chimpanzé| XM_016925890.4
