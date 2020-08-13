function [OR] = OR_value(snp_com,state)
ua = unique(state);
if length(ua)~=2 
    disp(' Class state is not equal to 2 !!!');
elseif min(ua)>0
    state = state -min(ua);
end

[xrow,xcol] = size(snp_com);
A=0;
B=0;
C=0;
D=0;

[Data,idx,cid]=unique(snp_com,'rows');
[lrow,~]=size(Data);

for i=1:xrow      
    if snp_com(i,1)==1&&snp_com(i,2)==0
        if state(i)==1
            A=A+1;
        else
            C=C+1;
        end
    else
         if state(i)==1
            B=B+1;
        else
            D=D+1;
         end
    end
end
OR=(A*D)/(B*C);
end
