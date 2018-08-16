/*
 * Prompt user for two integers and print their sum, difference, product and quotient
 * (IntegerArithmetic.cpp)
 */
#include <iostream>
using namespace std;
 
int main() {
   int firstInt;  // Declare a variable named firstInt of the type int (integer)
   int secondInt; // Declare a variable named secondInt of the type int
   int sum, difference, product, quotient;
                  // Declare 4 variables of the type int to keep the results
 
   cout << "Enter first integer: ";   // Display a prompting message
   cin >> firstInt;                   // Read input from keyboard (cin) into firstInt
   cout << "Enter second integer: ";  // Display a prompting message
   cin >> secondInt;                  // Read input into secondInt
 
   // Perform arithmetic operations
   sum        = firstInt + secondInt;
   difference = firstInt - secondInt;
   product    = firstInt * secondInt;
   quotient   = firstInt / secondInt;
 
   // Print the results
   cout << "The sum is: " << sum << endl;
   cout << "The difference is: " << difference << endl;
   cout << "The product is: " << product << endl;
   cout << "The quotient is: " << quotient << endl;
 
   return 0;
}