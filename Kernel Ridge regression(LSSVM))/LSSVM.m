function [error_in_matrix,error_out_matrix]=LSSVM(X, number_for_training)
%%400 for training and 100 for testing
X=[ones(size(X,1),1),X];
gamma=[32,2,0.15];
lamada=[0.001,1,1000];
error_in_matrix=zeros(size(gamma,2),size(lamada,2));
error_out_matrix=zeros(size(gamma,2),size(lamada,2));
K=zeros(number_for_training,number_for_training);
for s=1:size(gamma,2),
    for t=1:size(lamada,2),
        for i=1:number_for_training,
            for j=i:number_for_training;
                K(i,j)=exp(-gamma(s)*(     norm(X(i,1:end-1)-X(j,1:end-1),2)   )^2    );
                K(j,i)=K(i,j);
            end
        end
        beta=(K+lamada(t)*eye(number_for_training))\X(1:number_for_training,end);
        error_in_matrix(s,t)=compute_Error( X(1:number_for_training,:), X(1:number_for_training,:), gamma(s) , beta );
        error_out_matrix(s,t)=compute_Error(X(1:number_for_training,:), X(number_for_training+1:end,:) , gamma(s), beta );
    end
end
%[Error_in_min_raw,Error_in_min_column]=find(error_in_matrix==(min(min(error_in_matrix))));
%[Error_out_min_raw,Error_out_min_column]=find(error_out_matrix==(min(min(error_out_matrix))));
        