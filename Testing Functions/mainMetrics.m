clear
clc
addpath("Partition functions\")
addpath("Testing Functions\")
addpath("Partition generation")
addpath("Partition functions/")
addpath("Testing Functions/")
addpath("Testing Functions/Metrics")

%STRUTTURE DATI
N = 10; %numero dati
M = 5; %numero partizioni
D = 2; %numero features
%numero cluster in i-esima partizione (1xM)
K = 5*ones(1, M);
X = ones(N,D);


%partitizione -> stochastic matrix (BA per hard clustering)
i = 1;
pi_1 = zeros(N,K(i));
pi_1(2,3)= 1;
%Ensemble-> lista di partizioni
PI = cell(M,1);
PI{1} = pi_1;
pi_id = 1; 
x_id = 2;
label(x_id,pi_id, PI);



N = 5;
K(1) = 2;
K(2) = 2;

PI{1} = [1, 0; 
        1, 0;
        1, 0;
        0, 1;
        0, 1];

PI{2} = [1, 0; 
        1, 0;
        1, 0;
        1, 0;
        0, 1];

% Range of value test for ARI and NMI


resultNMI = test_metric("NMI", 1, 2, PI, N, K);
resultARI = test_metric("ARI", 1, 2, PI, N, K);

assert(resultARI >= 0 && resultARI <= 1);
assert(resultNMI >= 0 && resultNMI <= 1);

% same information should yield 1 for both ARI and NMI

PI{1} = [1, 0; 
        1, 0;
        0, 1;
        0, 1
        0, 1];

PI{2} = [1, 0; 
        1, 0;
        0, 1;
        0, 1
        0, 1];

resultARI = test_metric("ARI", 1, 2, PI, N, K);
resultNMI = test_metric("NMI", 1, 2, PI, N, K);

assert(resultARI == 1);
assert(resultNMI == 1);

PI{1} = [1, 0; 
        1, 0;
        0, 1;
        0, 1;
        0, 1];

PI{2} = [0, 1; 
        0, 1;
        1, 0;
        1, 0;
        1, 0];

resultARI = test_metric("ARI", 1, 2, PI, N, K);
resultNMI = test_metric("NMI", 1, 2, PI, N, K);

assert(resultARI == 1);
assert(resultNMI == 1);



% completely different information should yield 0 for both ARI and NMI
PI{1} = [0, 1; 
        0, 1;
        0, 1;
        0, 1;
        0, 1];

PI{2} = [1, 0; 
        1, 0;
        0, 1;
        1, 0;
        0, 1];

resultARI = test_metric("ARI", 1, 2, PI, N, K);
resultNMI = test_metric("NMI", 1, 2, PI, N, K);

assert(resultARI == 0,"test on ARI failed");
assert(resultNMI == 0, "test on NMI failed");

% 1- scrivere funzioni NMI e ARI
% 2- scrivere dataset per le prove (G.T.,partizioni uguali, completamente
% diverse, caso medio etc etc) -> RUMORE + PERMUTAZIONE
% 3- scrivere test di base per vedere correttezza





sas;