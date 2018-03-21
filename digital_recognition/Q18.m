function [model]=Q18(k)
[X_train,X_test] = load_data;
[X,p,q]=set_label(X_train,k);
model= svmtrain(X(:,1), X(:,2:3), ' -s 0 -t 1 -d 2 -g 1 -r 1 -c 1 -h 0' ) 
[predicted_label, accuracy, decision_values] = svmpredict(X(model.sv_indices,1), X(model.sv_indices,2:3), model);
