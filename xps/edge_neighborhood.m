function e=edge_neighborhood(neighbors, nidx, a, l, na, nl)


% Add the edge - index to the 6 neighbors or -1 if none
% left ang_next ang_prev right ang_next-right ang_prev-left
e(1:neighbors) = -1;

% Link to left
if l>0
    e(1) = nidx-na;
    % Link to ang_prev-left
    if neighbors>4
        if a>0
            e(6) = nidx-na-1;
        else
            e(6) = nidx-1;
        end
    end
    % Link to next-left
    if neighbors>6
        if a<na-1
            e(7) = nidx-na+1;
        else
            e(7) = nidx+1-na-na;
        end
    end
end
% Link to right
if l<nl-1
   e(2) = nidx+na;
   % Link to ang_next-right
   if neighbors>4
       if a<na-1
           e(5) = nidx+na+1;
       else
           e(5) = nidx+1;
       end
   end
   % Link to prev-right
   if neighbors>6
       if a>0
           e(8) = nidx+na-1;
       else
           e(8) = nidx+na+na-1;
       end
   end
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