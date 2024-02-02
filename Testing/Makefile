.PHONY : test clean dymola

test: dymola

dymola:
	@make -C Dymola | tee dymola.log
	@make -C Dymola clean
	@echo ""
	@grep == dymola.log

clean:
	@make -C Dymola clean
	@rm *.log
