function [cof]=leastSquares(x,y,n)
% leastSauqre: Polynomial Least Squares Fitting via Modified Gauss-Schmidt method.
%              Require Modified Gauss-Schmidt method function 
%
% USAGE
%        least_squares(x, y, m)
%
% INPUT 
%      x: x coordinates
%      y: y coordinates
%      n: The degree of least square polynomial
% OUTPUT 
%      cof: the set of coefficients c0, c1,...,cm for the least-square
%      polynomial
%      Pm(x) = c0 + c1*x + c2*x^2 + ...+ cn*x^n
%
% AUTHOR
%    Wenqiang Feng
%    Department of Mathematics 
%    University of Tennessee at Knoxville
%    E-mail: wfeng@math.utk.edu
%    Date:   9/14/2013

A=MatrixGen(x,n);
cof=GSsolver(A,y);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function A=MatrixGen(x,n)
m=size(x,2);
A=zeros(m,n+1);
for i=1:m
    for j=1:n+1
        A(i,j)=x(i).^(j-1);
    end
end
 
function x=GSsolver(A,b)
[Q,R]=mgschmidt(A);
 x= R\(Q'*b');