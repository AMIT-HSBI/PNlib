TEST = rtest -v

TESTFILES = \
PNlib.Examples.ConTest.LoopAndArcweight.mos \
PNlib.Examples.ConTest.PCtoTC.mos \
PNlib.Examples.ConTest.SinglePC.mos \
PNlib.Examples.ConTest.SingleTC.mos \
PNlib.Examples.ConTest.Speed.mos \
PNlib.Examples.ConTest.TCtoPC.mos \
PNlib.Examples.ConTest.ZeroPlace.mos \
PNlib.Examples.DisTest.ConflictPrio.mos \
PNlib.Examples.DisTest.DisLoopAndArcweight.mos \
PNlib.Examples.DisTest.InputConflictPrio.mos \
PNlib.Examples.DisTest.OutputConflictPrio.mos \
PNlib.Examples.DisTest.PDtoTD.mos \
PNlib.Examples.DisTest.SinglePD.mos \
PNlib.Examples.DisTest.SingleTD.mos \
PNlib.Examples.DisTest.TDtoPD.mos \

# test that currently fail. Move up when fixed.
# Run make failingtest
FAILINGTESTFILES = \
PNlib.Examples.ConTest.Conflict.mos \
PNlib.Examples.ConTest.ConflictLoop.mos \
PNlib.Examples.DisTest.ConflictProb.mos \
PNlib.Examples.DisTest.EightConflictProb.mos \
PNlib.Examples.DisTest.InputConflictProb.mos \
PNlib.Examples.DisTest.OutputConflictProb.mos \
PNlib.Examples.DisTest.SixConflictProb.mos \

# Dependency files that are not .mo .mos or Makefile
# Add them here or they will be cleaned.
DEPENDENCIES = \
*.mos \
Makefile \
rtest \

CLEAN = `ls | grep -w -v -f deps.tmp`

.PHONY : test clean getdeps failingtest

test:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES)

# Cleans all files that are not listed as dependencies
clean:
	@echo $(DEPENDENCIES) | sed 's/ /\\|/g' > deps.tmp
	@rm -f $(CLEAN)

# Run this if you want to list out the files (dependencies).
# do it after cleaning and updating the folder
# then you can get a list of file names (which must be dependencies
# since you got them from repository + your own new files)
# then add them to the DEPENDENCIES. You can find the
# list in deps.txt
getdeps:
	@echo $(DEPENDENCIES) | sed 's/ /\\|/g' > deps.tmp
	@echo $(CLEAN) | sed -r 's/deps.txt|deps.tmp//g' | sed 's/ / \\\n/g' > deps.txt
	@echo Dependency list saved in deps.txt.
	@echo Copy the list from deps.txt and add it to the Makefile @DEPENDENCIES

failingtest:
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
