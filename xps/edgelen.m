%% function edgelen(nodes,edges,idx)
% returs a 1x4 vector with the length of the 4 edges, or NaN if the edge
% does not exist
%
% Returns:
%   1xNeighbors vector containing the edge length or NaN if the edge does not exist

function l=edgelen(nodes,edges,idx,neighbors)


l(1:neighbors) = NaN;

%Coordinate of current node
pc = nodes(idx,:);

%fprintf(1,'Node %d. Coord: %d %d %d.\n',idx,pc(1),pc(2),pc(3));

% Iterate all edges
for ei = 1:neighbors    
    % If edge exists
    if edges(idx,ei)>0
        % Coordinate of neighbor node
        pn = nodes(edges(idx,ei),:);
        
        
        % edge length
        l(ei) = norm(pc-pn);
        
        
        %fprintf(1,'Node %d. Coord: %d %d %d. Neighbor is node %d. Coord: %d %d %d\n',idx,pc(1),pc(2),pc(3),edges(idx,ei),pn(1),pn(2),pn(3));
        %fprintf(1,'\tNeighbor is node %d. l=%d. Coord: %d %d %d\n',edges(idx,ei),l(ei),pn(1),pn(2),pn(3));
        
    end
    
    
    
end

