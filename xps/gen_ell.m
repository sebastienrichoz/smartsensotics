%% gen_ell(r1, r2, l, neighbors, na, nl)
% Generates an elliptical cylinder parallel to the X axis
%   r1: radius 1
%   r2: radius 2
%   l:  length
%   neighbors: number of neighbors of each node
%   na: number of nodes in the circumference
%   nl: number of nodes in the length
% 
function [nodes, edges]=gen_ell(s_radius1, s_radius2, s_length, neighbors, na, nl)

nodes=[];
edges=[];

% node index
nidx=1;
for l=0:nl-1
    cl = s_length/nl*l;     % Current length
    for a=0:na-1        
        ca = 2*pi/na*a;      % Current angle
        
        v=[cl cos(ca)*s_radius1 sin(ca)*s_radius2 ];
        
        % nodes
        nodes=[nodes;v];
        
        % edges
        e=edge_neighborhood(neighbors, nidx, a, l, na, nl);
        edges=[edges;e];
        nidx=nidx+1;
    end
end



