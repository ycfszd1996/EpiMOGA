clc
clear;
startIndex = 1; 
endIndex = 100; 
type1='DME';
type2='_EDM-1';
type3='_400';
dim=2;% degree
Dim=100;% The number of SNPS in the sample data
    filenum=2;
    noId2 = strcat('0',num2str(filenum));
    filepath=strcat(type1,noId2,type3,type2,'\',type1,noId2,type3,type2,'_');
    filepath2=strcat(type1,noId2,type3,type2,'\');
    X=[];
    snp1=[];
    snp2=[];
    Candidate=[];
    power=0;
    K=60;
    
    for dataSetId = startIndex:endIndex
        dataSetId
        if dataSetId<10
            noId = strcat('00',num2str(dataSetId));
        elseif dataSetId<100
            noId = strcat('0',num2str(dataSetId));
        else
            noId = num2str(dataSetId);
        end
        data = dlmread(strcat(filepath,noId,'.txt'),'\t',1,0);
        [m,n]=size(data);
        X=data(:,1:n-1);
        y=data(:,n);
        %Data set scrambling
        [X_m,~]=size(X);
        rowrank = randperm(X_m);
        X=X(rowrank, :);
        y=y(rowrank);
        FunctionSNP=(n-dim:n-1);
        %EpiMOGA
        [snp1]=ga_1(X,y,dim,K);
 
        
        % power
        [s_1,~]=size(snp1);
        for i=1:s_1
            if isequal(snp1(i,:), n-dim:n-1 )
                power=power+1;
            end
        end
    end
    power