/*********************************************
 * Modèle pour le problème du carré latin
 *********************************************/
using CP;

/*** Données du problème  ***/
int n = 3;
range d = 1..n;

/* Paramétrage du solveur */
execute {
	cp.param.searchType = "DepthFirst";
	cp.param.workers = 1;
  cp.param.log.Verbosity = "Quiet";
  /*
  cp.param.logPeriod = <int> */
}

/*** Variables et domaines  ***/
dvar int Cases[d][d] in d;
int cpt_solution = 0;

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
  cpt_solution += 1;
  writeln("Solution : ", cpt_solution);
  writeln("\t",Cases);
}

include "./../../shared/allSolutions.mod";
