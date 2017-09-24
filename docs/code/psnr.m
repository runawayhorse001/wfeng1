
function [psnrvalue,snrvalue]=psnr(original,test)
% psnr:  Peak signal noise ratio algorithm
%
% USAGE
%        psnr(I,In)
%
% INPUT 
%     original: original image
%     test: The noised image 
%      
% OUTPUT 
%     psnrvalue: Signal noise ratio
%     snrvalue: Peak signal noise ratio
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

signal=0;
for i=1:m
    for j=1:n
        signal=signal+A(i,j)^2;
    end
end
signal=signal/(m*n);
snrvalue=signal/msevalue;
snrvalue=10*log10(snrvalue);
psnrvalue=255^2/msevalue;
psnrvalue=10*log10(psnrvalue);