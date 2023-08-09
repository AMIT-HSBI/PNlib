within PNlib;

package Types "contains Types which are used in the Petri net component models"
  type EnablingType = enumeration(Priority, Probability, Benefit);
  type BenefitType = enumeration(Greedy, BenefitQuotient, BranchAndBound);
  type ArcType = enumeration(NormalArc, RealTestArc, TestArc, RealInhibitorArc, InhibitorArc);
  type DistributionType = enumeration(Exponential, Triangular, Uniform, TruncatedNormal, Discrete);
end Types;
