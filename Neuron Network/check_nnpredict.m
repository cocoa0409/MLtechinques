function Accuracy=check_nnpredict(w1,w2,test)
for i=1:length(test)
    predict(i)=sign(tanh([1,tanh([1,test(i,1:2)]*w1)]*w2));
end
error_rate=sum(abs(predict'-test(:,3)))/2/length(test);
Accuracy=1-error_rate;
