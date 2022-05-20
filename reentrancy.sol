pragma solidity ^0.8.0;
 interface ISimpleBank{
      function deposit() external payable;
      

    function withdraw(uint _amount) external;
     
        
    }

contract simpleBank is ISimpleBank{
    mapping(address => uint) balances;

    constructor() payable {
        balances[msg.sender]+=msg.value;

    }
    function ContractBalance() public view returns(uint){
        return address(this).balance;
    }

    function deposit() public override payable{
        balances[msg.sender] += msg.value;

    }

    function withdraw(uint _amount) public override{
        require(balances[msg.sender]>=_amount);
        payable(msg.sender).transfer(_amount);  
        balances[msg.sender]-=_amount;
        
        

    }
}


