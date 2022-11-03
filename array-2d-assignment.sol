contract Test {
    uint[5][5] a;
    uint b;

    constructor () public {

    }

    function test() public {
        b = a[0][0];

        a[0][0] = a[0][0] + 1;

        assert(b + 1 == a[0][0]);
    }

}

contract _MAIN_ {
    Test test;

    constructor () public {
        test = new Test();
        test.test();
    }
}