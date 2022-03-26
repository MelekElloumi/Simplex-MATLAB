function ok=conditionarret(matSimp)
    ok=0;
    for i=3:size(matSimp,2)
        if(matSimp{size(matSimp,1),i}>0)
            ok=1;
        end;
    end;
end