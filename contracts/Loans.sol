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
		address lenders[];
	}
	mapping (uint => Loan) loans;//maps a loanid to a loan
	uint loanIds[];
	/*
		TODO:
		accessor functions for returning the loan data
		interator to return loan data
	*/

	function getLoanFundraiserData(uint loanId) onlyusers returns (address ben, uint amtreq, int deadline){
		Loan loan = loans[loanId];
		ben = loan.beneficiary;
		amtreq = loan.amountRequired;
		deadline = loan.deadline;
		rate = loan.interestRate;
	}

	function getReturnedLoanData(uint loanId) onlyusers returns (address ben, uint amtraised, uint amtpaid, uint rate){

	}

	function newLoan(address beneficiary, uint amountRequired, int deadline, uint gracePeriod, uint interestRate) onlyusers returns (uint loanId){
		loanId = uint(sha3(uint(beneficiary) + now));
		Loan l = loans[loanId];
		l.beneficiary = beneficiary;
		l.amountRequired = amountRequired;
		l.deadline = now+deadline;
		l.gracePeriod = gracePeriod;
		l.interestRate = interestRate;
		loanIds.push(loanId);
	}

	function contribute(uint loanId) onlyowner{
		Loan loan = loans[loanId];
		if(!requiredAmountObtained(loanId) && ){
			loan.amount+=msg.value;
			loan.beneficiary.send(msg.value);
			loan.lenders[msg.sender] =  true;
			loan.numLenders++;
		}else{
			msg.sender.send(msg.value);
		}		
	}

	function requiredAmountObtained(uint loanId) returns bool{
		
	}

	function 
}