TEST = ./rtest -v

TESTFILES = \
PNlib.Examples.ConTest.Conflict.mos \
PNlib.Examples.ConTest.ConflictLoop.mos \
PNlib.Examples.ConTest.LoopAndArcweight.mos \
PNlib.Examples.ConTest.PCtoTC.mos \
PNlib.Examples.ConTest.PCtoTCfunction.mos \
PNlib.Examples.ConTest.SinglePC.mos \
PNlib.Examples.ConTest.SingleTC.mos \
PNlib.Examples.ConTest.Speed.mos \
PNlib.Examples.ConTest.TCtoPC.mos \
PNlib.Examples.ConTest.TCtoPCfunction.mos \
PNlib.Examples.ConTest.ZeroArcWeight.mos \
PNlib.Examples.ConTest.ZeroPlace.mos \
PNlib.Examples.DisTest.ConflictPrio.mos \
PNlib.Examples.DisTest.ConflictProb.mos \
PNlib.Examples.DisTest.ConflictBeneGreedy.mos \
PNlib.Examples.DisTest.ConflictBeneQuotient.mos \
PNlib.Examples.DisTest.ConflictBeneBaB.mos \
PNlib.Examples.DisTest.DisLoopAndArcweight.mos \
PNlib.Examples.DisTest.EightConflictProb.mos \
PNlib.Examples.DisTest.InputConflictPrio.mos \
PNlib.Examples.DisTest.InputConflictProb.mos \
PNlib.Examples.DisTest.InputConflictBeneGreedy.mos \
PNlib.Examples.DisTest.InputConflictBeneQuotient.mos \
PNlib.Examples.DisTest.InputConflictBeneBaB.mos \
PNlib.Examples.DisTest.OutputConflictPrio.mos \
PNlib.Examples.DisTest.OutputConflictProb.mos \
PNlib.Examples.DisTest.OutputConflictBeneGreedy.mos \
PNlib.Examples.DisTest.OutputConflictBeneQuotient.mos \
PNlib.Examples.DisTest.OutputConflictBeneBaB.mos \
PNlib.Examples.DisTest.PDtoTD.mos \
PNlib.Examples.DisTest.PDtoTDfunction.mos \
PNlib.Examples.DisTest.PrioTest.mos \
PNlib.Examples.DisTest.NoInputConflict.mos \
PNlib.Examples.DisTest.SinglePD.mos \
PNlib.Examples.DisTest.SingleTD.mos \
PNlib.Examples.DisTest.SixConflictProb.mos \
PNlib.Examples.DisTest.TDtoPD.mos \
PNlib.Examples.DisTest.TDtoPDfunction.mos \
PNlib.Examples.DisTest.TFDtest.mos \
PNlib.Examples.DisTest.TFDoutCap.mos \
PNlib.Examples.DisTest.TFDinputConflict.mos \
PNlib.Examples.DisTest.TFDoutputConflict.mos \
PNlib.Examples.DisTest.PDtoTT.mos \
PNlib.Examples.DisTest.TTtoPD.mos \
PNlib.Examples.DisTest.TTcircle.mos \
PNlib.Examples.DisTest.TEtest.mos \
PNlib.Examples.DisTest.TEnoInput.mos \
PNlib.Examples.DisTest.FiveTimes.mos \
PNlib.Examples.ExtTest.ArcswithPCtoTC.mos \
PNlib.Examples.ExtTest.ArcswithPCtoTC2.mos \
PNlib.Examples.ExtTest.ArcswithPCtoTC3.mos \
PNlib.Examples.ExtTest.DoubleArcwithPCtoTC.mos \
PNlib.Examples.ExtTest.DoubleArcwithPTtoTD.mos \
PNlib.Examples.ExtTest.DoubleArcwithPTtoTD2.mos \
PNlib.Examples.ExtTest.IATest.mos \
PNlib.Examples.ExtTest.IAwithPCtoTC.mos \
PNlib.Examples.ExtTest.IAwithPDtoTD.mos \
PNlib.Examples.ExtTest.IAwithPDtoTD2.mos \
PNlib.Examples.ExtTest.TATest.mos \
PNlib.Examples.ExtTest.TAwithPCtoTC.mos \
PNlib.Examples.ExtTest.TAwithPDtoTD.mos \
PNlib.Examples.ExtTest.TAwithPDtoTD2.mos \
PNlib.Examples.ExtTest.TAwithWeaklyActivation.mos \
PNlib.Examples.ExtTest.TSTest.mos \
PNlib.Examples.ExtTest.TStriangular.mos \
PNlib.Examples.ExtTest.TSuniform.mos \
PNlib.Examples.ExtTest.TSdiscrete.mos \
PNlib.Examples.ExtTest.TFDStest.mos \
PNlib.Examples.ExtTest.NoTokens.mos \
PNlib.Examples.HybTest.ConflictPrio.mos \
PNlib.Examples.HybTest.ConflictProb.mos \
PNlib.Examples.HybTest.ConflictType3.mos \
PNlib.Examples.HybTest.ConflictType4.mos \
PNlib.Examples.HybTest.EightConflictProb.mos \
PNlib.Examples.HybTest.HybLoopAndArcweight.mos \
PNlib.Examples.HybTest.InputConflictPrio.mos \
PNlib.Examples.HybTest.InputConflictProb.mos \
PNlib.Examples.HybTest.InputConflictType3.mos \
PNlib.Examples.HybTest.OutputConflictPrio.mos \
PNlib.Examples.HybTest.OutputConflictProb.mos \
PNlib.Examples.HybTest.OutputConflictType3.mos \
PNlib.Examples.HybTest.PCtoTD.mos \
PNlib.Examples.HybTest.PCtoTDfunction.mos \
PNlib.Examples.HybTest.SixConflictProb.mos \
PNlib.Examples.HybTest.TCwithPD.mos \
PNlib.Examples.HybTest.TDtoPC.mos \
PNlib.Examples.HybTest.TDtoPCfunction.mos \
PNlib.Examples.Models.BicoloredPlaces.Aquarium.mos \
PNlib.Examples.Models.FiliP.ModellStationen.Station1.mos \



#TESTFILES = \
PNlib.Examples.ExtTest.ArcswithPCtoTC3.mos \

# These tests are OS dependent. Move up when fixed.
# Run make failingtest
FAILINGTESTFILES = \


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
	@echo "OPENMODELICAHOME = $(OPENMODELICAHOME)"
	@$(TEST) $(TESTFILES)

# Cleans all files that are not listed as dependencies
clean:
	@echo $(DEPENDENCIES) | sed 's/ /\\\|/g' > deps.tmp
	@rm -rf $(CLEAN)

# Run this if you want to list out the files (dependencies).
# do it after cleaning and updating the folder
# then you can get a list of file names (which must be dependencies
# since you got them from repository + your own new files)
# then add them to the DEPENDENCIES. You can find the
# list in deps.txt
getdeps:
	@echo $(DEPENDENCIES) | sed 's/ /\\\|/g' > deps.tmp
	@echo $(CLEAN) | sed -r 's/deps.txt|deps.tmp//g' | sed 's/ / \\\n/g' > deps.txt
	@echo Dependency list saved in deps.txt.
	@echo Copy the list from deps.txt and add it to the Makefile @DEPENDENCIES

failingtest:
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
