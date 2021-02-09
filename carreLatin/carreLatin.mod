/*********************************************
 * Modèle pour le problème du carré latin
 *********************************************/
using CP;

/*** Données du problème  ***/
int n = 3;
range d = 1..n;

/*** Variables et domaines  ***/
dvar int Cases[d][d] in d;

/*** Contraintes  ***/
constraints {
  /*Lines*/
	forall (i, j, k in d : j < k){
    Cases[i][j] != Cases[i][k];
    Cases[j][i] != Cases[k][i];
  }
}

/*** Post-traitement  ***/
execute {
  writeln("New solution");
  writeln("\t",Cases);
}

include "./../shared/allSolutions.mod";
