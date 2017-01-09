function [Cr] = pmid2medlineCell(pmid)
%%
medlineStr = urlread(['https://www.ncbi.nlm.nih.gov/pubmed/' num2str(pmid) '?dopt=MEDLINE']);
%%
% AuthorNum=length(regexp(medlineStr, '\nAU'));
% for i=1:length(regexp(medlineStr, '\nAU'))
%     AuthorInd(1, i)=regexp(medlineStr, '\nAU  - ')+length('\nAU  - ')
%     AuthorInd(2, i)=




% medlineStr_=strrep(medlineStr, '\n ', '');
medlineStr_=regexprep(medlineStr, '\n ', '');
% medlineStr_=regexprep(medlineStr_, '  ', ' ');
% medlineStr_=regexprep(medlineStr_, ' - ', '\t');

% pat='AB.*CI';

% medlineStr_=regexprep(medlineStr_, pat, '')

C = textscan(medlineStr_, '%s', 'delimiter', sprintf('\n'), 'bufsize', 90000);
C=C{1,1};
C=C(4:end-1);
for i=1:length(C)
    Cr{i,1}=C{i,1}(1:6);
    Cr{i,2}=C{i,1}(7:end);
    for k=1:10
        Cr{i,2}=regexprep(Cr{i,2}, '  ', ' ');
    end
end



