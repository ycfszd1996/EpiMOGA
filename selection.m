function newpop = selection(pop,fitvalue)
%input£ºpop£¬fitvalue
%output£ºnewpop

[px,~] = size(pop);
totalfit = sum(fitvalue);
p_fitvalue = fitvalue/totalfit;
p_fitvalue = cumsum(p_fitvalue);
ms = sort(rand(px,1));


fitin = 1;
newin = 1;
while newin<=px && fitin<=px
    if(ms(newin))<p_fitvalue(fitin)
        newpop(newin,:)=pop(fitin,:);
        newin = newin+1;
    else
       fitin=fitin+1;
    end
end
end