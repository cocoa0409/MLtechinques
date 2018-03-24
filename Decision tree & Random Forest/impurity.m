function Gini = impurity(label)
a1=0;
a2=0;
n=size(label,1);
for i=1:n,
    if label(i)==1,
        a1=a1+1;
    else
        a2=a2+1;
    end
end
Gini=1-(a1/n)^2-(a2/n)^2;
