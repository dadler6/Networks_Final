function [ Gprime ] = getSubgraph(i, mlogN, I)
% Dan Adler
% Networks Final Project
%
% INPUT: i is the node that is our source
% INPUT: mlogN is the graph with weights as -log(p)
% INPUT: I is the source set

% OUTPUT: The graph G - {I/i}

% Go for every edge and see whether it is in I/i
Gprime = zeros(size(mlogN,1),size(mlogN,2));
curr = 1;

% Get {I/i}
Iprime = I(I~=i);

for m = 1:size(mlogN,1)
    if sum(find(Iprime == mlogN(m,1))) == 0  && ...
            sum(find(Iprime == mlogN(m,2))) == 0
        Gprime(curr,:) = mlogN(m,:);
        curr = curr + 1;
    end
end

Gprime = Gprime(1:curr-1,:);

end

