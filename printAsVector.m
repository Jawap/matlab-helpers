function [ output_args ] = printAsVector( input_vector, seperator, forceComplex)
%PRINTASVECTOR matlab to C data layout conversion
%   Input is an input 1D matlab vector and the output is a C array/vector
%   initialisation format, handles complex and real number types
  if nargin == 2
    forceComplex = ~isreal(input_vector);
  end
  if nargin == 1
    verticalVector =   ',';
    forceComplex = ~isreal(input_vector);
  end
  
  
  
  valueCells = cell(size(input_vector));
  if forceComplex
    realPart = real(input_vector);
    imagPart = imag(input_vector);
    for i = 1:length(input_vector)
      valueCells(i) = {['std::complex<double>(' num2str(realPart(i)) ', ' num2str(imagPart(i)) ')']};
    end
 
  else
    valueCells = strread(num2str(input_vector),'%s');
  end
  
  output_args = ['{' strjoin(valueCells, seperator) '}'];

end

