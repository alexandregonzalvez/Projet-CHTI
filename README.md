# Projet CHTI
## Partie 1 : Prise en main de Matlab / Simulink

On va tracer plusieurs courbes avec les paramètres suivants :
* Fenêtre d'analyse T = 1s
* Nombre de points d'échantillonage M = 32

#### Tracé des courbes  pour Fsin = 3hz

![Figure 1 : Tracé pour 3Hz](/images/plot_3hz.jpg)

Sur le graphe de la transformée de Fourier, on observe 2 pics de fréquence :
* 3Hz : Fsin
* 29Hz : M - Fsin

#### Tracé des courbes pour Fsin = 15hz

![Figure 2 : Tracé pour 15Hz](/images/plot_15hz.jpg)

Sur le graphe de la transformée de Fourier, on observe 2 pics de fréquence :
* 15Hz : Fsin
* 17Hz : M - Fsin

On constate que les deux pics de fréquences se rapprochent beaucoup par rapport au tracé pour 3Hz, on se rapproche du repliement du spectre.
En augmentant la fréquence du sinus (Fsin), on peut être amené à déterminer de fausses fréquences sur le spectre de Fourier à cause de ce phénomène.

#### Exemple avec Fsin = 29Hz

![Figure 3 : Tracé pour 29Hz](/images/plot_29hz.jpg)

On observe 2 pics:
* 3Hz : M - Fsin
* 29Hz : Fsin

Si on ne sait pas que la fréquence du sinus est 29Hz, on déduit du spectre de Fourier que la fréquence est de 3Hz : c'est le phénomène de repliement du spectre.