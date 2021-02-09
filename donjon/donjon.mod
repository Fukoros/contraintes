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
  /*cp.param.logVerbosity = "Quiet";
  cp.param.logPeriod = 1000;
}

//----- Données du problème -----
int n = 12;
range d = 1..n;
int mini_y = 5;

//----- Variables et domaines -----
{string} nomVar = {"N", "N-E", "E", "S-E", "S", "S-O", "O", "N-O"};
dvar int Var[nomVar] in d;
