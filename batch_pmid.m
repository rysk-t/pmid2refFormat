%% refBatch

clear all
pmidListFileName=('pmid.txt');
list=textread(pmidListFileName);
citstr=[];
for i=1:length(list)
    citList{i}=pmid2JNS(list(i));
    pause(0)
    citstr=[citstr '\n' citList{i}];
end
%%
dateNow=clock;
fileID = fopen(['_'...
    (num2str(dateNow(1))) (num2str(dateNow(2))) (num2str(dateNow(3)))...
    '_citations.txt'],'w');
for i=1:length(list)
    fprintf(fileID, '%s \r\n', citList{i});
end
fclose(fileID)

