* Read the manual page for a unix command with man or woman.
  What command did you read about? What does it do?
  Bonus: Do a command we didn't cover in class.

* Have a look on Ruby Doc at the methods defined on strings and symbols.
  Describe 2 methods that strings have but symbols don't and vice versa.
  Pick a method defined on the Enumerable class (arrays, etc). What does
  it do and when might you use it?

* Write a ruby script to play the number guessing game.

## Number Guessing Game

Create a number guessing game. Game should pick a random number
between 1 and 100 and ask you for a guess. If the guess is less than
the number, inform the user and let them guess again. If the guess is
greater than the number, inform the user and let them guess again. If
the guess is correct, inform the user.

Hint 1: Use .to_i to convert user input to a number. What is it by default?

Hint 2: Use rand(number) to get a random number between 0 and number.
