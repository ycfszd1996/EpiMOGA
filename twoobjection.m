function objvalue=twoobjection(X,pop,y)
objvalue1=[];
objvalue2=[];

[pm,~]=size(pop);
for i=1:pm
    [objvalue1(i),objvalue2(i)]=TwoScore01(X(:,pop(i,:)),y);
end

%objvalue(1:pm)=1;
objvalue(1:pm)=2;
for i=1:pm
    for j=(i+1):pm
        %if objvalue1(i)<=objvalue1(j)&&objvalue2(i)<=objvalue2(j)&&(objvalue1(i)<objvalue1(j)||objvalue2(i)<objvalue2(j))
       % if((objvalue1(j)<objvalue1(i))&&(objvalue2(j)<objvalue2(i)))||((objvalue1(j)<objvalue1(i))&&(objvalue2(j)==objvalue2(i))) ...
                %||((objvalue1(j)==objvalue1(i))&&(objvalue2(j)<objvalue2(i)))
            %objvalue(i)=10;
        %elseif objvalue1(i)>=objvalue1(j)&&objvalue2(i)>=objvalue2(j)&&(objvalue1(i)>objvalue1(j)||objvalue2(i)>objvalue2(j))
       if ((objvalue1(j)<objvalue1(i))&&(objvalue2(j)<objvalue2(i)))||((objvalue1(j)<objvalue1(i))&&(objvalue2(j)==objvalue2(i))) ||((objvalue1(j)==objvalue1(i))&&(objvalue2(j)<objvalue2(i)))
            objvalue(j)=objvalue(j)+objvalue(i);
            objvalue(i)=1;
            break;
        end
    end
end


            
                