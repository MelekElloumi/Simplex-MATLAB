function [nvar,ncontr,coefZ,varZ,indexvar,matSimp]=initialiser()
nvar=input('Donner le nombre de variables: ');
ncontr=input('Donner le nombre des contraintes: ');
varZ = zeros(1,nvar);
coefZ = zeros(1,nvar);
indexvar = zeros(1,nvar);
for i=1:nvar
    ch=['Dans Z, donner c',num2str(i),' le coefficient de x',num2str(i),' : '];
    coefZ(i)=input(ch);
end;
matSimp=cell(5+ncontr,3+nvar+ncontr);
matSimp{1,1}='Coeff dans Z';
matSimp{1,2}=' ';
matSimp{2,1}='Base';
matSimp{2,2}=' ';
matSimp{3,1}='Coeff Z';
matSimp{3,2}='Var Base';
matSimp{size(matSimp,1)-1,1}='Zj';
matSimp{size(matSimp,1)-1,2}='';
matSimp{size(matSimp,1),1}='Cj-Zj';
matSimp{size(matSimp,1),2}='';
matSimp{size(matSimp,1),size(matSimp,2)}='';
for i=1:ncontr
    ch=['e',num2str(i)];
    matSimp{3+i,2}=ch;
    matSimp{3+i,1}=0;
    
    matSimp{2,2+nvar+i}=ch;
    matSimp{1,2+nvar+i}=0; 
    matSimp{size(matSimp,1),2+nvar+i}=0;
    matSimp{3,2+nvar+i}='';
end;
for i=1:nvar
    ch=['x',num2str(i)];
    matSimp{2,2+i}=ch;
    matSimp{1,2+i}=coefZ(i);  
    matSimp{size(matSimp,1),2+i}=coefZ(i);
    matSimp{3,2+i}='';
end;
matSimp{2,size(matSimp,2)}='bj';
matSimp{1,size(matSimp,2)}='';
matSimp{3,size(matSimp,2)}='';
matVal=zeros(1+ncontr,nvar+ncontr+1);
matVal(1:ncontr,nvar+1:nvar+ncontr)=eye(ncontr);
for i=1:ncontr
    ch=['Pour la contrainte numéro ',num2str(i),' : '];
    disp(ch);
    for j=1:nvar
    ch=['Donner c',num2str(j),' le coefficient de x',num2str(j),' : '];
    matVal(i,j)=input(ch);
    end;
    ch=['Donner b',num2str(i),' la valeur supérieure de cette contrainte : '];
    matVal(i,size(matVal,2))=input(ch);
end;    
[matSimp(4:4+ncontr,3:size(matSimp,2))]=matverscell(matVal);
disp('Tableau initial: ');
disp(matSimp);
end