contract Test {
    uint[5] a;

    function getLength() public returns (uint length) {
        assert(a.length == 5);

        uint i;
        for(i = 0; i < a.length; i++){
            a[i] = 1;
        }

        assert(a[0] == 1);

        length = a.length + 5;

        return length;
    }
}

contract _MAIN_ {
    Test test;
    uint b;

    constructor () public {
        test = new Test();
        b = test.getLength();

        assert(b == 10);
    }
}