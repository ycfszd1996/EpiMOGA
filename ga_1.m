function [Best1]=ga_1(X,y,dim,k)
% the size of the initial population
popsize=100;
Best=[];
Best1=[];
% crossover probability
pc = 0.6;
% mutation probability
pm = 0.01;
% initializing population
%dim=2;
%score=100;
TT=zeros(1,dim);
for j=1:k
    
    pop = initpop(popsize,X,dim);
    % initializing candidate set
    candite=[];
    objvalue=twoobjection(X,pop,y);

    fitvalue=objvalue;
    for i = 1:100
    % Selection operation
        newpop = selection(pop,fitvalue);
    % Crossover operation
        newpop = crossover_1(newpop,pc);
    % Mutation operation
        newpop = mutation_1(newpop,pm,X);
    %  Fitness Function
        % Pareto optimal approach
        objvalue=twoobjection(X,pop,y);
        fitvalue = objvalue;
        % non-dominant solution
        [s_n,~]=size(pop);
        for t=1:s_n
            if fitvalue(t)>1
                candite=[candite;pop(t,:)];
            end
        end
        % Update the population
        pop=newpop;
       
    end
    %candite={candite1,candite2};
    candite=unique(candite,'rows');
    Objvalue=twoobjection(X,candite,y);
    [c_n,~]=size(candite);
    for t=1:c_n
        if Objvalue(t)>1
            candite(t,:)=sort(candite(t,:));
            Best=[Best; candite(t,:)];
        end
    end
end
Best=unique(Best,'rows');
Objvalue=twoobjection(X,Best,y);
[b_n,~]=size(Best);
%Objvalue1=sort(Objvalue);
%P_value=Objvalue1(b_n-1);
for t=1:b_n
     if Objvalue(t)>1
       Best1=[Best1; Best(t,:)];
    end
end


end