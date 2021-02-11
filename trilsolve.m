function x = trilsolve(L,b)
n = size(L,1);

if(n == 1)
    x = b/L;
else
% Define matrix and vector blocks.
    L22 = L(2:n,2:n);
    l11 = L(1,1);
    l21 = L(2:n,1);

    b1 = b(1);
    b2 = b(2:n);

% solve x1.
    x(1) = b1/l11;

% solve x2 using recursive function call.
    x(2:n) = trilsolve(L22,b2-l21*x(1));
end

end

%
% Testing:
% L = tril(rand(499,499));
% b = rand(499,1);
% [L\b trilsolve(L,b)']
% tic;L\b;toc;
% tic;trilsolve(L,b)';toc;

