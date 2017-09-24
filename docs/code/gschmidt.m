function [Q,R]=gschmidt(V)
% gschmidt:  classical Gram-Schmidt algorithm
%
% USAGE
%        gschmidt(V)
%
% INPUT 
%      V: V is an m by n matrix of full rank m<=n
%      
% OUTPUT 
%     Q: an m-by-n matrix with orthonormal columns 
%     R: an n-by-n upper triangular matrix
%
% AUTHOR
%    Wenqiang Feng
%    Department of Mathematics 
%    University of Tennessee at Knoxville
%    E-mail: wfeng@math.utk.edu
%    Date:   9/14/2013

[m,n]=size(V);
Q=zeros(m,n);
R=zeros(n);
R(1,1)=norm(V(:,1));
Q(:,1)=V(:,1)/R(1,1);
for k=2:n
    R(1:k-1,k)=Q(:,1:k-1)'*V(:,k);
    Q(:,k)=V(:,k)-Q(:,1:k-1)*R(1:k-1,k);
    R(k,k)=norm(Q(:,k));
        if R(k,k) == 0
             break;
        end
    Q(:,k)=Q(:,k)/R(k,k);
end