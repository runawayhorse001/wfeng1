function a=snr(I,In)
% snr:  Signal noise ratio algorithm
%
% USAGE
%        snr(I,In)
%
% INPUT 
%     I: original image
%     In: The noised image 
%      
% OUTPUT 
%     snr: Signal noise ratio
%
% AUTHOR
%    Wenqiang Feng
%    Department of Mathematics 
%    University of Tennessee at Knoxville
%    E-mail: wfeng@math.utk.edu
%    Date:   9/14/2013

n = I-In; % 
Ps = sum(sum((I -mean(mean(I))).^2)); % �ź�����
Pn = sum(sum(n.^2)); % ��������

a = 10*log10(Ps/Pn); % ���������
