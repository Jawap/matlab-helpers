function [ output_vec ] = image2CppHeader(input_mat)
%PRINT2DASVECTOR matlab to C data layout conversion
%   Input is an input 2D matlab matrix and the output is a row column representation in C array/vector
%   initialisation format, handles complex and real number types
  seperator = ', ';
  [rows cols] = size(input_mat);
  columnCells = cell(rows,1);
  for i=1:rows
    
    input_vector = input_mat(i,:);
    rowString = printAsVector(input_vector, ', ');
    columnCells{i} = rowString;
  
  end
  
  output_vec = ['{' strjoin(columnCells, ',\n') '}'];
end