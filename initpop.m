function pop=initpop(popsize,X,K)
[~,SNPs]=size(X);
A=zeros(popsize,K);
snp=[];
for i=1:popsize
    snp(1)=ceil(rand*SNPs);
    for j=2:K
      snp(j)=ceil(rand*SNPs);  
      while ismember(snp(j),snp(1:j-1)) 
         snp(j)=ceil(rand*SNPs);        
      end
    end
    temp=snp;
    snp=sort(snp);
    while ismember(snp,A,'rows')
        j=ceil(rand*K);
        snp(j)=ceil(rand*SNPs); 
        temp=snp;
        snp=sort(snp);
    end
    
    A(i,:)=snp;  
    pop(i,:)=temp;  
    snp=[];
end
    
