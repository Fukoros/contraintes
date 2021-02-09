/*********************************************
 * Modèle OPL Pour le problème des billes
 *
 * Dans ce modèle; chaque variable doit être déclarée explicitement
 * avec son nom d'origine dans le modèle initial
 *
 *********************************************/
using CP;			/* Utilisation du solveur CP-Solver */

/* Déclarations domaines et variables */
range age = 4..7;

{string} Name = {"Anne", "Bernard", "Claudine", "Denis"};
{string} Color = {"Jaune", "Rouge", "Noire", "Bleue"};
{string} Place = {"Parc", "Jardin", "Chambre", "Salon"};

{string} nomVar = Name union Color union Place;

dvar int Var[nomVar] in age;

int cpt_solution = 0;

/* Paramétrage du solveur */
execute {
	cp.param.searchType = "DepthFirst";
	cp.param.workers = 1;
}


/* Contraintes */
constraints {
	/* Difference */
	forall (ordered i, j in Name)
		Var[i] != Var[j];
	forall (ordered i, j in Color)
		Var[i] != Var[j];
	forall (ordered i, j in Place)
		Var[i] != Var[j];

	/*Denis joue dans le parc et n’a pas4ans, contrairement à l’enfant qui a des billes bleues*/
    	Var["Denis"] == Var["Parc"];
	Var["Denis"]!=4;
	Var["Bleue"] == 4;

	/*La fille de 6 ans a des billes jaunes*/
    	Var["Jaune"] == 6;
	Var["Bernard"] != 6;
	Var["Denis"] != 6;

	/*L’enfant qui joue avec des billes noires est plus âgé que l’enfant qui joue dans le jardin mais plusjeune que Anne*/
    	Var["Noire"] > Var["Jardin"];
	Var["Noire"] < Var["Anne"];

	/*Anne, qui joue dans sa chambre, a1an de plus que l’enfant qui joue dans le salon*/
    	Var["Anne"] == Var["Chambre"];
	Var["Anne"] > Var["Salon"];
	Var["Chambre"] > Var["Salon"];


}

/* Post-traitement (Affichage Solution) */
execute {
  writeln("Solution n :", cpt_solution);
  cpt_solution = cpt_solution+1;
 for (var i in nomVar){
   writeln(i," = ", Var[i]);
 }
}

include "./../shared/allSolutions.mod";
