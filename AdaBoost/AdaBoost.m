function accuracy=AdaBoost(X_train, MaxIter, X_test)
X_train_label=X_train(:,end);
X_train_data=X_train(:,1:end-1);
m=size(X_train_data,1);
n=size(X_train_data,2);
weight=ones(m,1)/m;

%stump_value_candidate
stump_value_candidate=zeros(m+1,n);
for i=1:n,
    Y = sortrows(X_train_data(:,i));
    stump_value_candidate(1,i)=Y(1)-1;
    for k=2:m,
        stump_value_candidate(k,i)=(Y(k-1)+Y(k))/2;
    end
    stump_value_candidate(m+1,i)=Y(m)+1;
end
%stump_value_candidate

index=zeros(MaxIter,1);
direction=zeros(MaxIter,1);
stump_value=zeros(MaxIter,1);
epsilon_t=zeros(MaxIter,1);
scaler=zeros(MaxIter,1);
for t=1:MaxIter,
    [index(t), direction(t), stump_value(t),epsilon_t(t)]=decision_stump(X_train_label, X_train_data, stump_value_candidate,weight);
    scaler(t)=sqrt((1-epsilon_t(t))/epsilon_t(t));
    for i=1:m,
        if( ( X_train_data(i,index(t))>stump_value(t) && X_train_label(i)==-1*direction(t) ) || ( X_train_data(i,index(t))<stump_value(t) && X_train_label(i)==1*direction(t) ))
            weight(i)=weight(i) * scaler(t);
        else
            weight(i)=weight(i) / scaler(t);
        end
    end
end

X_test_label=X_test(:,end);
X_test_data=X_test(:,1:end-1);
accuracy=Linear_Blending_of_DB(index,direction,stump_value,scaler, X_test_data,X_test_label);