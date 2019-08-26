--[[----------------------------------------------------------------------------

  Application Name:
  Matrix

  Summary:
  Introduction to Matrix data type

  Description:
  This Sample defines an empty matrix of dimensions NxM, and then sets
  each row, column and/or element separately. The Sample also converts
  a Lua 1D table to a matrix.

  How to Run:
  Starting this sample is possible either by running the app (F5) or
  debugging (F7+F10).

  More Information:
  Tutorial "Algorithms - Data Types".
------------------------------------------------------------------------------]]
assert(Matrix, 'Matrix API not present, check device capabilities')

local function main()
  -- Define the number of rows (N) and columns (M)
  local M = 3
  local N = 3

  --Create an empty matrix NxM
  local matrix = Matrix.create(N, M)
  print('Matrix 1: \n' .. matrix:toString())

  -- Create a column
  local matrix_column = Matrix.create(N, 1)
  -- Set all the columns to value 5
  matrix_column:setAll(5)
  -- Create matrix
  for i = 0, M - 1 do
    matrix:setColumn(i, matrix_column)
  end
  print('Matrix 2: \n' .. matrix:toString())

  -- Create a row
  local matrix_row = Matrix.create(1, M)
  -- Set all the rows to value 3
  matrix_row:setAll(3)
  -- Create matrix
  for i = 0, N - 1 do
    matrix:setRow(i, matrix_row)
  end
  print('Matrix 3: \n' .. matrix:toString())

  -- Set a specific element (e.g. element with index (1,1)) to value 7
  matrix:setValue(1, 1, 7)
  print('Matrix 4: \n' .. matrix:toString())

  -- Convert 1D table to a matrix
  local table1D = {2, 4, 6, 8}
  -- Set number of rows and columns
  local N2 = #table1D / 2
  local M2 = #table1D / 2
  -- Create an empty matrix
  local matrix2 = Matrix.create(N2, M2)
  -- Add values from table to matrix
  matrix2:setValue(0, 0, table1D[1])
  matrix2:setValue(0, 1, table1D[2])
  matrix2:setValue(1, 0, table1D[3])
  matrix2:setValue(1, 1, table1D[4])
  print('Matrix 5: \n' .. matrix2:toString())
end

Script.register('Engine.OnStarted', main)
