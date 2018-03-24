function Error_rate=check_predict(test_predicate,test)
N=length(test);
Error_rate=sum(abs(test_predicate-test(:,3)))/2/N;