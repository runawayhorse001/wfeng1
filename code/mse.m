function msevalue=mse(original,test)
% mse:  Mean square error algorithm
%
% USAGE
%        mse(original,test)
%
% INPUT 
%     I: original image
%     In: The noised image 
%      
% OUTPUT 
%     msevalue: Mean square error
%
% AUTHOR
%    Wenqiang Feng
%    Department of Mathematics 
%    University of Tennessee at Knoxville
%    E-mail: wfeng@math.utk.edu
%    Date:   4/14/2009
A=double(original);
B=double(test);
[m,n]=size(A);
[m2,n2]=size(B);
if m2~=m||n2~=n
    error('Wrong Image');
end

%Computing MSE
msevalue=0;
for i=1:m
    for j=1:n
        msevalue=msevalue+(A(i,j)-B(i,j))^2;
    end
end
msevalue=msevalue/(m*n);
if msevalue==0
    error('Wrong Image');
end
