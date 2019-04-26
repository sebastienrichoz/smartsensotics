%% function node_force(nodes,edges,idx)
% Compute displacement "force" on node in a pseudo-physical 
% spring model:
% - If length of current node to neightbor is longer than rest: be attracted to neighbor
% - If length of current node to neighbor is shorter than rest: be repulsed by neighbor
%
% Parameters:
%   nodes:      All the nodes
%   edges:      All the edges
%   idx:        Node for which to compute the length
%   rest_len:   Length of all the edges at rest.
%
% Returns:
%   fv:         

function fv = node_force(nodes,edges,idx,rest_len,neighbors)

% Compute the current length
cur_len = edgelen(nodes,edges,idx,neighbors);


% % Compute fv (force vector). 
fv = [0 0 0];       % Force vector

%% Iterate the n neighbors edges
for ei=1:neighbors    
    if ~isnan(cur_len(ei))
        % If the edge exists
        
        % fa: force amplitude
        % fa>0 means current edge is longer than target
        fa = cur_len(ei)-rest_len(ei);
        
        % fd: force direction (unit vector)
        % force direction: move towards neighbor (i.e. neighbor-current)        
        fd = nodes(edges(idx,ei),:)-nodes(idx,:);
        
        % force direction must be normalised
        fd = fd./norm(fd);        
        
        %fprintf(1,'Force %d to %d %d %d\n',fa,fv(1),fv(2),fv(3));        
        
        % Force vector is unit vector multiplied by amplitude
        fv = fv+fd.*fa;
    end
    
    
end
