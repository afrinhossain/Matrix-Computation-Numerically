function [L] = cholesky(A)
    n = size(A,1);
    
    
    if (n == 1)
        %base case
        L = sqrt(A);
    else
        %split into blocks
        a11 = A(1,1);
        a21= A(2:n,1);
        A22= A(2:n,2:n);
       
        %recursice call
        L2 = cholesky(A22-(a21*a21')/a11);
        
        %auxiliary parameters for rebuilding
        a11 = A(1,1);
        a21= A(2:n,1);
        
        
        %build matrix L recursively
        L = [sqrt(a11) zeros(1,n-1); (a21/sqrt(a11)) L2];
        
   
    end

end

%Testing
%   Make a random n x n positive definite symmetric matrix
%   n = 5;
%   A = rand(n,n);
%   A = A*A';
%   A = A + n*eye(n);
%Cholesky decomp
%   L = cholesky(A);
%   norm(chol(A,'lower')-L)