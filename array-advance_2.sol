contract Test {
    uint[][2] d;
    uint k;
    uint length;

    constructor () public {
        length = 0;
    }

    function getLength() public returns (uint t) {
        k = d[0].length;

        d[0].push(6);
        length++;
        d[0].push(7);
        length++;

        assert(d[0][k] == 6);
        assert(d[0][k+1] == 7);

        assert(d[0].length == k+2);

        assert(d[0][k] < d[0][k+1]);


        return length;
    }
}

contract _MAIN_ {
    Test test;
    uint b;

    constructor () public {
        b = 0;
        test = new Test();
        b = test.getLength();

        assert(b == 2);
    }
}