function [ result ] = func_objValue( pop )

objValue =  sum(pop.^2,2);
result = objValue ;

end

