function output = find_inverse(A)
    [m, n] = size(A);
    if m ~= n
        output = false;
    else
        I = eye(m,n);
        k = 1;
        l = 1;
        while k <= m && l <= n 
            p = k;
            for i = k:m
                if abs(A(i, l)) > abs(A(p, l))
                    p = i;
                end
            end
            
            A([k p], l:n) = A([p k], l:n);
            I([k p], l:n) = I([p k], l:n);
            
            if abs(A(k, l)) < 10^(-12)
                l = l + 1;
            else
                I(k, :) = (1 / A(k,l)) * I(k,:);
                A(k, :) = (1 / A(k,l)) * A(k,:);
                for i = 1:k-1
                    I(i, :) = I(i, :) - (A(i,l) / A(k, l)) * I(k, :); 
                    A(i, :) = A(i, :) - (A(i,l) / A(k, l)) * A(k, :); 
                end
                for i = k+1:m
                    I(i, :) = I(i, :) - (A(i,l) / A(k, l)) * I(k, :); 
                    A(i, :) = A(i, :) - (A(i,l) / A(k, l)) * A(k, :); 
                end
                k = k + 1;
                l = l + 1;
            end
        end
        
        if sum(abs(A - eye(m,n))) < 10^(-12)
            output = I;
        else
            output = false;
        end

    end
end