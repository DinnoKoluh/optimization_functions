function [x_min, iter, error] = multiVarNR(f_handle, x_0, maxIter, eps)
    % [x_min, iter, error] = multiVarNR(f_handle, x_0, maxIter, eps)
    % A function which computes the multidimensional Newton-Raphson algorithm.
    % The function takes a vector of cells of function handlers "f_handle", a vector of initial points "x_0", the maximum number of 
    % iterations "maxIter" and the allowed error "eps".
    % Returns the vector of points of the solution "x_min", the number of executed iterations "iter" and the error "error" at the end of
    % the algorithm.

    iter = maxIter;
    error = 'Error';
    x_min = 'Error';
    x = x_0;

    for i = 1:maxIter 
        if (max(abs(computeHandleFunctions(f_handle, x))) < eps)
            error = max(abs(computeHandleFunctions(f_handle, x)));
            iter = i-1;
            x_min = x;
            break;
        end
    % Racunaj Newton-ov korak
    dx = -inv(jacobian(f_handle, x))*computeHandleFunctions(f_handle, x); 
    % Iteriraj x
    x = x + dx;
    end

    if (i == maxIter) 
        display('Prekoracen maksimalan broj iteracija. Mulitvarijabilni NR metod.');
    end
end