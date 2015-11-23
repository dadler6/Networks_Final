function [ P ] = ColorCoding( N, I, k )
% Dan Adler
% Networks Final Project
%
% MAIN Function for Color Coding Algorithm
%
% INPUT: N is the network that is an |N| x 3 matrix (|N| = num of vertices)
% First two columns are edges i -> j
% Third column is the probability of the edge from i-> j
% 
% INPUT: I is the set of nodes I representing a in initial signal
% 
% INPUT: k is the length of paths we are trying to find 
% (length meaning number of edges independent of weights)
%
% OUTPUT: P is a matrix with a row for each node i in I and an 
% optimal length k path. Last column is probability of that path occurring.
% k path that ends at another node v in V - {I}

% Convert all probabilities to -log(p) so we can compute MIN paths
mlogN = [N(:,1) N(:,2) LogConversion(N(:,3))];

% Create output matrix
P = zeros(length(I)*max(N(:,1)), k + 1);
p_row = 1;

% Go through each vertex in v in I
for i = 1:length(I)
    % Get subgraph of G - {I/v}
    Gprime = getSubgraph(I(i),mlogN,I);
    % Get color coding of graph with vertex set N - {I/v}
    Colorings = getColorCodings(I(i),Gprime,k);
    % Initialize possible paths for this i
    curr_i = 1;
    P_i = zeros(size(Colorings,1),k + 1);
    % Go through each color coding
    for c = 1:length(Colorings)
        % Find whether k-coloring is a k-path
        path = IsKPath(Colorings(c,:),Gprime);
        % Compute weight if k-path
        if ~isempty(path)
            w = getWeight(Gprime,path);
            P_i(curr_i,1:end-1) = Colorings(c,:);
            P_i(curr_i,end) = w;
            curr_i = curr_i + 1;
        end
    end
    % Reduce matrix size
    P_i = P_i(1:curr_i - 1,:);
    % Find max s-v paths
    Pi_max = findMaxPaths(P_i);
    % Compute inverse likelihood
    Pi_max = invLikelihood(Pi_max);
    % Add to P matrix
    P(p_row:p_row + size(Pi_max,1) - 1,:) = Pi_max;
    p_row = p_row + size(Pi_max,1);
    
end

% Format output
P = P(1:p_row-1,:);

end

