function nodes=ssquare(s,n)

nodes=[];


dv =[1 0;
     0 -1;
     -1 0;
     0 1];

sc = [-s/2 s/2;
      s/2 s/2;
      s/2 -s/2;
      -s/2 -s/2];

for i=0:n-1

    p = (4*s/n)*i;
    
    face = floor(p/s);
    pface = mod(p,s);
    
    nc = sc(face+1,:) + dv(face+1,:)*pface;
    
    nodes=[nodes;nc];
    
end

