contract Test {

    function getLength() public returns (uint length) {

        uint[] memory test;
        test[0] = 10;
        test[1] = 20;

        assert(test[0] == 10);
        assert(test[1] == 20);

        uint[2] memory cc;
        cc[0] = 1;
        cc[0] = 2;

        assert(cc.length == 2);

        length = test.length;

        return length;
    }
}

contract _MAIN_ {
    Test test;
    uint b;

    constructor () public {
        test = new Test();
        b = test.getLength();
    }
}