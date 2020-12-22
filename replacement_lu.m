function [U_new, L_new] = replacement_lu(U, i, j, s, L)
    U_new = U;
    U_new(i,:) = U(i,:) - s * U(j,:);
    L_new = L;
    L_new(i,j) = s;
end