function test_predicate=Dtree_predicate(train,test)
r=Dtree(train,1);
N=length(test);
test_predicate=zeros(N,1);
for i=1:N,
    node_index=1;
    line_index=find(r(:,4)==node_index);
    while r(line_index,1)==0
        if test(i, r(line_index,3) )< r(line_index,2),
            node_index=2*node_index;
            line_index=find(r(:,4)==node_index);
        else
            node_index=2*node_index+1;
            line_index=find(r(:,4)==node_index);
        end
    end
    test_predicate(i)=r(line_index,1);
end
    
            
    