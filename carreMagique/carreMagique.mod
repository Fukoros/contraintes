/*********************************************
 * Modèle pour le problème du carré magique
 *
 * Les données de l'instance sont décrites dans un fichier .dat externe
 *********************************************/
using CP;

//----- Parametrage Solveur -----
execute {
	cp.param.searchType = "DepthFirst";
	cp.param.workers = 1;
  cp.param.logVerbosity = "Quiet";
  /*cp.param.logPeriod = 1000000;*/
}

//----- Données du problème -----
int n = 3;
range index = 1..n;
range d_var = 1..n*n;

//----- Variables et domaines -----
dvar int Cases[index][index] in d_var;

//----- Contraintes -----
constraints{
  //Cases differentes
  forall (i, j, k, l in index : i*n+j < k*n+l){
    Cases[i][j] != Cases[k][l];
  }

  // Lines
  forall (i in index : i>1){
    sum(value in index) Cases[1][value] == sum(value in index) Cases[i][value];
  }

  // Colonnes
  forall (i in index : i>1){
    sum(value in index) Cases[value][1] == sum(value in index) Cases[value][i];
  }

  // diagonales
  forall (i in index){
    sum(value in index) Cases[i][i] == sum(value in index) Cases[n-i+1][n-i+1];
  }

  //Line 1 == col 1
  sum(value in index) Cases[1][value] == sum(value in index) Cases[value][1];

  //Line 1 == diago 1
  //sum(value in index) Cases[1][value] == sum(value in index) Cases[value][value];
}

//----- Post-traitement -----
execute {
  writeln("\t",Cases);
}

include "./../shared/displayFirstAndCountSolutions.mod";
