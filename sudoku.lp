% sudoku.lp - Rules for solving the Sudoku puzzle.

% Define the range for rows, columns, and values (1 through 9).
x(1..9).
y(1..9).
n(1..9).

% Ensure each cell (X, Y) has exactly one value assigned.
{sudoku(X,Y,N) : n(N)} = 1 :- x(X), y(Y).

% Define subgrid/4 to identify 3x3 subgrids within the Sudoku grid.
subgrid(X,Y,A,B) :- x(X), x(A), y(Y), y(B), (X-1)/3 == (A-1)/3, (Y-1)/3 == (B-1)/3.

% Prevent duplicate values in the same column.
:- sudoku(X,Y,N), sudoku(A,Y,N), X != A.

% Prevent duplicate values in the same row.
:- sudoku(X,Y,N), sudoku(X,B,N), Y != B.

% Prevent duplicate values in the same 3x3 subgrid.
:- sudoku(X,Y,V), sudoku(A,B,V), subgrid(X,Y,A,B), X != A, Y != B.

% Show the final solution as sudoku(X,Y,N) facts.
#show sudoku/3.
