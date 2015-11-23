function [ P_max_inv ] = invLikelihood( P_max )
% Dan Adler
% Networks Final Project
%
% INPUT: P_max are all max s-v k-paths
% OUTPUT: P_max_inv are the paths with weights as joint probability of
% edges occurring

P_max_inv = [P_max(:,1:end-1) exp(-P_max(:,end))];

end

