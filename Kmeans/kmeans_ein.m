function [eout,Eout]=kmeans_ein(centers,list,train)
N=length(list);
Err=0;
for i=1:N
    Err=Err+norm(centers(list(i),:)-train(i,:),2)^2;
end
Eout=err/N;
         