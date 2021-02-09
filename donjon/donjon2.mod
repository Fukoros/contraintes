/*********************************************
Modèle simple permettant de trouver une solution
au problème du Donjon

Un conseil :
essayer de visulaliser la solution plutot
sous une forme "graphique" (bien qu'en mode texte)
pour mieux visualiser l'emplacement des soldats.
*********************************************/
using CP;

//----- Parametrage Solveur -----
execute {
	cp.param.searchType = "DepthFirst";
	cp.param.workers = 1;
	cp.param.logPeriod = "Quiet"
}

//----- Données du problème -----
int n = 12;
range d = 1..n;
int mini_y = 5;

//----- Variables et domaines -----
{string} nomVar = {"N", "N-E", "E", "S-E", "S", "S-O", "O", "N-O"};
dvar int Var[nomVar] in d;

//----- Contraintes -----
constraints {
  /*Nord*/
  (Var["N"] + Var["N-E"] + Var["N-O"]) >= mini_y;
  /*Est*/
  (Var["E"] + Var["N-E"] + Var["S-E"]) >= mini_y;
  /*Sud*/
  (Var["S"] + Var["S-E"] + Var["S-O"]) >= mini_y;
  /*Ouest*/
  (Var["O"] + Var["N-O"] + Var["S-O"]) >= mini_y;

	/*Somme des toutes les positions*/
	sum( name in nomVar ) Var[name] == n;
}

//----- Post-traitement -----
execute {
  writeln(Var["N-O"], "-", Var["N"], "-", Var["N-E"]);
  writeln("|", "   ", "|");
  writeln(Var["O"], "   ", Var["E"]);
  writeln("|", "   ", "|");
  writeln(Var["S-O"], "-", Var["S"], "-", Var["S-E"]);
}

//include "./../shared/displayFirstAndCountSolutions.mod";
include "./../shared/allSolutions.mod";
