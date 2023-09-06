function [pi_relabeled, relabeling] = relabel(pi_reference,pi_referenceLV, pi,piLV, relabelingAlgorithmName)

labelGraph = createContingencyGraph(piLV, pi_referenceLV);

switch(relabelingAlgorithmName)
    case "Hungarian"
        relabeling = munkres(labelGraph)';
         if ~all(relabeling)
                ERROR = 1;
         end
        permMatrix = permutationConversion(relabeling);
    case "Jonker-Volgenant"
        relabeling = lapjv(labelGraph)';
        permMatrix= permutationConversion(relabeling);

    case "Matchpairs"
        relabeling = matchpairs(labelGraph, 9000, 'min');
        relabeling = sortrows(relabeling);
        relabeling = relabeling(:,2);
        permMatrix = permutationConversion(relabeling);
    case  "Regression"
        relabeling = regressionRelabeling(pi_reference, pi);
        %DA VERIFICARE CON PIÙ PUNTI E COLONNE
        permMatrix = relabeling;
%                          relabeling = I';
%                          relabeling =zeros(size(relabeling, 1), size(relabeling, 2));
%                          for i=1:size(relabeling,2)
%                              relabeling(I(i),i) = 1;
%                          end
    case "Partial"
%         s_pi = size(pi,2);
%         s_ref = size(pi_reference,2);
%         if s_pi < s_ref
%             pi = padarray(pi, [0, s_ref-s_pi],'post'); 
%         else 
%             if s_pi > s_ref
%                  pi_reference = padarray(pi_reference, [0, s_pi-s_ref],'post'); 
%        
%             end
%         end
        permMatrix = ppa(pi,pi_reference,"hungarian");
        relabeling = permMatrix;

end

if size(permMatrix,1) ~= size(pi,2)
    ERROR = 1;
end
pi_relabeled = pi*permMatrix;


