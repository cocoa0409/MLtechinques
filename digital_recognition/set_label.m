function [X,p,q]=set_label(X,k)
%if label=k, set to 0, else set to 1;
m=size(X,1);
p=0;
q=0;
for i=1:m
    if X(i,1)~=k,
        X(i,1)=1;
        p=p+1;
    else
        q=q+1;
        X(i,1)=0;
%        X(i,1)=0;       q=q+5;      n=size(X,1);       for j=1:5,           X(n+j,:)=X(i,:);        end
    end
end
        