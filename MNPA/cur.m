function cur (n1, n2, val)

global  b;

if(n1~=0) && (n2==0)
    b(n1) = b(n1) +val;
    b(n2) = 0;
end

if (n1==0) && (n2~=0)
    b(n1) = 0;
    b(n2) = b(n2) + val;
end

if(n1~=0)&& (n2~=0)
    b(n1) = b(n1) + val;
    b(n2) = b(n2) - val;
end