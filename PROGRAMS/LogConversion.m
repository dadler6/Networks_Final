function [ mlogP ] = LogConversion( P )
% Dan Adler
% Networks Final Project
%
% Converts each probability to -log(P) so we can utilize a minimum path
% alogrithm.
%
% INPUT: P, the probabilities of each edge in the network
% OUTPUT: mlogP is the vector with -log(p) of each probability

mlogP = zeros(length(P),1);

for i = 1:length(P)
    mlogP(i) = -log(P(i));

end

