function square_error=Threelayer_check_nnpredict(w1,w2,w3,test)
for i=1:length(test)
    predict(i)=tanh([1,tanh([1,tanh([1,test(i,1:2)]*w1)]*w2)]*w3);
end
square_error=(norm(predict'-test(:,3) ,2))/length(test);