contract BaseBank {
    uint base;

    constructor () public {
        base = 7;

        funcA();
    }

    function funcA() public returns (uint r) {
        uint tmpInt = base;

        return tmpInt;
    }
}

contract Bank is BaseBank {
    uint a;
    uint b;

    constructor () public {
        a = 77;
    }

    function test() public returns (uint) {
        uint temp;
        temp = funcA();

        return temp;
    }
}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        uint result;

        bank = new Bank();
        result = bank.test();

        assert(result == 7);
    }
}