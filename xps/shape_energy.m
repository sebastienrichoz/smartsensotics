%% Shape optimisation based on potential energy
% Assume a spring on each edge whose rest length is defined
% by the target shape to approximate.
% 
% Parameters
%   nodes_apx:  Nodes of approximate shape (shape to optimise)
%   edges_apx:  Edges of approximate shape (shape to optimise)
%   edges_d_len:    Pre-computed target edge lengths


function energy=shape_energy(nodes_apx,edges_apx,edges_d_len,neighbors)

% debug
%nodes_apx(1,:)



% Compute the optimised shape edge lengths
%nodes_tst=nodes_apx;
%nodes_tst(1,:)=[0 4 0];

edges_apx_len = edgelen_all(nodes_apx,edges_apx,neighbors);
%edges_apx_len = edgelen_all(nodes_tst,edges_apx);

% Difference squared
e_diff = (edges_d_len-edges_apx_len).^2;
%e_diff = (abs(edges_d_len-edges_apx_len));

% Keep difference squared only for non-nan
e_diff=e_diff(~isnan(e_diff));

% convert to energy
energy=sum(e_diff);

%energy

