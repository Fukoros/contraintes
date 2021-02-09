/*********************************************
 * Generic main bloc for computing and displaying all solutions
 * as well as the total number of solutions
 *********************************************/

 main {
  var count = 0;
 	thisOplModel.generate();
 	cp.startNewSearch();
 	while(cp.next()) {
    writeln("------------------------------");
 		thisOplModel.postProcess();
    count+=1;
 	}
  writeln("We have ", count, " solutions.");
 }
