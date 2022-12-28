function [ nestPop ] = func_newBuildNest( nestPop ,Pa ,Xmax,Xmin)
[N,D] = size(nestPop) ;
nestPop = nestPop+rand.*heaviside(rand(N,D)-Pa).*(nestPop(randperm(N),:)-nestPop(randperm(N),:));
% Deal with bounds
nestPop(find(nestPop>Xmax)) = Xmax ; %#ok<*FNDSB>
nestPop(find(nestPop<Xmin)) = Xmin ;
end
