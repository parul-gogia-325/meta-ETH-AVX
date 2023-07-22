/*
Functionality
Contract successfully uses require()
Contract successfully uses assert()
Contract successfully uses revert() statements
*/


require() function - The require function should be used to ensure valid conditions, such as inputs,
or contract state variables are met, or to validate return values from calls to external contracts.

-----------------------------------------------------------------------------------------------------------------------------------

assert() Function
An assert guard triggers when an assertion fails - such as an invariant property changing. 
For example, the token to ether issuance ratio, in a token issuance contract, may be fixed.
You can verify that this is the case at all times with an assert(). Assert guards should often be combined with other techniques,
such as pausing the contract and allowing upgrades. (Otherwise, you may end up stuck, with an assertion that is always failing.)- 

-----------------------------------------------------------------------------------------------------------------------------------

assert(): The assert() function should be used when you want to check for invariants in the code.
When any invariant is incorrect, the code execution stops, transaction fails, and contract state changes are reverted. 
This function should only be used for invariant checking. It should not be used for input validation or pre-condition checking.

require(): The require() function should be used when you want to validate the arguments provided to the function.
It is also used to check for the valid conditions and variable values to be in ...
