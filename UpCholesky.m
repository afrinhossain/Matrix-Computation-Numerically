function L = UpCholesky(A)
  
    N=size(A,1);
    L = zeros(N,N);

    for n = 1:N
            a11 = sqrt(A(n,n));
            a21= A(n+1:end,n)/a11;
            

            L(n,n)= a11;
            L(n+1:end,n)= a21;
           
            A((n+1):end, (n+1):end) = A((n+1):end, (n+1):end) - (a21*a21');
    end

end


%Testing
%   Make a random n x n positive definite symmetric matrix
%   n = 5;
%   A = rand(n,n);
%   A = A*A';
%   A = A + n*eye(n);

%Cholesky decomp
%   L = UpCholesky(A);
%   norm(chol(A,'lower')-L)
%