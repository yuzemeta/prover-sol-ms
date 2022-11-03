contract Test {
    uint[5] a;
    uint[5] b;

    function getUserBalance() public {
        a = b;
    }

}

contract _MAIN_ {
    Test test;

    constructor () public {
        test = new Test();
        test.getUserBalance();
    }
}