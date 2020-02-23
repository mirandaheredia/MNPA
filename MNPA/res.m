function res(n1,n2,val)

g = 1/val;
%Define global variable
global G;

if(n1~=0)
    G(n1,n1) = G(n1,n1) + g;
end

if (n2~=0)
    G(n2,n2) = G(n2, n2) + g;
end

if (n1~=0) && (n2~=0)
    G(n1, n2) = G(n1, n2) - g;
    G(n2, n1) = G(n2, n1) - g;
end
