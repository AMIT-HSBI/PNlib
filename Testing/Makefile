.PHONY : test clean openmodelica dymola

test: openmodelica dymola

openmodelica:
	@make -C OpenModelica | tee openmodelica.log
	@make -C OpenModelica clean
	@echo ""
	@grep == openmodelica.log

dymola:
	@make -C Dymola | tee dymola.log
	@make -C Dymola clean
	@echo ""
	@grep == dymola.log

clean:
	@make -C OpenModelica clean
	@make -C Dymola clean
	@rm *.log
