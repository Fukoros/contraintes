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
int n = 4;
range index = 1..n;
range d_var = 1..n*n;

//----- Variables et domaines -----
dvar int Cases[index][index] in d_var;

//----- Contraintes -----
constraints{
  //Cases differentes
  forall (i, j, k, l in d_cases : i*n+j < k*n+l){
    Case[i][j] != Case[k][l];
  }

  // Lines
  forall (i in d_cases : i>1){
    sum(value in index) Case[1][value] == sum(value in index) Case[i][value];
  }

  // Colonnes
  forall (i in d_cases : i>1){
    sum(value in index) Case[value][1] == sum(value in index) Case[value][i];
  }

  // diagonales
  forall (i in d_cases : i>1){
    sum(value in index) Case[i][i] == sum(value in index) Case[n-i+1][n-i+1];
  }

  //Line 1 == col 1
  sum(value in index) Case[1][value] == sum(value in index) Case[value][1];

  //Line 1 == diago 1
  sum(value in index) Case[1][value] == sum(value in index) Case[value][value];
}

//----- Post-traitement -----
execute {
  writeln("\t",Case);
}

include "./../../shared/displayFirstAndCountSolutions.mod";
