function [index, direction, stump_value,error_of_gt]=decision_stump(X_train_label, X_train_data, stump_value_candidate , weight)
m=size(X_train_data,1);
n=size(X_train_data,2);

sum_of_weight=0;
for i=1:m,
    sum_of_weight=sum_of_weight+weight(i);
end

stump_error=zeros(m+1,2*n);
for i=1:m+1,
    for j=1:n,
        stump_error(i,j*2-1)=compute_error_of_each_decisionstump(X_train_data,X_train_label,stump_value_candidate(i,j), j , 1,weight);
        % +1direction
        stump_error(i,j*2)=compute_error_of_each_decisionstump(X_train_data,X_train_label,stump_value_candidate(i,j), j , -1,weight);
        % -1direction
    end
end
[row,column]=find(stump_error==min(min(stump_error)) );
number=size(row,1);
index=ceil(column(number)/2);
direction=2*mod(column(number),2)-1;
stump_value=stump_value_candidate(row(number),index);
error_of_gt= min(min(stump_error))/sum_of_weight;


