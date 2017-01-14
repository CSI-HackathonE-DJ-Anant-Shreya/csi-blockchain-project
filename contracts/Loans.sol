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
		mapping (address => bool) lenders;
	}
	mapping (uint => Loan) loans;//maps a loan to a loan id

	function newLoan(address beneficiary, uint amountRequired, int deadline, uint gracePeriod, uint interestRate) onlyusers returns (uint loanId){
		loanId = uint(sha3(uint(beneficiary) + now));
		Loan l = loans[loanId];
		l.beneficiary = beneficiary;
		l.amountRequired = amountRequired;
		l.deadline = now+deadline;
		l.gracePeriod = gracePeriod;
		l.interestRate = interestRate;
	}

	function contribute(uint LoanId) onlyowner{
		Loan loan = loans[LoanId];
		loan.amount+=msg.value;
		loan.lenders[msg.sender] =  true;
		loan.numLenders++;
		if(num.repaid)
	}
}