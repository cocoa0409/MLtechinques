function error= compute_error_of_each_decisionstump(X_train_data,X_train_label, theta, index , direction,weight)
%index in 1:n
%direction -1 or 1
m=size(X_train_data,1);
error=0;
for i=1:m,
    if( ( X_train_data(i,index)>theta && X_train_label(i)==-1*direction) || (X_train_data(i,index)<theta && X_train_label(i)==1*direction ))
        error=error+weight(i);
    end
end
