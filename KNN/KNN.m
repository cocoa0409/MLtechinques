function predict=KNN(train,test)
pos=minimum_distance_index(train,test);
predict=train(pos,end);
end
