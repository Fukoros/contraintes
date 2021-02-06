/*********************************************
 * Generic main bloc for computing and displaying all solutions
 * as well as the total number of solutions
 *********************************************/

 execute {
   writeln("Solution n :", cpt_solution);
   cpt_solution = cpt_solution+1;
 	for (var i in nomVar){
 		writeln(i," = ", Var[i]);
 	}
 }

 main {
 	thisOplModel.generate();
 	cp.startNewSearch();
 	while(cp.next()) {
 		thisOplModel.postProcess();
 	}
 }
