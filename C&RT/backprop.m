function new_predicate_label=backprop(r,train, routine)
N=length(routine);
%routine marks the node index but not the line index!
for i=2:N,
    branch_index=find(r(:,4)==routine(N+2-i));
    j=1;
    while j~=length(train)
        if mod(routine(N+2-i-1),2)==0,
            if train(j, r(branch_index,3) ) > r(branch_index,2),
                train(j,:)=[];
            else
                j=j+1;
            end
        elseif mod(routine(N+2-i-1),2)==1,
            if train(j, r(branch_index,3) ) < r(branch_index,2),
                train(j,:)=[];
            else
                j=j+1;
            end
        end
    end
end
new_predicate_label=sign(sum(train(:,3)));
    
    
