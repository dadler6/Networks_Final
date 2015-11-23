function [ P_max ] = findMaxPaths(P)
% Dan Adler
% Networks Final Project
%
% INPUT: P is a matrix of a k-paths eminating from a source in G s
% OUTPUT: P_max is a matrix of the maximum weight s-v k-paths in G

% Get unique end points
% Last column is weight of path, so end - 1 are ending nodes
V = unique(P(:,end-1));

% Initialize end matrix
P_max = zeros(size(V,1),size(P,2));

% For each ending node
for i = 1:length(V)
    num_paths = sum(P(:,end-1) == V(i));
  
    % Will store [index, weight]
    v_paths = zeros(num_paths,2);
    curr = 1;
    % Find each path
    for j = 1:size(P,1)
        if P(j,end - 1) == V(i)
            v_paths(curr,:) = [j, P(j,end)];
            curr = curr + 1;
        end
    end
    
    % Find minimum (max probability paths)
    m = v_paths(v_paths(:,2) == min(v_paths(:,2)),1);
    P_max(i,:) = P(m,:);
    
end


end

