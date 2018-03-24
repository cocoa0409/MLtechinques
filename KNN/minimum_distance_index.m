function pos=minimum_distance_index(train,test)
pos=zeros(size(test,1),1);
final=size(test,2);
for i=1:size(test,1)
    dis=1000;
    for j=1:size(train,1)
        if norm((train(j,1:(final-1))-test(i,1:(final-1))),2)<dis,
            dis=norm((train(j,1:(final-1))-test(i,1:(final-1))),2);
            pos(i)=j;
        end
    end
end
           