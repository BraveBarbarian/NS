function y = si(x)
    y = zeros(size(x)); 
    y(x == 0) = 1; 
    y(x ~= 0) = sin(x(x ~= 0)) ./ x(x ~= 0); 
end