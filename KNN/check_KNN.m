function Accuracy=check_KNN(predict,test_label)
error_rate=sum(abs(predict-test_label))/2/size(test_label,1);
Accuracy=1-error_rate;
end