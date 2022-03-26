function [mat]=cellversmat(cel)
mat=zeros(size(cel,1),size(cel,2));
for i=1:size(cel,1)
    for j=1:size(cel,2)
        mat(i,j)=cel{i,j};
    end;
end;
end