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
int n = 4;

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
    lines[i] != lines[j]+(j-i);
    lines[i] != abs(lines[j]-(j-i));
  }
}

//----- Post-traitement -----
execute {
  for (var i in d){
    for (var j in d){
      if (lines[i] == j){
        write("o ");
      } else {
        write("x ");
      }
    }
    write("\n");
  }
}

//include "./../shared/displayFirstAndCountSolutions.mod";
include "./../shared/allSolutions.mod";
