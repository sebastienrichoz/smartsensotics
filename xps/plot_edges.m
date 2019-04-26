%% plot_edges(nodes,edges)
% Plots a line between linked edges

function plot_edges(nodes,edges,col,sty,neighbors)

hold on;

for i=1:size(edges,1)
    e=edges(i,:);
    
    % Plot only randomly 
    %if rand>.1
     %   continue;
    %end
    
    for j=1:neighbors
        if e(j)>0
            % Edge exists
            
            pto = nodes(i,:);
            pfrom = nodes(e(j),:);
            
            l = line([pfrom(1) pto(1)],[pfrom(2) pto(2)],[pfrom(3) pto(3)]);
            set(l,'Color',col);
            set(l,'LineStyle',sty);
            
            
            
        end
    end
    
    
    
    
    
end




