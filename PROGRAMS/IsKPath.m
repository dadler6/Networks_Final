function [ path ] = IsKPath(c, Gprime)
% Dan Adler
% Networks Final Project
%
% Determines whether the given coloring is a k-path
% 
% INPUT: c is the k-coloring of k nodes we are looking at plus the root
% node.
% INPUT: Gprime is the subgraph of G - {I/i}
%
% OUTPUT: the indices of the path in Gprime, or else an empty vector
% if there is no path

path = zeros(length(c) - 1,1);
ispath = 1;
curr = 1;

% If curr = length(c) we have found a k-path
% If ispath = 0 after for loop we haven't found anything
while curr < length(c) && ispath == 1
    
    % Find edges
    ispath = 0;
    found = 0;
    j = 1;
    while found == 0 && j <= size(Gprime,1)
        if Gprime(j,1) == c(curr) && Gprime(j,2) == c(curr+1)
            path(curr) = j;
            ispath = 1;
            found = 1;
        end
        j = j + 1;
    end

    curr = curr + 1;
    
end

if ispath == 0
    path = [];
end

end

