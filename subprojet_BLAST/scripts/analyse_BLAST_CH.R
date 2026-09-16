### Exercice 2 : Le gène MYH7 chez les Mammifères ### 

setwd("~/projet_EM_BLAST/subprojet_BLAST")

library("rBLAST", "Biostrings")

## Téléchargement des fichiers FASTA 

# Pour le téléchargement, nous utilisons la commande «download.file».
download.file('https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=XM_006932746.5&rettype=fasta&retmode=text',
              destfile = 'data/MYH7_Chat.fasta')

# Nous allons lire le fichier FASTA et le mettre sous le nom «query».
query <- readDNAStringSet('data/MYH7_Chat.fasta')

# Pour le reste, nous allons automatiser. 
# Ici, nous définissons l’identifiant NCBI de toutes les séquences.
sujets_num <- c('NM_000257.4','XM_014733468.3','NM_001113711.1',
                'NM_080728.3','NM_017240.2','NM_213855.2',
                'NM_174727.1','XM_016925890.4','XM_064292317.1','XM_007449562.1')

# Ici, nous définissons le nom des espèces correspondantes.
id <- c('Humain', 'Cheval', 'Chien','Souris','Rat',
        'Cochon','Vache','Chimpanzee','Elephant','Dauphin')

# Ici, nous allons créer le nom de chaque fichier FASTA. 
sujets_id <- paste0('data/MYH7_', id,'.fasta')

# Nous pouvons télécharger de manière automatique. 
for (i in 1:10){
  # Utiliser paste0 nous permet de pouvoir rajouter l’identifiant des séquences 
  # et avoir le lien final pour toutes les séquences. 
  download.file(paste0('https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=',sujets_num[i],'&rettype=fasta&retmode=text')
                , sujets_id[i])
}

# Nous pouvons lire les fichiers et les rassembler puis s’assurer que ça a bien fonctionné. 
sujets_files <- readDNAStringSet(sujets_id) 
print(sujets_files)


## Analyse BLAST 

# Création de l’objet avec tous nos fichiers.
all_files <- c(sujets_files,query)

# Création d’un nouveau fichier combinant tout.
writeXStringSet(all_files, filepath = 'data/all_files.fasta')

# Création de la base de données locale.
database <- makeblastdb('data/all_files.fasta', dbtype='nucl')

# Nous pouvons exécuter BLAST. 
blast <- blast(db = 'data/all_files.fasta', type = 'blastn')
results <- predict(blast, query)
print(results)


## Clustering 

# Création d’un dataframe avec les identifiants et le paramètre choisi.
new_results <- data.frame(results$sseqid, results$pident, row.names = c("Chat","Cheval","Chien","Cochon","Dauphin","Vache","Chimpanzé","Humain","Elephant","Rat","Souris"))
print(new_results)


# Nous pouvons calculer la matrice des distances et réaliser un clustering hiérarchique.
hclust(dist(new_results))

# Enfin, nous pouvons faire le dendrogramme avec plot. 
plot(hclust(dist(new_results)), 
     hang = -1,
     main = "Dendrogramme illustrant la similarité des séquences du gène MYH7 entre le chat et différents mammifères")


## Création des fichiers résultats 

# Création du fichier csv pour le tableau après BLAST. 

write.csv(results, file = "resultats/tableau_BLAST.csv", row.names = FALSE)

# Création du fichier png contenant le dendrogramme après clustering hiérarchique. 

png(file="resultats/dendrogramme.png",
    width=950, height=350)
plot(hclust(dist(new_results)), 
     hang = -1,
     main = "Dendrogramme illustrant la similarité des séquences du gène MYH7 entre le chat et différents mammifères")
dev.off()
