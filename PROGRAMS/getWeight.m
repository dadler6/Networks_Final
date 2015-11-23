function [ w ] = getWeight( Gprime, path )
% Dan Adler
% Networks Final Project
%
% Computes the weight of a found k-path
%
% INPUT: Gprime is the subgraph G - {I/v}
% INPUT: path is the edges in Gprime that make-up the found path
%
% OUTPUT: w is the weight for this path

% Initialize weight
w = 0;

for i = 1:length(path)
    w = w + Gprime(path(i),3);
end

end

