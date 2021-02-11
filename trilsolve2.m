function x = trilsolve2(L,b)
N = size(L,1);
x = zeros(N,1);


for n = 1:N
    if(n == N)
        x(N) = b(N)/L(N,N);
    else
    % Define matrix and vector blocks.
       
        l11 = L(n,n);
        l21 = L(n+1:N,n);

        b1 = b(n);
        b2 = b(n+1:N);

    % solve x1.
        x(n,1) = b1/l11;
        
    % update b
       b(n+1:N) = b2 - l21*x(n,1);
    end
end 

%
% Testing:
% L = tril(rand(499,499));
% b = rand(499,1);
% [L\b trilsolve2(L,b)']
% tic;L\b;toc;
% tic;trilsolve2(L,b)';toc;

