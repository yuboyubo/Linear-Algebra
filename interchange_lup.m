function [U_new, L_new, P_new] = interchange_lup(U, i, j, L, P)
    U([i j], :) = U([j, i], :);
    U_new = U;     
    
    L([i j], 1:i-1) = L([j, i], 1:i-1);
    L_new = L;
    
    P([i j], :) = P([j, i], :);
    P_new = P; 
end