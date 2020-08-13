function [newpop] = mutation_1(pop,pm,X)
%input£ºpop,pm
%output£ºnewpop
[px,py] = size(pop);
newpop = ones(size(pop));
[~,n]=size(X);

for i = 1:px
    if(rand<pm)
        mpoint = ceil(rand*py);
        newpop(i,:) = pop(i,:);
        newpop(i,mpoint)=ceil(rand*n);
        while ismember(newpop(i,mpoint),pop(i,1:py))
            newpop(i,mpoint)=ceil(rand*n);
        end
        newpop(i,:)=sort(newpop(i,:));
    else
        newpop(i,:) = pop(i,:);
    end
end
