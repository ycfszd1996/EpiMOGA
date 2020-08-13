function newpop = crossover_1(pop,pc)
%input£ºpop,pc
%output£ºnewpop
[px,py] = size(pop);
 
for i = 1:2:px-1
    if rand<pc
        cpoint = round(rand*py);
        newpop(i,:) = [pop(i,1:cpoint),pop(i+1,cpoint+1:py)];
        newpop(i+1,:) = [pop(i+1,1:cpoint),pop(i,cpoint+1:py)];
        t=0;
        while length(unique( newpop(i,:)))~=length(pop(i,:))||length(unique( newpop(i+1,:)))~=length(pop(i+1,:))
            cpoint = round(rand*py);
            newpop(i,:) = [pop(i,1:cpoint),pop(i+1,cpoint+1:py)];
            newpop(i+1,:) = [pop(i+1,1:cpoint),pop(i,cpoint+1:py)];
            t=t+1;
            if t>5
                newpop(i,:) = pop(i,:);
                newpop(i+1,:) = pop(i+1,:);
                break;
            end
        end  
        newpop(i,:)=sort(newpop(i,:));
        newpop(i+1,:)=sort(newpop(i+1,:));
        
    else
        newpop(i,:) = pop(i,:);
        newpop(i+1,:) = pop(i+1,:);
    end
end

end