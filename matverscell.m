function [cel]=matverscell(mat)

cel=cell(size(mat,1),size(mat,2));
for i=1:size(mat,1)
    for j=1:size(mat,2)
        cel{i,j}=mat(i,j);
    end;
end;
end