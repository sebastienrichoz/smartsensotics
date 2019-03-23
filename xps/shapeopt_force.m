%% Shape optimisation based on spring model
% Assume a spring on each edge whose rest length is defined
% by the target shape to approximate.
% 
% Parameters
%   nodes_apx:  Nodes of approximate shape (shape to optimise)
%   edges_apx:  Edges of approximate shape (shape to optimise)
%   nodes_d:    Nodes of target shape (ground truth)
%   edges_d:    Edges of target shape (ground truth).
%               edges_apx and edges_d should be identical
%   plotevery:  Plot the convergence every plotevery iterations
%               If plotevery is -1 the no plotting occurs.

function nodes_opt = shapeopt_force(nodes_apx,edges_apx,nodes_d,edges_d,plotevery)

% Pre-compute the target edge lengths
edges_d_len = edgelen_all(nodes_d,edges_d);

%% Parameters
%Convergence speed
nu = .5;
% Total iterations
it = 100;

% Initialise return value
nodes_opt = nodes_apx;

f=figure;
clf;
hold on;

% Plot original mesh
plot_edges(nodes_apx,edges_apx,[.5 .5 .5],'--');


%% Convergence iteration
for i=0:it-1
    
    fvall = node_force_all(nodes_opt,edges_apx,edges_d_len);

    fvall = fvall.*nu;

    % Plot all the 10 plos
    if plotevery~=-1
    if mod(i,plotevery)==0
        plot_node_force(nodes_opt,fvall,'')
        %plot_edges(nodes_opt,edges_apx,[.5 .5 .5],'-');
    end
    end

    nodes_opt = nodes_opt + fvall;

    if sum(sum(isnan(nodes_opt)))~=0
        fprintf(1,'Error iteration %d\n',i);
    end

    %plot_nodes(nodes_apx,'r.');
    
    

end

% Plot optimised mesh
plot_edges(nodes_opt,edges_apx,[0 0 0],'--');


