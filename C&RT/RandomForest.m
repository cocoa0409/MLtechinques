function ein=RandomForest(Tree_number,train, test)
ein=0;
predicate_matrix=zeros(length(test),Tree_number);
for T=1:Tree_number
    sample=randi(length(train),1,length(train));
    for n=1:length(train)
    	train_set(n,:)=train(sample(1,n),:);
    end
    predicate_matrix(:,T)=Dtree_predicate(train_set,test);
end
final_predicate=sign(mean(predicate_matrix')');
ein=sum(abs(final_predicate-test(:,end)))/2/length(test);

