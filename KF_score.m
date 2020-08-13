function [P_value] = KF_score(snp_com,state)
ua = unique(state);
if length(ua)~=2 
    disp(' Class state is not equal to 2 !!!');
elseif min(ua)>0
    state = state -min(ua);
end

[xrow,xcol] = size(snp_com);

x=[];
y=[];

for i=1:xrow      
    if snp_com(i,1)==1&&snp_com(i,2)==1
       x(i)=1;
       y(i)=state(i);
    else
        x(i)=0;
       y(i)=state(i);
    end
end
[~,~,P_value]=crosstab(x,y);    
         
end
