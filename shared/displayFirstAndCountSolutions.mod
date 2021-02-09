/*********************************************
 * Generic main bloc for displaying the first found solution
 * and displaying the total number of solutions
 *********************************************/

 main {
  count = 0;
  thisOplModel.generate();
  cp.startNewSearch();
  while(cp.next()) {
    if (count == 0)
      thisOplModel.postProcess();
    count+=1;
  }
  writeln("We have ",count," solution(s).");
 }
