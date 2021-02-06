/*********************************************
 * Modèle OPL Pour le problème des billes
 *
 * Dans ce modèle; chaque variable doit être déclarée explicitement
 * avec son nom d'origine dans le modèle initial
 *
 *********************************************/
using CP;			/* Utilisation du solveur CP-Solver */

/* Déclarations domaines et variables */
dvar int Anne in 4..7;
dvar int Bernard in 4..7;
dvar int Claudine in 4..7;
dvar int Denis in 4..7;

dvar int Jaune in 4..7;
dvar int Rouge in 4..7;
dvar int Noire in 4..7;
dvar int Bleue in 4..7;

dvar int Parc in 4..7;
dvar int Jardin in 4..7;
dvar int Chambre in 4..7;
dvar int Salon in 4..7;


/* Paramétrage du solveur */
execute {
	cp.param.searchType!= "DepthFirst";
	cp.param.workers!= 1;
}


/* Contraintes */
constraints {
	/* Difference */
	Anne!=Bernard; Anne!=Claudine; Anne!=Denis; Bernard!=Claudine; Bernard!=Denis; Claudine!=Denis;
	Jaune!=Rouge; Jaune!=Noire; Jaune!=Bleue; Rouge!=Noire; Rouge!=Bleue; Noire!=Bleue;
    	Parc!=Jardin; Parc!=Chambre; Parc!=Salon; Jardin!=Chambre; Jardin!=Salon; Chambre!=Salon;

	/*Denis joue dans le parc et n’a pas4ans, contrairement à l’enfant qui a des billes bleues*/
    	Denis==Parc; 
	Denis!=4; 
	Bleue==4;

	/*La fille de 6 ans a des billes jaunes*/
    	Jaune==6; 
	Bernard!=6;
	Denis!=6;

	/*L’enfant qui joue avec des billes noires est plus âgé que l’enfant qui joue dans le jardin mais plusjeune que Anne*/
    	Noire>Jardin; 
	Noire<Anne;

	/*Anne, qui joue dans sa chambre, a1an de plus que l’enfant qui joue dans le salon*/
    	Anne==Chambre; 
	Anne>Salon; 
	Chambre>Salon; 
	

}


/* Post-traitement (Affichage Solution) */
execute {
	writeln("Anne = ", Anne);
	writeln("Bernard = ", Bernard);
	writeln("Claudine = ", Claudine);
	writeln("Denis = ", Denis);

	writeln("Jaune = ", Jaune);
	writeln("Rouge = ", Rouge);
	writeln("Bleue = ", Bleue);
	writeln("Noire = ", Noire);

	writeln("Jardin = ", Jardin);
	writeln("Salon = ", Salon);
	writeln("Parc = ", Parc);
	writeln("Chambre = ", Chambre);

}


