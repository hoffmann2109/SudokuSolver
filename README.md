# Sudoku Solver

This project is a logic programming solution for solving a 9x9 Sudoku puzzle using [Answer Set Programming (ASP)](https://en.wikipedia.org/wiki/Answer_set_programming). The solver takes an initial puzzle configuration as input and applies logic rules to complete the puzzle, ensuring all Sudoku constraints are met.

## Table of Contents

- [Project Structure](#project-structure)
  - [File Descriptions](#file-descriptions)
- [Usage](#usage)
- [Example](#example)
  
## Project Structure

The project consists of two main files:

- **`given.lp`**: Contains the initial known cells of the Sudoku puzzle.
- **`sudoku.lp`**: Defines the rules for solving the puzzle by filling in the remaining cells.

### File Descriptions

- **`given.lp`**: This file specifies the pre-filled cells in the puzzle. For example, `sudoku(4,3,5).` indicates that the cell in row 4, column 3 has a value of 5. Modify this file to provide the initial values of your Sudoku puzzle.
  
- **`sudoku.lp`**: This file contains logic rules to solve the puzzle. It enforces the core Sudoku constraints:
  - Each cell contains exactly one value between 1 and 9.
  - No duplicate values are allowed in any row, column, or 3x3 subgrid.
  - The solution is displayed as facts in the form `sudoku(X, Y, N)`.

## Usage

To solve a Sudoku puzzle:

1. Install an ASP solver such as [clingo](https://potassco.org/clingo/).
2. Set up the initial values in `given.lp`.
3. Run the solver with the following command:

   ```bash
   clingo given.lp sudoku.lp
   ```

4. The output will display the completed Sudoku grid as a list of facts in the form `sudoku(X, Y, N)`.

## Example

An example input `given.lp` might look like this:

```prolog
% known cells in the Sudoku puzzle
sudoku(4,3,5).
sudoku(5,5,6).
% (additional cells as needed) --> a sudoku must have at least 17 initial hints to be solvable unambiguously
```

The solver will produce output like:

```prolog
sudoku(1,1,7).
sudoku(1,2,3).
% other cells filled in by the solver
```

Happy solving!
