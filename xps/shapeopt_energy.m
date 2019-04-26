%% Shape optimisation based on energy
% Assume a spring on each edge whose rest length is defined
% by the target shape to approximate.
% 
% Parameters
%   nodes_apx:  Nodes of approximate shape (shape to optimise)
%   edges_apx:  Edges of approximate shape (shape to optimise)
%   nodes_d:    Nodes of target shape (ground truth)
%   edges_d:    Edges of target shape (ground truth).
%               edges_apx and edges_d should be identical

function [nodes_opt fv ef output]= shapeopt_energy(nodes_apx,edges_apx,nodes_d,edges_d,neighbors)

% Pre-compute the target edge lengths
%edges_d_len = edgelen_all(nodes_d,edges_d);

% Pre-compute the target edge lengths
edges_d_len = edgelen_all(nodes_d,edges_d,neighbors);

[nodes_opt fv ef output]= fminunc(@(x) shape_energy2(x,edges_apx,edges_d_len,neighbors),nodes_apx(:));
nodes_opt = reshape(nodes_opt,length(nodes_opt)/3,3);




