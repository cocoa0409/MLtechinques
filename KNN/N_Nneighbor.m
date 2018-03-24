function predict=N_Nneighbor(N,train, test)
n=size(test,2);
predict=zeros(size(test,1),1);
for i=1:size(test,1)
    distance=zeros(size(train,1),2);
    for j=1:size(train,1)
        distance(j,1)=norm(test(i,1:end-1)-train(j,1:end-1),2);
        distance(j,2)=train(j,end);
    end
    distance=sortrows(distance,1);
    predict(i)=sign(mean(distance(1:N,2)));
end
    
    
        
end