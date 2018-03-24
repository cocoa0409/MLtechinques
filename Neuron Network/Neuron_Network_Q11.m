function Accuracy_mean=Neuron_Network_Q11(train, test )
% construct a neuron network with 1 hidden layer ( neu_number neurons )
r=0.1;
eta=0.1;
M=[1,6,11,16,21];
d=2;
T=50000;
train_data=train(:,1:2);
train_label=train(:,3);
N=length(train_data);
for p=1:10,
    k=1;
    for m=M,
                %randomly initialize
  %w1:   w01 w11  w12  w13.....   w1m
  %         w02 w21  w22  w23....    w2m
  
 %w2: w01
 %       w11
 %         ...
 %       wm1
        w1=2*rand(d+1,m)*r-r;
        w2=2*rand(m+1,1)*r-r;
        % SGD T times
        for t=1:T,
            n=randi(N);
            s1=[1,train_data(n,:)]*w1;
            x1=tanh(s1);
            s2=[1,x1]*w2;
            x2=tanh(s2);
            delta2=-2*(train_label(n)-x2)*(1-tanh(s2)^2);
            delta1=delta2*w2(2:end,:).*(1-tanh(s1).^2)';
            w2=w2-eta*delta2*[1,x1]';
            w1=w1-eta*[1,train_data(n,:)]'*delta1';
        end
        %now we've trained w1 and w2.
        Accuracy(p,k)=check_nnpredict(w1,w2,test)
        k=k+1;
    end
end
Accuracy_mean=mean(Accuracy,1);
end

        
    
