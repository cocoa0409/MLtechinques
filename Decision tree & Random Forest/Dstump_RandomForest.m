function [ein,eout]=Dstump_RandomForest(train,test)
train_predicate=zeros(length(train),300);
test_predicate=zeros(length(test),300);
for k=1:1,
    for T=1:300,
        sample=0;
        sample=randi(100,1,100);
        for n=1:100,
            train_set(n,:)=train(sample(1,n),:);
        end
        
  %Dtree_prune allows us to train Dtree first and then prune it.
        %r=Dtree(train_set,1);       
        %r=Dtree_prune(r,train_set,2);
  %Dtree_prune allows us to train Dtree first and then prune it.
        %r=Dtree(train_set,1);
  %Dstump_basedon_impurity just found the Dstump which minimize the impurity
        r=Dstump_basedon_impurity(train_set);
        
        
        [~,train_predicate(:,T)]=pruned_Dtree_predicate(r,train);
        [~,test_predicate(:,T)]=pruned_Dtree_predicate(r,test);
    end
    final_train_predicate=sign(mean(train_predicate,2));
    final_test_predicate=sign(mean(test_predicate,2));
    ein_k(k)=sum(abs(final_train_predicate-train(:,end)))/2/length(train);
    eout_k(k)=sum(abs(final_test_predicate-test(:,end)))/2/length(test);
end
ein=mean(ein_k);
eout=mean(eout_k);