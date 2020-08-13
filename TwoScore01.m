function [K2Score,Gini_Score] = TwoScore01(snp_com,state)

ua = unique(state);
if length(ua)~=2 
    disp(' Class state is not equal to 2 !!!');
elseif min(ua)>0
    state = state -min(ua);
end

[xrow,xcol] = size(snp_com);
[Data,idx,cid]=unique(snp_com,'rows');
[lrow,~]=size(Data);



sample=zeros(lrow,1);
disease=sample;
control=sample;

for i=1:xrow  
   if state(i) == 1
       disease(cid(i)) = disease(cid(i)) + 1;
   else
       control(cid(i)) = control(cid(i)) + 1;
   end
   

end
sample = disease + control;



% [disease';control';sample']
%% K2 score 
    K2score=0;

    for i=1:lrow
        if sample(i)>0
            y=My_factorial(sample(i)+1);
            r=My_factorial(disease(i))+My_factorial(control(i));
            K2score=K2score+(r-y);
        end
    end
   K2Score =abs(K2score);

 %% G-test
%  [G,K2Score] = Gtest_scoreFor_multiLoci(snp_com,state);

%% GINI score
 
%     P=sample./xrow; 
%     Pcase=zeros(lrow,1);
%     Pcontrol=zeros(lrow,1);
%     for i=1:lrow
%         if sample(i)~=0
%                Pcase(i) = disease(i)./sample(i);
%                Pcontrol(i) = control(i)./sample(i);
%         end
%     end
%%%%%%%
        sCase = sum(disease);
        Pcase = disease./sCase;%
        Pcontrol = control./(xrow - sCase);%
        P = sample / xrow;
         Gini_Score = sum(P.*(1-Pcase.^2 - Pcontrol.^2));
%  Gini_Score = 0;
%  
%      for i = 1:length(P)
%          Gini_Score = Gini_Score + P(i) * (1 - Pcase(i)^2 - Pcontrol(i)^2);
%      end
        
             
        
         

%

%% f is function used to calculate log form factorial
    function f=My_factorial(e)
        f=0;
        if e>0
            for o=1:e
                f=f+log(o);
            end
        end
    end
end


