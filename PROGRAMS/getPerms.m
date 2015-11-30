function [ Perms ] = getPerms(i, Gprime, k)
% Dan Adler
% Networks Final Project
%
% INPUT: i is the source node
% INPUT: Gprime is a graph without the nodes {I/i}
% INPUT: k is the lengths of the paths we are finding

% OUTPUT: Perms is the matrix of all k-Perms of Gprime
% (in reality, it is every permutation of Gprime - {i})

% Get vertex set for Gprime
num = 1;
vertices = zeros(length(Gprime(:,1))*2,1);

for n = 1:length(Gprime(:,1))
    if sum(find(vertices == Gprime(n,1))) == 0 && Gprime(n,1) ~= i
        vertices(num)= Gprime(n,1);
        num = num + 1;
    end
end

for n = 1:length(Gprime(:,2))
    if sum(find(vertices == Gprime(n,2))) == 0 && Gprime(n,2) ~= i
        vertices(num)= Gprime(n,2);
        num = num + 1;
    end
end

vertices = vertices(1:num-1,1);

% Get all 'Perms' or permutations of k vertices from n
Perms = zeros(nchoosek(length(vertices),k-1)*factorial(k-1),k-1);

% Go through each combination and get all permutations
combs = combnk(vertices,k-1);
if (k-1) == 1
    combs = combs';
end

curr = 1;
for c = 1:size(combs,1)
    p = perms(combs(c,:));
    Perms(curr:curr + length(p) - 1,:) = p;
    curr = curr + length(p);
end

Perms = [ones(size(Perms,1),1)*i Perms];

end

