//pragma solidity ^0.4.0;

contract Bank {
    uint a = 2;
    bool c0 = true;
    mapping(address => mapping(address => uint)) credits;

    function testRet() public returns (bool res) {
        /* .call() returns two arguments: bool, bytes memory
        however, we don't support `bytes` type (so we can't define a variable to capture
        the second return value;
        neither do we seem to support omitting some return values (as seen below) */
        (res, ) = msg.sender.call.value(300)("");
        return res;
    }

}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
        bool result;
        result = bank.testRet();
    }
}