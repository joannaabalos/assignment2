% Assignment 2 - Joanna Abalos 100962263
clc
clear
close all

L = 50;
W = 50;
G = sparse(L*W,L*W);
F = zeros(L*W,1);

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
        elseif i == L
            G(n,n) = 1;
            F(n) = 0;
        elseif j == W
            G(n,n) = -3;
            G(n,nxp) = 1;
            %G(n,nyp) = 1;
            G(n,nxm) = 1;
            G(n,nym) = 1;
        elseif j == 1
            G(n,n) = -3;
            G(n,nxp) = 1;
            G(n,nyp) = 1;
            G(n,nxm) = 1;
            %G(n,nym) = 1;
        else
            G(n,nxp) = 1;
            G(n,nyp) = 1;
            G(n,nxm) = 1;
            G(n,nym) = 1;
            G(n,n) = -4;
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

figure(1)
surf(Vmap)
colorbar
title('Part 1a: Voltage Plot')
xlabel('L (m)')
ylabel('W (m)')
zlabel('Voltage (V)')