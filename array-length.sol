contract Test {
    uint x = 1;
    uint[] a;
    uint[5] c;
    uint[][] d;

    function getLength() public returns (uint length) {

        c[0] = 1;
        c[1] = 2;

        uint temp;
        temp = c[0] + c[1];

        assert(temp == 3);

        a.length = 2;

        length = a.length + 3;
        assert(length == 5);

        a.push(1);

        assert(a.length == 3);

        a.pop();
        assert(a.length == 2);

        uint len;
        len = a.push(2);
        assert(len == 3);

        assert(c.length == 5);

        uint[7] memory local;

        assert(local.length == 7);

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