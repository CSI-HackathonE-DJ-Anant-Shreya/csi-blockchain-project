pragma solidity ^0.4.7;

library LoansLib{
	struct Loan{
		string title;
		string appeal;
		address beneficiary;
		uint amountRequired;
		uint numLenders;
		uint amount;
		uint deadline;
		uint returnPeriod;
		uint gracePeriod;
		uint interestRate;
		uint repaid;
		mapping (address => uint) amountSpent;
		address[] lenders;
	}
	mapping (uint => Loan) loans;
	uint[] loanIds;
	mapping (uint => uint) private loanIdIndexes;
}
