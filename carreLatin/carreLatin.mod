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
	forall (i in d)
  	forall (j in d)
  	 forall (k in d)
      if (j!=k)
		    Cases[i][j] != Cases[i][k];

  /* Columns */
	forall (i in d) {
  	forall (j in d) {
  	 forall (k in d) {
       if (i!=j) {
		    Cases[i][k] != Cases[j][k];
        }
      }
    }
  }
}

/*** Post-traitement  ***/
