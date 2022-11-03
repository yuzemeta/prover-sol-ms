contract Bank {
   mapping(address=>uint) balances;

  constructor () public payable {
    
  }

   function getUserBalance(address user) public view returns(uint u) {
     return balances[user];
   }

   function deposit() public payable {
     balances[msg.sender] += msg.value;
   }

   function receiveMondy() public payable {

   }

   function getMyBalance() public returns (uint b) {
       b = address(this).balance;
       return b;
   }


   function withdraw(uint amount) public {
     //balances[msg.sender]=p;

      //uint credit = balances[msg.sender];

      if( balances[msg.sender] >= amount) {
        balances[msg.sender] = balances[msg.sender] - amount;
        msg.sender.call.value(amount).gas(100)("");
      }
   }

}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = (new Bank).value(3)();
        //bank = new Bank();

        assert(address(bank).balance == 3);
        
        address(bank).call.gas(100).value(6);

        assert(address(bank).balance == 9);

        uint originalBalance;

        originalBalance = bank.getUserBalance(address(this));

        bank.deposit.value(10).gas(200)();

        uint newBalance;

        newBalance = bank.getUserBalance(address(this));

        assert(newBalance == originalBalance + 10);

        bank.withdraw(10);

        newBalance = bank.getUserBalance(address(this));

        assert(newBalance == originalBalance);

    }
}
