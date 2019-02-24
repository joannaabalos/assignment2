function current = assignment22b(setscale)
% Assignment 2 - Joanna Abalos 100962263
L = 30;
W = L*2/3;
G = sparse(L*W,L*W);
F = zeros(L*W,1);

scale = 1/setscale;
scaleA = scale^2;
scaleL = L*setscale;
scaleW = W*setscale;

sOut = 1;
sIn = 10^-2;

midX = L/2;
midY = W/2;
boxL = L/4;
boxW = W*2/3;
leftBound = midX - boxL/2;
rightBound = midX + boxL/2;
topBound = midY + boxW/2;
bottomBound = midY - boxW/2;

for i = 1:scaleL
    for j = 1:scaleW
        n = j + (i-1)*scaleW;
        nxm = j+(i-2)*scaleW;
        nxp = j+i*scaleW;
        nyp = j+1+ (i-1)*scaleW;
        nym = j-1+ (i-1)*scaleW;
        if i == 1
            G(n,n) = 1/scaleA;
            F(n) = 1;
            sMap(i,j) = sOut;
        elseif i == scaleL
            G(n,n) = 1/scaleA;
            F(n) = 0;
            sMap(i,j) = sOut;
        elseif (j == scaleW)
            G(n,n) = -3/scaleA;
            if(i/setscale>leftBound && i/setscale<rightBound)
                G(n,nxm) = sIn/scaleA;
                G(n,nxp) = sIn/scaleA;
                G(n,nym) = sIn/scaleA;
                sMap(i,j) = sIn;
            else
                G(n,nxm) = sOut/scaleA;
                G(n,nxp) = sOut/scaleA;
                G(n,nym) = sOut/scaleA;
                sMap(i,j) = sOut;
            end
        elseif (j == 1)
            G(n,n) = -3/scaleA;
            if(i/setscale>leftBound && i/setscale<rightBound)
                G(n,nxm) = sIn/scaleA;
                G(n,nxp) = sIn/scaleA;
                G(n,nyp) = sIn/scaleA;
                sMap(i,j) = sIn;
            else
                G(n,nxm) = sOut/scaleA;
                G(n,nxp) = sOut/scaleA;
                G(n,nyp) = sOut/scaleA;
                sMap(i,j) = sOut;
            end
        else
            G(n,n) = -4/scaleA;
            if( (j/setscale>topBound || j/setscale<bottomBound) && i/setscale>leftBound && i/setscale<rightBound)
                G(n,nxp) = sIn/scaleA;
                G(n,nxm) = sIn/scaleA;
                G(n,nyp) = sIn/scaleA;
                G(n,nym) = sIn/scaleA;
                sMap(i,j) = sIn;
            else
                G(n,nxp) = sOut/scaleA;
                G(n,nxm) = sOut/scaleA;
                G(n,nyp) = sOut/scaleA;
                G(n,nym) = sOut/scaleA;
                sMap(i,j) = sOut;
            end
        end
    end
end

V = G\F;

Vmap = zeros(scaleL,scaleW);
for i = 1:scaleL
    for j = 1:scaleW
        n = j + (i-1)*scaleW;
        Vmap(i,j) = V(n);
    end
end

[Ey,Ex] = gradient(Vmap);
E = gradient(Vmap);
J = sMap.* E;

region = L*W;
current = (sum(sum(J))/(scaleL*scaleW))/region;

end