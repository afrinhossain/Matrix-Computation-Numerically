function [P,L,U] = LUdecom(A)
    n = size(A,1);
    P = eye(n);
    
    if (n == 1)
        %base case
        P =1;
        L = 1;
        U = A;
    else
        %find P s.t P'A_{1,1} != 0
        %find a row for whose first element's absolute value is the largest
        %=> and swap the first row with that row
        
        [maxVal, maxInd] = max(abs(A(1:n,1)));
        P([1 maxInd], :)= P([maxInd 1],:); %swap
        P = P';
        
        %split into blocks
        PA = P'*A;
        a11 = PA(1,1);
        a12= PA(1,2:n);
        a21= PA(2:n,1);
       
        
        %compute elimination matrix
        E = [1 zeros(1,n-1); -a21/a11 eye(n-1)];
        EPA = E*PA;
        
        %A2 = EPA(2:n,2:n)
        [P2,L2,U2] = LUdecom(EPA(2:n,2:n));
        
        %build permutaion matrix recursively
        P=P*[1 zeros(1,n-1); zeros(1,n-1)' P2];
        
        %auxiliary parameters for rebuildinf
        PA = P'*A;
        a11 = PA(1,1);
        a12= PA(1,2:n);
        a21= PA(2:n,1);
        
        %build matrices L, U recursively
        L = [1 zeros(1,n-1); a21/a11 L2];
        U = [a11 a12; zeros(1,n-1)' U2];
   
    end

end

%Testing
%A = rand(5,5);
%[P,L,U] = LUdecom(A);
%[A P*L*U]
%