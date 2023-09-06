function [pi_relabeled, relabeling] = relabelPartial(pi_reference, pi)

permMatrix = ppa(pi,pi_reference,"hungarian");
relabeling = permMatrix;

pi_relabeled = pi*permMatrix;


