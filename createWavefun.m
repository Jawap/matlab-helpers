function output = createWavefun(filter,level)

% filter = 'bior3.3';
% level = 2;
[phi,~,~,~,~] = wavefun(filter,level);

output = ['{"'  filter  '" ,'   printAsVector(phi, ', ')  '}'];
disp(output);
end