%% gen_square(s, l, neighbors, nc, nl)
% Generates a square cylinder parallel to the X axis
%   s: length of the face of the square
%   l:  length of the cylinder
%   neighbors: number of neighbors of each node
%   nc: number of nodes in the circumference
%   nl: number of nodes in the length
%
function [nodes, edges, nodes_xy]=gen_square(s_face, s_length, neighbors, nc, nl)

nodes=[];
edges=[];

nodes_xy = ssquare(s_face,nc); % distribution of the nodes in 2D

% node index
nidx = 1;
for l=0:nl-1
    z = l * s_length/nl; % Current length
    for c=0:nc-1
        % Nodes
        v = [z nodes_xy(c+1,1) nodes_xy(c+1,2)];
        nodes=[nodes;v];
        
        % Edges
        e = edge_neighborhood(neighbors, nidx, c, l, nc, nl);
        edges=[edges;e];
        nidx=nidx+1;        
    end
end
    