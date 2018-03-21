function accuracy=Q18_test(gamma)
[X_train,X_test] = load_data;
X_train=normalization(X_train);
X_test=normalization(X_test);
[X_train,p,q]=set_label(X_train,0);
[X_test,p,q]=set_label(X_test,0);
para= [' -s 0 -t 2  -g ',gamma,' -c 0.1 -h 0' ];
model= svmtrain(X_train(:,1), X_train(:,2:3), para);
[predicted_label, accuracy, decision_values] = svmpredict(X_test(:,1),X_test(:,2:3),model);

