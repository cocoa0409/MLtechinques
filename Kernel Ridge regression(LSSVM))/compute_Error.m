function error_01=compute_Error(X_train,X_test,gamma,beta)
predicate=zeros(size(X_test,1),1);
for i=1:size(X_test,1),
    tem=0;
    for j=1:size(X_train,1),
        tem=tem+beta(j)*exp(-gamma*((     norm(X_test(i,1:end-1)-X_train(j,1:end-1),2)   )^2    ));
    end
     predicate(i)=sign(tem);
end
error_01=(sum(abs(predicate - X_test(:,end) ))/2) / size(X_test,1);