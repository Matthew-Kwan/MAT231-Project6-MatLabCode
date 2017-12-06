close all
clear variables
clc
N= 40 %This is the variable we want to change
M=(N-1)^2
L= N-1
 
A=zeros(M,M)

%Below is the code for a general A matrix%
A(1:M+1:end)=-4 
A(N:M+1:(M+1)*(M-L))=1
A(2:M+1:end)=1
A(2+(M+1)*(L-1) :(M+1)*L:end) = 0
A(M+1:M+1: end) = 1
A((M+1)+(M+1)*(L-1) : (M+1)*L:end) = 0
A((M+1)+(M*1)*(N-2):M+1:end)=1

%Below is the code for creating a general b vector%

%Assign rows and columns
B=[1:M]
B(1:M)=0
B(1:1:L) = -90
B(1:L:end) = 0
B((L)*(L-1)+1:1:end) = -30
B(L:L:end) = -60 

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


