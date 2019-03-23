%% function node_force(nodes,edges,idx)
% Compute displacement "force" on node in a pseudo-physical 
% spring model:
% - If length of current node to neightbor is longer than rest: be attracted to neighbor
% - If length of current node to neighbor is shorter than rest: be repulsed by neighbor
%
% Parameters:
%   nodes:              All nodes of shape to optimise
%   edges:              All edges of shape to optimise
%   edge_target_len:    Length of edges at rest (target).
%
% Returns:
%   fvall:              Matrix of 3D force vectors
%                       Each line corresponds to the force for the
%                       corresponding node.

function fvall = node_force_all(nodes,edges,edge_target_len)

fvall = zeros(size(nodes,1),3);

for idx=1:size(nodes,1)    
    fv = node_force(nodes,edges,idx,edge_target_len(idx,:));
    fvall(idx,:)=fv;
end



