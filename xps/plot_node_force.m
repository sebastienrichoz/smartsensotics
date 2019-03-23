%% function plot_nodes_force(nodes,force,sty)
% Plots a vector force from node
% Parameters:
%   nodes:  All nodes coordinates
%   forces: All force vectors

function plot_node_force(nodes,forces,sty)


for i=1:size(nodes,1)
    p1=nodes(i,:);

    p2=p1+forces(i,:);
    
    

    line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)]);
    
end


