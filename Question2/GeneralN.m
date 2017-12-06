close all
clear variables
clc
N= 40 %This is the variable we want to change, you can change this value to anything and receive the corresponding A and B matrix and vector
M=(N-1)^2
L= N-1
 
A=zeros(M,M)

%Below is the code for a general A matrix%
A(1:M+1:end)=-4 %get's the diagonal -4's
A(N:M+1:(M+1)*(M-L))=1 %fills in the diagonal of 1's below the -4's. Always starts a linear index (N) 
A(2:M+1:end)=1 %Initially fills in diagonal below -4 with 1's
A(2+(M+1)*(L-1) :(M+1)*L:end) = 0 %I found that the distance between the 0's is L, this fills those indices with 0
A(M+1:M+1: end) = 1 %Initially fills in diagonal above -4 with 1's
A((M+1)+(M+1)*(L-1) : (M+1)*L:end) = 0 %same as 2 lines above
A((M+1)+(M*1)*(N-2):M+1:end)=1 %Found that the starting position of the diagonal of 1's is always N in both directions, linear indexing to find that starting point
 
%Below is the code for creating a general b vector%

%Assign rows and columns
B=[1:M] 
B(1:M)=0 %creates zero vector, there was probably a better way of doing this but I couldn't figure it out
B(1:1:L) = -90 % First row filled with boundary condition
B(1:L:end) = 0 % First Column filled with b/c -- kinda redundant now that I think about it
B((L)*(L-1)+1:1:end) = -30 % Last Row filled with b/c
B(L:L:end) = -60  %Last Column filled with b/c

%Assign Corners
B(1) = -90
B(L) = -150
B(L^2) = -90
B((L^2)-(L-1)) = -30

C = transpose(B)

u=inv(A)*C

p=reshape(u,L,L)

NewMatrix = zeros(L+2,L+2)
NewMatrix(2:(L+1),2:(L+1))=p

NewMatrix(1:L+2,L+2)=30
NewMatrix(L+2,1:L+2)=60
NewMatrix(1:L+2,1)=90

New = transpose(NewMatrix)

surf(New)
colormap(cool)


