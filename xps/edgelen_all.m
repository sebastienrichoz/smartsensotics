%% function lall = edgelen_all(nodes,edges)
% Computes the length of all the node's edges.
% Returns a nx4 matrix. Each n line contains four lengths of the node edges 
% NaN indicates that an edge does not exist

function lall = edgelen_all(nodes,edges)

lall=[];

for idx=1:size(nodes,1)
    l = edgelen(nodes,edges,idx);
    lall=[lall;l];
    
end



