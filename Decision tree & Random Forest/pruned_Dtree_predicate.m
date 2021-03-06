function [Error_rate,test_predicate]=pruned_Dtree_predicate(r,test)
N=length(test);
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
test_predicate=test_predicate';
Error_rate=sum(abs(test_predicate-test(:,3)))/2/N;
    