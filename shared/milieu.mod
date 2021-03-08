execute {
	var f = cp.factory;
	var indices = new Array(n);
	for (var i = 0; i < n; i++){
		if (i < n/2) indices[i] = (n/2)-i;
		else indices[i]=i-(n/2);
	}
  /**
  cp.setSearchPhases(f.searchPhase(lines,
			f.selectSmallest(f.explicitVarEval(lines, indices)),
      f.selectSmallest(f.explicitValueEval(0, d, indices))
		)
	);**/

}
