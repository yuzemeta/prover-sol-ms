contract Test {
    uint[] a;

    function getLength() public returns (uint length) {
        assert(a.length == 0);

        a.push(1);

        assert(a.length == 1);

        a.pop();
        assert(a.length == 0);

        uint len;
        len = a.push(2);
        assert(len == 1);

        length = a.length;
        assert(length == 1);

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