% Travail fait par Melek Elloumi GL3
% algorithme de simplex g�n�ral pour un probl�me de maximisation
% respecter les consignes (il n'y a pas de contr�le sur les donn�es
function simplex()
%initialisation du syst�me
[nvar,ncontr,coefZ,varZ,indexvar,matSimp]=initialiser();
%pivot du tableau initial
[pivotent,pivotsort,indexvar]=pivot(nvar,ncontr,indexvar,matSimp);
%algorithme du simplex
i=2; ok=1;
while (ok==1)
    ch=['Tableau num�ro ',num2str(i),': '];
    disp(ch);
    [matSimp]=pivotage(nvar,ncontr,pivotent,pivotsort,matSimp);
    ok=conditionarret(matSimp);
    if(ok==1)
      [pivotent,pivotsort,indexvar]=pivot(nvar,ncontr,indexvar,matSimp);  
    end;
    i=i+1;
end;
%Resultats
[varZ]=solution(nvar,varZ,ncontr,indexvar,matSimp);
end
