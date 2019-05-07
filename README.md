# WWU-CSCI301-Assign1

Program 1

 

Program 1 should be developed in three stages. The final objective is to create a function that will find primes of the form 4n + 1 and show the prime and the two unique squares that sum to that prime.

 

Stage 1. The first step is to create a function that will produce numbers of the form 4n + 1

Stage 2. Call the function from stage 1 and return to ones that are primes.

Stage 3. Take the primes produced by the function in stage 2 and determine the two squares that sum to the prime of the form 4n + 1

 

The program should read a file named “range” which specifies two numbers defining the beginning and ending values for the range of numbers to investigate. The program should write the results as a series of lines into a file call primes4np1.

 

For examples if the input file range contained

 

2 30

 

The output file primes4np1 would contain

 

5 1 2

13 2 3

17 1 4

29 2 5

 

Notice that the smaller of the two numbers that when squared sum to the prime should appear as the first of the two numbers.

 

You should place your program into a file named 4np1.rkt

 

Do not use any imperative features of Scheme (no ! or :=)

 

It would probably be a go idea to place a line at the beginning of your program like

 

#lang R5RS

 

Your programs will be processed for grading by an automated script. This means you must conform exactly to all the file naming requirements and formats. Failure to conform to the naming and formatting requirements will result in a loss of points.
