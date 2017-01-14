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
	mapping (uint => uint) private loanIdIndexes;
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

	function getReturningLoanData(uint loanId) onlyusers returns (address ben, uint amtraised, uint amtpaid, uint rate){
		Loan l = loans[loanId];
		ben = l.beneficiary;
		amtraised = l.amount;
		amtraised = l.repaid;
		rate = l.interestRate;

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

	function contribute(uint loanId) onlyusers{
		Loan loan = loans[loanId];
		if(!requiredAmountObtained(loanId) && !loan.deadline <= now){
			loan.amount+=msg.value;
			loan.beneficiary.send(msg.value);
			loan.lenders[msg.sender] =  true;
			loan.numLenders++;
		}else{
			msg.sender.send(msg.value);
		}
		if(loan.deadline <= now){
			refundMoney(loanId);
			loans[loanId] = 0;
		}		
	}

	function requiredAmountObtained(uint loanId) returns bool{
		Loan l = loans[loanId];
		return (l.amount >= l.amountRequired);
	}

	function refundMoney(uint loanId) onlyusers{
		Loan l = loans[loanId];
		if(loan.deadline >= now){

		}else{
			throw1
		}
	}
}