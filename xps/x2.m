neighbors=8;
[nodes_opt fv ef output] = shapeopt_energy(nodes_apx,edges_apx,nodes_d,edges_d,neighbors);


figure;
clf;
% Plot target mesh
plot_nodes(nodes_d,'k.');
plot_edges(nodes_d,edges_d,[0 0 0],'-',neighbors);

% Plot optimised mesh
plot_nodes(nodes_opt,'b.');
plot_edges(nodes_opt,edges_apx,[0 0 1],'-',neighbors);

% Plot mesh before optimisation
plot_edges(nodes_apx,edges_apx,[.5 .5 .5],'--',neighbors);


