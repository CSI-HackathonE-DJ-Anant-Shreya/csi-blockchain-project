pragma solidity ^0.4.7;
import "./Loans.sol";
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
			l = Loans.loans[self.loansTaken[i]];
			if(l.amount >= l.amountRequired){
				return i;
			}
		}
		return self.loansTaken.length;
	}

	function nextFundraisingLoan(User self, uint _index) returns (uint index){
		return 0;
	}

	function hasMoreFundraisingLoans(User self, uint _index) returns bool{
		return false;
	}

	function startOfRepayingLoans(User self) returns (uint index){
		return 0;
	}

	function nextRepaymentLoan(User self, uint _index) returns (uint index){
		return 0;
	}

	function hasMoreRepaymentLoans(User self, uint _index) returns bool{
		return false;
	}
}
