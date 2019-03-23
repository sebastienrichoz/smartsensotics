%% gen_cyl(r,l)
% Generates a cylinder parallel to the X axis
%   r:  radius
%   l:  length
% 

function [nodes edges]=gen_cyl(s_radius,s_length)

na = 10;
%nl = 20;
nl = 10;
% na = 32;
% nl = 50;



nodes=[];
edges=[];

% node index
nidx=1;
for l=0:nl-1
    cl = s_length/nl*l;     % Current length
    for a=0:na-1        
        ca = 2*pi/na*a;      % Current angle
        
        v=[cl cos(ca)*s_radius sin(ca)*s_radius ];
        
        nodes=[nodes;v];
        
        % Add the edge - index to the 4 neighbors or -1 if none
        % left ang_next ang_prev right
        e=[-1 -1 -1 -1];
        
        % Link to left
        if l>0
           e(1) = nidx-na;
        end
        % Link to right
        if l<nl-1
           e(2) = nidx+na;
        end
        % Link to prev
        if a>0
            e(3) = nidx-1;
        else
            e(3) = nidx+(na-1);
        end
        % Link to next
        if a<na-1
            e(4) = nidx+1;
        else
            e(4) = nidx-(na-1);
        end
        
        %fprintf(1,'Node %d (a=%d x=%d) edges: %d %d %d %d\n',nidx,a,cl,e(1),e(2),e(3),e(4));
        
        edges=[edges;e];
        nidx=nidx+1;
        
        
    end
end



