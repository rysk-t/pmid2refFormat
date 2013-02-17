function [Citation] = pmid2JNS(pmid)
%%
bufCell=pmid2medlineCell(pmid);
%% JNS—p

ROIcitation={'AU' 'DP' 'TI' 'TA' 'VI' 'IP' 'PG'}
for i=1:length(ROIcitation)
    eval(['Cell.' ROIcitation{i} '=strfind(bufCell, '''  ROIcitation{i} ''' )'])
    eval([ROIcitation{i} '=' '[]'])
end
Authors=[];
for i=1:length(bufCell)
    if(Cell.AU{i,1}==1)
      Authors=[Authors ', ' bufCell{i,2}];
    end
    
    
    if(Cell.DP{i,1}==1)
        DP=bufCell{i,2}(1:4);
    elseif(Cell.TI{i,1}==1)
        TI=bufCell{i,2};
    elseif(Cell.TA{i,1}==1)
        TA=bufCell{i,2};
        pause(1)
    elseif(Cell.VI{i,1}==1)
        VI=bufCell{i,2};
    elseif(Cell.IP{i,1}==1)
        IP=['(' bufCell{i,2} ')'];
    elseif(Cell.PG{i,1}==1)
        PG=[':' bufCell{i,2}];
    end
end
Authors(1:2)=[];

%%
Citation = [Authors '. (' DP ') ' TI ' ' TA ' ' VI IP PG '.'];