function [varZ]=solution(nvar,varZ,ncontr,indexvar,matSimp)
    
    for i=1:nvar
        if (indexvar(i)~=0)
            varZ(i)=matSimp{3+indexvar(i),size(matSimp,2)};
        end;
    end;

    disp('La solution optimale est: ');    
    for i=1:nvar
        ch=['x',num2str(i),'= ',num2str(varZ(i))];
        disp(ch);
    end;
    ch=['Z= ',num2str(matSimp{size(matSimp,1)-1,size(matSimp,2)})];
    disp(ch);
    
end