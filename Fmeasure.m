clc
clear;
Candidate=[];

X=[];
snp1=[];
snp2=[];
TP=0;
FP=0;
FN=0;

tp=0;
fn=0;
fp=0;
power=0;
filepath='dataset\DME02_400_EDM-1\DME02_400_EDM-1_';
filepath2='dataset\DME02_400_EDM-1\';
FunctionSNP=(99:100);
for  dataSetId =1:100
     if dataSetId<10
         noId = strcat('00',num2str(dataSetId));
     elseif dataSetId<100
         noId = strcat('0',num2str(dataSetId));
     else
         noId = num2str(dataSetId);
     end
    noId2 = num2str(dataSetId);
    data = dlmread(strcat(filepath,noId,'.txt'),'\t',1,0);
    %snp=dlmread(strcat(filepath2,noId2,'.txt'),'\t',1,0);
    snp=importdata(strcat(filepath2,noId2,'.txt'));
    [m,n]=size(data);
     X=data(:,1:n-1);
     y=data(:,n);
    %Candidate=snp;
    %snp1=[];
    % CandidateSize =length(Candidate(:,1));
    % r = 1;
   %  while r < CandidateSize+1 %length(Candidate(:,1))
   %       S = Candidate(r,:);
  %        OR = OR_value(X(:,S),y);
   %       if OR>1
   %           snp1=[snp1;S];
   %       end
   %       r=r+1;
   %  end
     snp1=snp;
     
    
     %TF��TP��FN��FP 
     Candidate=snp1;
     CandidateSize =length(Candidate(:,1));
     r = 1;
     while r < CandidateSize+1 %length(Candidate(:,1))
         S = Candidate(r,:);
         [P_value] = KF_score(X(:,S),y);%G����
         if P_value <0.0001
            %[P_value2] = permutation(data(:,S),data(:,Dim+1),100,pvalue);
             %if P_value2 < 0.01
                 if isequal(FunctionSNP,S)
                     TP = TP + 1;
                 else
                     FP = FP + 1;
                 end
            % end
         else
             if isequal(FunctionSNP,S)
                 FN = FN + 1;
             end
         end
         r = r + 1;
     end 
     
     
end

 recall = TP / (TP + FN);
 precision = TP / (TP + FP);
 F_measure = 2 /( 1/recall + 1/precision);

