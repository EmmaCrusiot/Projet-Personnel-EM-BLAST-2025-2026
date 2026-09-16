### Exercice 1 : Le motif Tabby chez le chat ###

setwd("~/projet_EM_BLAST/subprojet_EM")

## Calcul des fréquences alléliques avec le principe de Hardy-Weinberg

# Taille pour chaque phénotype et taille totale de la population.
TaM <- 33
Tab <- 16
N <- TaM+Tab 	# 49

# Calcul des fréquences phénotypes. 
fTaM <- TaM/N  # 0.6735
fTab <- Tab/N  # 0.3265

# Affichage des résultats. 
fphenotypes <- c(fTaM = fTaM, fTab = fTab)
fphenotypes

# Calcul de la fréquence allélique p.
pHW <- sqrt(Tab/N)  # 0.5714
pHW

# Calcul de la fréquence allélique q.
qHW <- 1-pHW  # 0.4286
qHW 

# Calcul des fréquences génotypiques.
fTaMTaM <- qHW^2   # 0.1837
fTaMTab <- 2*pHW*qHW # 0.4898

fgenotypes <- c(fTaMTaM = fTaMTaM, fTaMTab = fTaMTab, fTabTab = pHW^2  )
fgenotypes


## Estimation des fréquences alléliques avec l'algorithme EM

TaM <- 33
Tab <- 16

EM <- function(p, q){
  
  N <- TaM+Tab	
  # Calcul des fréquences alléliques. 
  p <- sqrt(Tab/N)
  q <- 1-p
  
  # Création de variables pour les anciennes itérations de nos fréquences alléliques.
  p0 <- 0
  q0 <- 0 
  counter <- 0	# Cela va nous permettre de compter le nombre d’itération.
  
  # Initialisation de l’algorithme avec la fonction while. 
  while(!isTRUE(all.equal(p0,p, tolerance = 1e-12)) &&
        !isTRUE(all.equal(q0,q, tolerance = 1e-12))){
    # Sauvegarde des valeurs de l’ancienne itération.
    p0 <- p
    q0 <- q 
    
    # Phase E : 
    fMM <- TaM*(q0^2/((q0^2)+2*(q0*p0)))
    fMb <- TaM*(2*(q0*p0)/((q0^2)+2*(q0*p0)))
    fbb <- Tab
    
    # Phase M :
    q <- ((2*fMM)+fMb)/(2*N)
    p <- ((2*fbb)+fMb)/(2*N)
    
    counter <- counter + 1 
  }
  pEM <<- p
  qEM <<- q 
  #Pour retourner, les valeurs après convergence et le nombre d’itérations.
  return(c(paste("p =", round(p,4), ", q =", round(q,4), "Itération =", counter)))
}

# Exécution de l’algorithme.
EM(p, q)

## Création du tableau des résultats 

# Nous allons commencer par créer un dataframe.

resultats <- data.frame(
    methode = c("Hardy-Weinberg", "Algorithme EM"),
    p = c(round(pHW,4), round(pEM,4)),
    q = c(round(qHW,4), round(qEM,4)))

# Nous pouvons exporter le dataframe en CSV.

write.csv(resultats, file = "resultats/frequences_alleliques.csv", row.names = FALSE)


