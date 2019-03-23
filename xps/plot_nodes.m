%% plot_nodes(nodes)
% Plots a dot at each node location

function plot_nodes(nodes,sty)

hold on;

for i=1:size(nodes,1)
    v=nodes(i,:);
    
    plot3(v(1),v(2),v(3),sty);
    
end


xlabel('X');
ylabel('Y');
zlabel('Z');

