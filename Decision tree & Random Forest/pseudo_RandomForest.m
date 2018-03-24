function aver_ein=pseudo_RandomForest(Tree_number, expr_number)
ein=0;
[train,~] = load_data;
for k=1:expr_number
    for T=1:Tree_number
        sample=0;
        sample=randi(100,1,100);
        for n=1:100
            train_set(n,:)=train(sample(1,n),:);
        end
        train_predicate=Dtree_predicate(train_set,train);
        ein(k,T)=check_predict(train_predicate,train);
    end
end
aver_ein=mean(mean(ein));

