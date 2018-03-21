function accuracy=Linear_Blending_of_DB(index,direction,stump_value,scaler, X_test_data,X_test_label)
m=size(X_test_data,1);
AdaBoost_predicate=zeros(m,1);
n=size(index,1);
compo=zeros(n,1);
for i=1:m,
    for j=1:n,
        if direction(j)==1,
           if X_test_data( i, index( j ))>stump_value(j),
               compo(j)=1;
           else
               compo(j)=-1;
           end
        else
            if X_test_data( i, index( j ))<stump_value(j),
               compo(j)=1;
           else
               compo(j)=-1;
           end
        end
    end
    AdaBoost_predicate(i)=sign(compo'*log(scaler));
end
    
    accuracy=sum(abs(AdaBoost_predicate-X_test_label)/2)/m;