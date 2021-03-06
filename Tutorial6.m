A=[-4,1,0,1,0,0,0,0,0;1,-4,1,0,1,0,0,0,0;0,1,-4,0,0,1,0,0,0;1,0,0,-4,1,0,1,0,0;0,1,0,1,-4,1,0,1,0;0,0,1,0,1,-4,0,0,1;0,0,0,1,0,0,-4,1,0;0,0,0,0,1,0,1,-4,1;0,0,0,0,0,1,0,1,-4];
b=[-90;-90;-150;0;0;-60;-30;-30;-90];
u=A\b;
reshape(u,3,3); %matrix gets redefined to ans
matrix=zeros(5,5);
matrix(2:4,2:4)=ans;
matrix(2:4,2:4)=ans'; %transposes the matrix
matrix(1,1:5)=90;
matrix(1:5,5)=60;
matrix(5,1:5)=30;

%averaging corners
matrix(1,1)=45;
matrix(1,5)= 75;
matrix(5,1) = 15;
matrix(5,5) = 45;


surf(matrix);
colormap(cool);

