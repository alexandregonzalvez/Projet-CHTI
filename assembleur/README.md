* Signal carré : fini
* Somme sinus cosinus : fini (conversion à faire à la main)
* Dft virgule fixe : La fonction m2k fonctionne, tous les tests passent
* Challenge speed : 1127 states
* Challenge size : 74


### Système de score ajouté (Obj 2):
## Dossier : DFT_Systeme_Scores

Pour vérifier :
* Lancer le projet Keil situé dans le dossier : DFT_Systeme_Scores
* Lancer le mode debug
* Ajouter la variables scores[] dans la watch window (Clic Droit > Add 'scores[6]' to ... > Watch 1)
* Dérouler le programme (Run ou F5)
* Observer l'évolution des scores en bas à gauche pour voir la séquence matcher :
 - [0] : 0x1
 - [1] : 0x2
 - [2] : 0x3
 - [4] : 0x3
 - [5] : 0x4
 - [6] : 0xf (15)
 (Séquence de tir programmée dans la lib gfssp72)
