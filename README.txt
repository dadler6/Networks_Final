Dan Adler
Networks Project

All programs are in the PROGRAMS folder.

To Run Algorithm Implement:

PPICompute(N,I,k)
N = Graph with m edges and N nodes represented by integers (1…|N|)
It is a matrix that is m x 3 where the first column and second is an edge [i j] and third column is the probability of a reaction between the two nodes, P(i,j)
I = nodes in the set I (signals).
k = path length we are looking for.
(See PPICompute.m)

You will also need the following functions:

LogConversion(P) computes -log(P).
(See LogConversion.m)

IsKPath(c,Gprime) takes a path c =  {i,1…,v} and computes in a network with nodes
GPrime({N} - {I/i},Reduced Edges) if there exists a path on c.  If yes, it outputs the indices in the GPrime matrix in order that correspond to edges in that path.  If no, it outputs the empty set.
(See IsKPath.m)

invLikelihood(P_max) computes the exp(-(-lop(P)) = P for an inputted vector of -log(P(i,j)).  P_max is a vector of -log(P) for a most likely path.
(See invLikelihood.m)

getWeight(Gprime,path) computes the weight of a k-path in Gprime.  The path is given by path and the network Gprime = G({N} - {I/i},Reduced Edges) where i is the start node of the path in the I set of nodes.
(See getWeight.m)

getSubgraph(i, mlogN, I) computes Gprime = G({N} - {I/i}, Reduced Edges) where i is the start node we are looking at, I is the set of all start nodes and mlogN is the graph with weights as -logP.
(See getSubgraph.m)

getPerms(i, Gprime, k) computes all permutations of a subset of k-1 nodes in Gprime.  If N’ are the nodes of Gprime, it chooses k-1 nodes from {N’} - {i} and computes all permutations of them.  It does this for every set of k-1 nodes and outputs a matrix of all of these permutations. 
(see getPerms.m)