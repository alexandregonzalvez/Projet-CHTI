# Projet CHTI
## Partie Signal

Chacun des 6 pistolets va émettre une onde sinusoïdale pendant un temps maximal de 100ms, à une fréquence bien déterminée. La discrimination de chacun des 6 faisceaux va se faire par une DFT pour chacune
des 6 fréquences. Sous MATLAB, on utilisera la FFT 
(qui peut le plus peu le moins, dans le sens ou la 
FFT calcule les M points fréquentiels, alors que dans le projet, on ne calculera que 6 points fréquentiels, ceux qui
nous intéressent).
Les fréquences retenues sont :
* F1 =  85 kHz
* F2 =  90 kHz
* F3 = 95 kHz
* F4 = 100 kHz
* F5 = 115 kHz
* F6 = 120 kHz

On impose une fréquence d'échantillonage Fe = 320kHz.

On détermine donc :
* T = 1/5000 (l'écart minimum de fréquence entre 2 joueurs)
* M = T/Te avec Te = 1/Fe 

Le bruit a une amplitude de l'ordre de 10^-14 tandis que l'amplitude du signal des joueurs est de l'ordre de 10^1
Avec notre matériel, on estime qu'un bruit avec une amplitude inférieure à 10^0 est négligeable.

Tracé : 
![Figure 1 : Tracé pour fréquences parfaites](/images/f_parfaites.jpg)

En réalité, l'émetteur possède une imprécision sur les canaux suivants :
* F1 =  85005,9 Hz
* F3 =  94986,8 Hz
* F5 =  115015,9 Hz

Quand on trace les courbes, on obtient les résultats suivants :

![Figure 2 : Tracé pour fréquences imparfaites](/images/f_imparfaites.jpg)

Comme on peut le voir, le bruit est monté à 10^-1. Ceci est acceptable comme il reste en-dessous de 10^0.

Deuxième source d'erreur : 
Il se peut que la fenêtre d'analyse de la DFT soit à cheval sur le début d'une salve.
Dans ce cas la, on obtient le résultat suivant :

![Figure 3 : Tracé pour fenetre decalee](/images/fenetre_decalee.jpg)

On constate que c'est une catastrophe pour isoler le signal des joueurs.


En réalité, les signaux issus du pistolet ne sont pas sinusoïdaux mais carrés.
On trace la DFT d'un signal carré de fréquence 85kHz:

![Figure 3 : Tracé pour signal carre 85kHz](/images/carre_85kHz.jpg)

Comme on peut le voir sur le graphe, on a pleins de pics sur la DFT, ceci est dû au fait que la DFT d'un signal carré sort la fréquence du fondamental et de ses harmoniques impaires en décroissant hyperboliquement.
On observe sur la DFT l'ensemble de ces fréquences ainsi que celles dues au repliement.

On propose de placer en amont un filtre. Son rôle est de contourner le problème relevé précédemment. 
On souhaite utiliser un filtre passe-bas pour éliminer les harmoniques indésirables dues au signal carré.

![Figure 4 : Tracé Bode (Chebychev)](/images/Chebychev.PNG)
Comme on peut le voir sur le diagramme ci-dessus, le gain pour la première harmonique indésirable (le pire des cas, car la plus basse fréquence indésirable de tous les joueurs) a un gain de -50 dB

![Figure 5 : Signal en sortie du filtre (Chebychev)](/images/sortieFiltre.jpg)
On voit bien que le signal en sortie est sinusoïdal. L'enveloppe du signal varie un peu au début : c'est le régime transitoire (il serait préférable de ne pas observer les premières périodes)

## Partie Electronique
```Q1```
Pour F1(p), on trouve :
* fn1=53,122kHz
* m1=0.46

Pour F2(p), on trouve :
* fn2=114,031kHz
* m2=0.09

Voici les diagrammes de bode de ces deux filtres dans l'ordre :

![Figure 6 : Tracé bode](/images/trace_bode_filtres.jpg)


```Q4```
#### F1 :
* L1=220uH
* R1= 
* C1= 


#### F2 :
* L2=1mH
* R2= 
* C2= 