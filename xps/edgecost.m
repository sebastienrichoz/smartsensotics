%% function edgecost(nodes,edges,idx)
% returs a 1x4 vector with the length of the 4 edges, or -1 if the edge
% does not exist

function [l cost]=edgecost(nodes,edges,idx,delta)


l=[-1 -1 -1 -1];

%Coordinate of current node
pc = nodes(idx,:);

fprintf(1,'Node %d. Coord: %d %d %d.\n',idx,pc(1),pc(2),pc(3));

% Iterate all edges
for ei = 1:4    
    % If edge exists
    if edges(idx,ei)>0
        % Coordinate of neighbor node
        pn = nodes(edges(idx,ei),:);
        
        % Adapt by delta
        pn = pn+delta;
        
        % edge length
        l(ei) = norm(pc-pn);
        
        
        %fprintf(1,'Node %d. Coord: %d %d %d. Neighbor is node %d. Coord: %d %d %d\n',idx,pc(1),pc(2),pc(3),edges(idx,ei),pn(1),pn(2),pn(3));
        fprintf(1,'\tNeighbor is node %d. l=%d. Coord: %d %d %d\n',edges(idx,ei),l(ei),pn(1),pn(2),pn(3));
        
    end
    
    
    
end

% Count the cost only on edges which exist
ltmp = l(l~=-1);
cost = norm(ltmp)^2;