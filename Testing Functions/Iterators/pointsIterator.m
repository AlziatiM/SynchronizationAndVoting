function pointsIterator(min, max, step, funToIterate, ensembleParams, testParams)
N = ensembleParams(1);
M = ensembleParams(2);
K = ensembleParams(3);
p = ensembleParams(4);



mint= testParams(1);
maxt = testParams(2);
stept = testParams(3);
n_it = testParams(4);



for M = min:step:max
    funToIterate([N,M,K,p],mint, maxt, stept, n_it)
end