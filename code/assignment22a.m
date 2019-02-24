% Assignment 2 - Joanna Abalos 100962263
L = 30;
W = L*2/3;
G = sparse(L*W,L*W);
F = zeros(L*W,1);

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

for i = 1:L
    for j = 1:W
        n = j + (i-1)*W;
        nxm = j+(i-2)*W;
        nxp = j+i*W;
        nyp = j+1+ (i-1)*W;
        nym = j-1+ (i-1)*W;
        if i == 1
            G(n,n) = 1;
            F(n) = 1;
            sMap(i,j) = sOut;
        elseif i == L
            G(n,n) = 1;
            F(n) = 0;
            sMap(i,j) = sOut;
        elseif (j == W)
            G(n,n) = -3;
            if(i>leftBound && i<rightBound)
                G(n,nxm) = sIn;
                G(n,nxp) = sIn;
                G(n,nym) = sIn;
                sMap(i,j) = sIn;
            else
                G(n,nxm) = sOut;
                G(n,nxp) = sOut;
                G(n,nym) = sOut;
                sMap(i,j) = sOut;
            end
        elseif (j == 1)
            G(n,n) = -3;
            if(i>leftBound && i<rightBound)
                G(n,nxm) = sIn;
                G(n,nxp) = sIn;
                G(n,nyp) = sIn;
                sMap(i,j) = sIn;
            else
                G(n,nxm) = sOut;
                G(n,nxp) = sOut;
                G(n,nyp) = sOut;
                sMap(i,j) = sOut;
            end
        else
            G(n,n) = -4;
            if( (j>topBound || j<bottomBound) && i>leftBound && i<rightBound)
                G(n,nxp) = sIn;
                G(n,nxm) = sIn;
                G(n,nyp) = sIn;
                G(n,nym) = sIn;
                sMap(i,j) = sIn;
            else
                G(n,nxp) = sOut;
                G(n,nxm) = sOut;
                G(n,nyp) = sOut;
                G(n,nym) = sOut;
                sMap(i,j) = sOut;
            end
        end
    end
end

V = G\F;

Vmap = zeros(L,W);
for i = 1:L
    for j = 1:W
        n = j + (i-1)*W;
        Vmap(i,j) = V(n);
    end
end

[Ey,Ex] = gradient(Vmap);
E = gradient(Vmap);
J = sMap.* E;

figure(3)
subplot(2,3,1)
surf(sMap)
colorbar
title('Sigma Charge Density Plot')
xlabel('L (m)')
ylabel('W (m)')
zlabel('Charge Density (C/m)')

subplot(2,3,2)
surf(Vmap)
colorbar
title('Voltage Plot')
xlabel('L (m)')
ylabel('W (m)')
zlabel('Voltage (V)')

subplot(2,3,3)
surf(Ex)
colorbar
title('x Electric Field Plot')
xlabel('L (m)')
ylabel('W (m)')
zlabel('Electric Field (V/m)')

subplot(2,3,4)
surf(Ey)
colorbar
title('y Electric Field Plot')
xlabel('L (m)')
ylabel('W (m)')
zlabel('Electric Field (V/m)')

subplot(2,3,5)
surf(J)
colorbar
title('Current Density')
xlabel('L (m)')
ylabel('W (m)')
zlabel('Current Density (A/m^2)')