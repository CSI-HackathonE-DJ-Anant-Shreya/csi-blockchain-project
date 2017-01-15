pragma solidity ^0.4.7;
import "./Loans.sol";
import LoansLib.Loan as Loan from "./LoansLib.sol";
import LoansLib.loans as loans from "./LoansLib.sol";
import LoansLib.loanIds as loanIds from "./LoansLib.sol";
library UserLib{
	struct User{
		address userAddress;
		uint loansTaken[];
		uint contributedTo[];
	}
	//use these in the interator
	function startOfFundraisingLoans(User self) returns (uint index){
		int i;
		Loans.Loan l;
		for(i = 0; i<self.loansTaken.length; i++){
			l = loans[self.loansTaken[i]];
			if(l.amount < l.amountRequired){
				return i;
			}
		}
		return self.loansTaken.length;
	}

	function nextFundraisingLoan(User self, uint _index) returns (uint index){
		uint i;
		Loan l;
		for(i = _index+1; i<self.loansTaken.length; i++){
			l = loans[self.loansTaken[i]];
			if(l.amount>l.amountRequired){
				return i;
			}
		}
		return self.loansTaken.length;
	}

	function hasMoreFundraisingLoans(User self, uint _index) returns bool{
		for(i = _index+1; i<self.loansTaken.length; i++){
			l = loans[self.loansTaken[i]];
			if(l.amount>l.amountRequired){
				return true;
			}
		}
		return false;
	}

	function startOfRepayingLoans(User self) returns (uint index){
		int i;
		Loans.Loan l;
		for(i = 0; i<self.loansTaken.length; i++){
			l = loans[self.loansTaken[i]];
			if(l.amount >= l.amountRequired){
				return i;
			}
		}
		return self.loansTaken.length;	}

	function nextRepaymentLoan(User self, uint _index) returns (uint index){
		uint i;
		Loan l;
		for(i = _index+1; i<self.loansTaken.length; i++){
			l = loans[self.loansTaken[i]];
			if(l.amount>=l.amountRequired){
				return i;
			}
		}
		return self.loansTaken.length;
	}

	function hasMoreRepaymentLoans(User self, uint _index) returns bool{
			l = loans[self.loansTaken[i]];
			if(l.amount>=l.amountRequired){
				return true;
			}
		}
		return false;
	}
}
