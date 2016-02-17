.PHONY : test clean openmodelica dymola

test: openmodelica dymola

openmodelica:
	@make -C OpenModelica > openmodelica.log 2>&1
	@make -C OpenModelica clean
	@tail -2 openmodelica.log | head -1

dymola:
	@make -C Dymola > dymola.log 2>&1
	@make -C Dymola clean
	@tail -2 dymola.log | head -1

clean:
	@make -C OpenModelica clean
	@make -C Dymola clean
	@rm *.log
