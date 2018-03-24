function r=Dtree(train,order)
%design to save Dtree in r
%r1: label  r2: stump value  r3:index  r4:order of nodes
%if it is leave, r2=0,r3=0;
%If it is not leave, r1=0;
r(1,4)=order;
if impurity(train(:,3))==0,
    r(1,1)=sign(train(1,3));
else
   [N,~]=size(train);
   train1=sortrows(train,1);
   train2=sortrows(train,2);
   theta1=0;
   theta2=0;
   % impossible tobe pure! so reject a hypothesis
   for n=1:N-1
       theta1(n,1)=(train1(n+1,1)+train1(n,1))/2;
       theta2(n,1)=(train2(n+1,2)+train2(n,2))/2;
   end
    for n=1:N-1,
        imp1(n)=impurity(train1(1:n,3));
        imp2(n)=impurity(train1(n+1:N,3));
        b1(n)=n*imp1(n)+(N-n)*imp2(n);
    end
    for n=1:N-1,
        imp1(n)=impurity(train2(1:n,3));
        imp2(n)=impurity(train2(n+1:N,3));
        b2(n)=n*imp1(n)+(N-n)*imp2(n);
    end
     b=[b1,b2];
     [~,pos]=min(b);
     if pos<=N-1,
         r(1,3) = 1;
         r(1,2) = theta1(pos);
         r=[r;Dtree(train1(1:pos,:),order*2)];
         r=[r;Dtree(train1(pos+1:N,:),order*2+1)];
     else
         pos=pos-N+1;
         r(1,3)=2;
         r(1,2)=theta2(pos);
         r=[r;Dtree(train2(1:pos,:),order*2)];
         r=[r;Dtree(train2(pos+1:N,:),order*2+1)];         
     end
end
end
    

