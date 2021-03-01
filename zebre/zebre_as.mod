/*********************************************
 * Modèle pour le problème du zebre (Lewis Caroll)
 *
 * Ce modèle calcule toutes les solutions du problème
 *********************************************/
using CP;

//----- Parametrage Solveur -----
execute {
	cp.param.searchType = "DepthFirst";
	cp.param.workers = 1;
  cp.param.logVerbosity = "Quiet";
  /*cp.param.logPeriod = 1000000;*/
}

/*** Données du problème  ***/
range d = 1..5;

/*** Variables et domaines  ***/
{string} Nationalite = {"anglais", "espagnol", "japonais", "italien", "norvegien"};
{string} Animaux = {"chien", "escargots", "cheval", "renard", "zebre"};
{string} Profession = {"peintre", "sculpteur", "diplomate", "violoniste", "medecin"};
{string} Couleur = {"rouge", "blanche", "bleue", "verte", "jaune"};
{string} Boisson = {"lait", "the", "cafe", "jus de fruit", "eau"};

dvar int Var[Nationalite union Animaux union Profession union Couleur union Boisson] in d;

/*** Contraintes  ***/
constraints {
  //Differences
  forall (i, j in Nationalite : i < j) Var[i] != Var[j];
  forall (i, j in Animaux : i < j) Var[i] != Var[j];
  forall (i, j in Profession : i < j) Var[i] != Var[j];
  forall (i, j in Couleur : i < j) Var[i] != Var[j];
  forall (i, j in Boisson : i < j) Var[i] != Var[j];

  //L anglais habite la maison rouge
  Var["anglais"] == Var["rouge"];

  //L espagnol possède un chien
  Var["espagnol"] == Var["chien"];

  //Le japonais est peintre
  Var["japonais"] == Var["peintre"];

  //L italien boit du the
  Var["italien"] == Var["the"];

  //Le norvegien habite la premiere maison a gauche.
  Var["norvegien"] == 1;

  //Le proprietaire de la maison verte boit du cafe.
  Var["verte"] == Var["cafe"];

  //La maison verte est à droite de la blanche.
  Var["verte"] == Var["blanche"]+1;

  //Le sculpteur eleve des escargots.
  Var["sculpteur"] == Var["escargots"];

  //Le diplomate habite la maison jaune.
  Var["diplomate"] == Var["jaune"];

  //On boit du lait dans la maison du milieu.
  Var["lait"] == 3;

  //Le norvegien habite a cote de la maison bleue.
  Var["norvegien"] == Var["bleue"];

  //Le violoniste boit des jus de fruits.
  Var["violoniste"] == Var["jus de fruit"];

  //Le renard est dans la maison voisine du medecin.
  Var["renard"] == Var["medecin"]-1 || Var["renard"] == Var["medecin"]+1;

  //Le cheval est a cote de celle du diplomate.
  Var["cheval"] == Var["diplomate"]-1 || Var["cheval"] == Var["diplomate"]+1;
}

/*** Post-traitement  ***/
execute {
  writeln("Nationalite");
  for (var index in Nationalite){
    writeln("\t","Le ", index, " est dans la maison N°", Var[index]);
  }
  writeln("-------------");
  writeln("Animaux");
  for (var index in Animaux){
    writeln("\t","Le ", index, " est dans la maison N°", Var[index]);
  }
  writeln("-------------");
  writeln("Profession");
  for (var index in Profession){
    writeln("\t","Le ", index, " est dans la maison N°", Var[index]);
  }
  writeln("-------------");
  writeln("Couleur");
  for (var index in Couleur){
    writeln("\t","La maison ", index, " est la maison N°", Var[index]);
  }
  writeln("-------------");
  writeln("Boisson");
  for (var index in Boisson){
    writeln("\t","On boit du ", index, " dans la maison N°", Var[index]);
  }
}

include "./../shared/displayFirstAndCountSolutions.mod";
