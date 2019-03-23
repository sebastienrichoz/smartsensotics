
%% Generate shapes
% Mesh after physical deformation (i.e. mesh to imitate).
[nodes_d edges_d]= gen_cyl(3,10);


% Initial mesh (to optimise) that must converge to mesh to imitate
[nodes_apx edges_apx]= gen_cyl(4,20);


%% Plot shapes
% Plot physical deformation shape (target)
figure(1);
clf;
plot_nodes(nodes_d,'k.');
plot_edges(nodes_d,edges_d,[0 0 0],'-');

% Plot approximation shape
plot_nodes(nodes_apx,'b.');
plot_edges(nodes_apx,edges_apx,[0 0 1],'-');

