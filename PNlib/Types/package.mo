within PNlib;
package Types "contains Types which are used in the Petri net component models"
  type EnablingType = enumeration(Priority, Probability, Benefit);
  type BenefitType = enumeration(Greedy, BenefitQuotient, BranchAndBound);
  type ArcType = enumeration(NormalArc, RealTestArc, TestArc, RealInhibitorArc, InhibitorArc, ReadArc);
  type DistributionType = enumeration(Exponential, Triangular, Uniform, Discrete);
end Types;
