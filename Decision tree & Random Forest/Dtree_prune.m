function r=Dtree_prune(r,train ,Max_leaves_number)
%design to save Dtree in r
%r1: label  r2: stump value  r3:index  r4:order of nodes
%if it is leave, r2=0,r3=0;
%If it is not leave, r1=0;


%r=Dtree(train,1);

while size(find(r(:,1)~=0),1) > Max_leaves_number    %need pruning
    real_leaf=r(find(r(:,1)~=0),:);
    j=0;
    branch_to_leaves=0;
    for i=1:floor(max(real_leaf(:,4))/2),
        if ( size(find(real_leaf(:,4)==2*i),1)~=0 ) && ( size(find(real_leaf(:,4)==2*i+1),1)~=0 ),
            j=j+1;
            branch_to_leaves(j)=i;
        end
    end
    error_of_pruned_tree=zeros(size(branch_to_leaves,2),1);
    for i=1:size(branch_to_leaves,2),
        j=1;
        current_node=branch_to_leaves(i);
        routine=current_node;
        while routine(j)~=1
            routine(j+1)=floor(current_node/2);
            current_node=floor(current_node/2);
            j=j+1; 
        end
        %save routine to noden branch_to_leaves(i)
        r1=r;
        eli_index=find(r1(:,4)==2*branch_to_leaves(i));
        r1(eli_index,:)=[];
        eli_index=find(r1(:,4)==2*branch_to_leaves(i)+1);
        r1(eli_index,:)=[];
        
        new_node_index=find(r1(:,4)==branch_to_leaves(i));
        r1(new_node_index,2)=0;
        r1(new_node_index,3)=0;
        r1(new_node_index,1)=backprop(r1,train, routine);
        error_of_pruned_tree(i)=pruned_Dtree_predicate(r1,train);
    end
    % pruning now!
    final_decision_index=find(error_of_pruned_tree==min(error_of_pruned_tree));
    final_branch_to_node=final_decision_index(1);
    j=1;
    current_node=branch_to_leaves(final_branch_to_node);
    routine=current_node;
    while routine(j)~=1
        routine(j+1)=floor(current_node/2);
        current_node=floor(current_node/2);
        j=j+1; 
    end
        %save routine to noden branch_to_leaves(i)
     eli_index=find(r(:,4)==2*branch_to_leaves(final_branch_to_node));
     r(eli_index,:)=[];
     eli_index=find(r(:,4)==2*branch_to_leaves(final_branch_to_node)+1);
     r(eli_index,:)=[];
     new_node_index=find(r(:,4)==branch_to_leaves(final_branch_to_node));
     r(new_node_index,2)=0;
     r(new_node_index,3)=0;
     r(new_node_index,1)=backprop(r,train, routine);
end
end
    
        
        
    
            
        
    
    
    

