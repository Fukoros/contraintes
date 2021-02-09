/*********************************************
 * Modèle pour le problème des n-reines
 *
 * Les données de l'instance sont décrites dans un fichier .dat externe
 *********************************************/
using CP;

//----- Parametrage Solveur -----
execute {
	cp.param.searchType = "DepthFirst";
	cp.param.workers = 1;
	cp.param.logVerbosity = "Quiet";
}

//----- Données du problème -----
int n = 5;

//----- Variables et domaines -----
range d = 1..n;
dvar int lines[d] in d;

//----- Contraintes -----
constraints{
  //Colonnes differente
  forall (ordered i, j in d){
    lines[i] != lines[j];
  }

  //Diagonale differente
  forall (ordered i, j in d){
    lines[i] != lines[j]+j;
    lines[i] != abs(lines[j]-j);
  }
}

//----- Post-traitement -----
execute {
  for (var i in d){
    writeln(i, "-", lines[i]);
  }
}

include "./../shared/displayFirstAndCountSolutions.mod";
//include "./../shared/allSolutions.mod";
