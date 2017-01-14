pragma solidity ^0.4.7;
library UserLib{
	struct User{
		address userAddress;
		uint loansTaken[];//loanIDs of loans taken
		uint contributedTo[];//loanIDs of loans contributed to
	}
	//use these in the interator
	function startOfFundraisingLoans(User self) returns (uint index){

	}

	function nextFundraisingLoan(User self, uint _index) returns (uint index){

	}

	function hasMoreFundraisingLoans(User self, uint _index) returns bool{

	}

	function startOfRepayingLoans(User self) returns (uint index){

	}

	function nextRepaymentLoan(User self, uint _index) returns (uint index){

	}

	function hasMoreRepaymentLoans(User self, uint _index) returns bool{
		
	}
}