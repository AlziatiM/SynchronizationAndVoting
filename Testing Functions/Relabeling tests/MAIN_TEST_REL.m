% importer();
close all
n_it = 40  ;

ens_feat = [100, 5, 3,0.6 ];



testNoiseRelabeling([100, 10, 3,0.6 ],0.3,1,0.1,n_it,false,false )
testNoiseRelabeling([100, 20, 3,0.6 ],0.3,1,0.1,n_it,false,false )
testNoiseRelabeling([100, 30, 3,0.6 ],0.3,1,0.1,n_it,false,false )
testNoiseRelabeling([100, 40, 3,0.6 ],0.3,1,0.1,n_it,false,false )
testNoiseRelabeling([100, 50, 3,0.6 ],0.3,1,0.1,n_it,false,false )
testNoiseRelabeling([100, 60, 3,0.6 ],0.3,1,0.1,n_it,false,false )
testNoiseRelabeling([100, 70, 3,0.6 ],0.3,1,0.1,n_it,false,false )
testNoiseRelabeling([100, 80, 3,0.6 ],0.3,1,0.1,n_it,false,false )
testNoiseRelabeling([100, 90, 3,0.6 ],0.3,1,0.1,n_it,false,false )
testNoiseRelabeling([100, 100, 3,0.6 ],0.3,1,0.1,n_it,false,false )

testPartitionRelabeling(ens_feat,10,100,10,n_it,  false, false);
testClusterRelabeling(ens_feat,2,10,1,n_it,  false, false);
% testPointsRelabeling(ens_feat,100,1000,100,n_it, false, false);



