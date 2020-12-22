function [L, U, P] = my_lup(A)
    n = size(A, 2);
    L = eye(n,n);
    P = eye(n,n);
    U = A;
    for i = 1:n-1
        j = i;
        for k = i:n
            if abs(U(k, i)) > abs(U(j, i))
                j = k;
            end
        end

        [U,L,P] = interchange_lup(U,i,j,L,P);
  
        if abs(U(i,i)) < 10^(-12)
            break;
        end
        for k = i+1:n
            p = U(k,i) / U(i,i);
            [U, L] = replacement_lu(U, k, i, p, L);
        end
    end
end