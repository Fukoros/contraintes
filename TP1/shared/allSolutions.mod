/*********************************************
 * Generic main bloc for computing and displaying all solutions
 * as well as the total number of solutions
 *********************************************/

 main {
 	thisOplModel.generate();
 	cp.startNewSearch();
 	while(cp.next()) {
 		thisOplModel.postProcess();
 	}
 }
