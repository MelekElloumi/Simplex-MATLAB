function  [matSimp]=pivotage(nvar,ncontr,pivotent,pivotsort,matSimp)
    matSimp{3+pivotsort,1}=matSimp{1,2+pivotent};
    matSimp{3+pivotsort,2}=matSimp{2,2+pivotent};
    [matVal]=cellversmat(matSimp(4:4+ncontr,3:size(matSimp,2)));
    [matCoef]=cellversmat(matSimp(4:3+ncontr,1));
    pivot=matVal(pivotsort,pivotent);
    for i=1:size(matVal,2)  
         matVal(pivotsort,i)=matVal(pivotsort,i)/pivot;        
    end;
    for i=1:size(matVal,1)-1
        if (i ~= pivotsort)
            k=matVal(i,pivotent);
            for j=1:size(matVal,2)
                matVal(i,j)=matVal(i,j)-k*matVal(pivotsort,j);
            end;
        end;
    end;
    matCoef=matCoef';
    for i=1:size(matVal,2)
        matVal(size(matVal,1),i)=matCoef*matVal(1:size(matVal,1)-1,i);       
    end;
    [matSimp(4:4+ncontr,3:size(matSimp,2))]=matverscell(matVal);
    for i=1:size(matVal,2)-1
        matVal(size(matVal,1),i)=matCoef*matVal(1:size(matVal,1)-1,i); 
        matSimp{size(matSimp,1),2+i}=(matSimp{1,2+i}-matSimp{size(matSimp,1)-1,2+i});
    end;
    disp(matSimp);
end