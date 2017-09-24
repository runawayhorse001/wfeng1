function [Q,R]=mgschmidt(V)
% mgschmidt:   Modified Gram-Schmidt algorithm
%
% USAGE
%        mgschmidt(V)
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

for k=1:n
    R(k,k)=norm(V(:,k));
        if R(k,k) == 0
             break;
        end
    Q(:,k)=V(:,k)/R(k,k);
        for j=k+1:n
            R(k,j)=Q(:, k)'* V(:,j);
            V(:, j) = V(:, j)-R(k, j) * Q(:,k);
        end   
end