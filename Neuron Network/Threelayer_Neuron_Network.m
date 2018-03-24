function Square_error_mean=Threelayer_Neuron_Network(train, test )
% construct a neuron network with 1 hidden layer ( neu_number neurons )
r=0.1;
eta=0.01;
d=2;
m1=8;
m2=3;
T=50000;
train_data=train(:,1:2);
train_label=train(:,3);
N=length(train_data);
for p=1:10,
                %randomly initialize
  %w1:   w01 w11  w12  w13.....   w1m1
  %         w02 w21  w22  w23....    w2m1
  
    %w2:   w01 w11  w12  w13.....   w1m2
  %         w02 w21  w22  w23....    w2m2
  
 %w3: w01
 %       w11
 %         ...
 %       wm21
        w1=2*rand(d+1,m1)*r-r;
        w2=2*rand(m1+1,m2)*r-r;
        w3=2*rand(m2+1,1)*r-r;
        % SGD T times
        for t=1:T,
            n=randi(N);
            s1=[1,train_data(n,:)]*w1;
            x1=tanh(s1);
            s2=[1,x1]*w2;
            x2=tanh(s2);
            s3=[1,x2]*w3;
            x3=tanh(s3);
            delta3=-2*(train_label(n)-x3)*(1-tanh(s3)^2);
            delta2=delta3*w3(2:end,:).*(1-tanh(s2).^2)' ;
            
            delta1=w2(2:end,:)*delta2.*(1-tanh(s1).^2)';
            w3=w3-eta*delta3*[1,x2]';
            w2=w2-eta*[1,x1]'*delta2';
            w1=w1-eta*[1,train_data(n,:)]'*delta1';
        end
        %now we've trained w1 and w2.
        Square_error(p)=Threelayer_check_nnpredict(w1,w2,w3,test);
end
Square_error_mean=mean(Square_error,1);
end