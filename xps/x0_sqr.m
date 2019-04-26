neighbors = 8;
na = 20;
nl = 10;

%% Generate shapes
% Mesh after physical deformation (i.e. mesh to imitate).
[nodes_d, edges_d]= gen_ell(4,2,10, neighbors, na, nl);


% Initial mesh (to optimise) that must converge to mesh to imitate
[nodes_apx, edges_apx]= gen_square(10,20,neighbors, na, nl);


%% Plot shapes
% Plot physical deformation shape (target)
figure(1);
clf;
plot_nodes(nodes_d,'k.');
plot_edges(nodes_d,edges_d,[0 0 0],'-', neighbors);

% Plot approximation shape
plot_nodes(nodes_apx,'b.');
plot_edges(nodes_apx,edges_apx,[0 0 1],'-', neighbors);

axis equal