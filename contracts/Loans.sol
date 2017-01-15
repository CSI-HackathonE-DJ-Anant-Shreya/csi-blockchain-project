pragma solidity ^0.4.7;
import "./UserDatabase.sol";
import LoansLib.Loan as Loan from "./LoansLib.sol";
import LoansLib.loans as loans from "./LoansLib.sol";
import LoansLib.loanIds as loanIds from "./LoansLib.sol";

contract Loans{
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

	function newLoan(string title, string appeal, uint amountRequired, int deadline, uint gracePeriod, uint interestRate) onlyusers returns (uint loanId){
		loanId = uint(sha3(uint(beneficiary) + now));
		Loan l = loans[loanId];
		l.beneficiary = msg.sender;
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
			loan.amountSpent[msg.sender] = msg.value;
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
		uint i;
		address addr;
		if(loan.deadline >= now){
			for(i = 0; i<l.lenders.length; i++){
				addr = l.lenders[i];
			}
		}else{
			throw;
		}
	}
}