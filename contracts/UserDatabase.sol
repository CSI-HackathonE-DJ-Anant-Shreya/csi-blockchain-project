pragma solidity ^0.4.7;
contract UserDatabase{
	mapping (address => string) private passwords;
	mapping (address => bool) existance;

	function addUser(address _user, string _pass){
		if (passwords[_user]!=0){
			passwords[_user] = _pass;
			existance[_user] = true;
		}
	}

	function verifyUser(address _addr, string _pass) returns bool{
		if(passwords[_addr] == _pass){
			return true;
		}
		return false;
	}

	modifier onlyusers{
		if(existance[msg.sender] == true){
			_;
		}else{
			throw;
		}		
	}

}