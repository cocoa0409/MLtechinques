function direction=Dstump_direction(train,r)
   left_positive =0;
   left_negative=0;
   for i=1:length(train)
       if train(i,r(1,3))<r(1,2),
           if train(i,3)==1,
               left_positive =left_positive+1;
           else
               left_negative=left_negative+1;
           end   
       end
   end
   
   if left_positive > left_negative,
       direction=1;
   else
       direction=-1;
   end
end

   
           