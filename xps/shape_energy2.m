%% function shape_energy2(nodes_apx)
% Format suitable for fminunc
%
% nodes_apx is a column vector with all the node coordinates
% ( obtained with nodes_apx(:) )

function energy=shape_energy2(nodes_apx,edges_apx,edges_d_len)

%fprintf(1,'shape_energy2\n');

% Reshape as an nx3 matrix of node coordinates
nodes_apx2 = reshape(nodes_apx,length(nodes_apx)/3,3);

% Call the energy function
energy = shape_energy(nodes_apx2,edges_apx,edges_d_len);


