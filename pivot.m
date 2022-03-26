function [pivotent,pivotsort,indexvar]=pivot(nvar,ncontr,indexvar,matSimp)
pivotent=0;
maxcj=0;
for i=1:nvar+ncontr
    x=matSimp{size(matSimp,1),2+i};
    if (x>maxcj)
        maxcj=x;
        pivotent=i;
    end;
end;
ch=[matSimp{2,2+pivotent},': variable entrante'];
disp(ch);

minbj=Inf;
pivotsort=0;
for i=1:ncontr
    x=matSimp{3+i,size(matSimp,2)}/matSimp{3+i,2+pivotent};
    if (x<minbj && x>0)
        minbj=x;
        pivotsort=i;
    end;
end; 
ch=[matSimp{3+pivotsort,2},': variable sortante'];
disp(ch);
ch=[num2str(matSimp{3+pivotsort,2+pivotent}),': pivot'];
disp(ch);
if (pivotent<=nvar)
    indexvar(pivotent)=pivotsort;
else
    ind=find(indexvar==pivotsort,1);
    if (~isempty(ind))
        indexvar(ind)=0;
    end;
end;

end