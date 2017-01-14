pragma solidity ^0.4.7;
import "./UserDatabase.sol";
contract Loans{
	
	struct Loan{
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
	}
	mapping (uint => Loan) loans;//maps a loan to a loan id
	uint private numLoans;
	/*
		TODO:
		accessor functions for returning the loan data
		interator to return loan data
	*/

	function newLoan(address beneficiary, uint amountRequired, int deadline, uint gracePeriod, uint interestRate) onlyusers returns (uint loanId){
		loanId = uint(sha3(uint(beneficiary) + now));
		Loan l = loans[loanId];
		l.beneficiary = beneficiary;
		l.amountRequired = amountRequired;
		l.deadline = now+deadline;
		l.gracePeriod = gracePeriod;
		l.interestRate = interestRate;
		numLoans++;
	}

	function contribute(uint loanId) onlyowner{
		Loan loan = loans[loanId];
		if(!requiredAmountObtained(loanId)){
			loan.amount+=msg.value;
			loan.lenders[msg.sender] =  true;
		}else{
			msg.sender.send(msg.value);
		}
		loan.numLenders++;
	}

	function requiredAmountObtained(uint loanId) returns bool{

	}

	function 
}