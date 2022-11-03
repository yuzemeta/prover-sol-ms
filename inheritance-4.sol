contract Person {
    uint internal age;

    constructor (uint ag) public {
        age = ag;
    }

    function getAge() public returns (uint r) {
        return age;
    }
}

contract Parent is Person(50) { 
    uint internal sum;

    constructor (uint amt) public {
        sum = amt;
    }


    function setValue(uint a, uint b) external { 
        sum += a + b;
    }

    function getValue() external view returns(uint r) { 
        return sum; 
    } 
} 

contract Child is Parent(7) { 
    uint internal value;

    constructor (uint amt) public {
        value = amt;
    }

    function getValue() external view returns(uint r) { 
        return value + sum; 
    } 
} 

contract _MAIN_ {
    Parent cc;
    uint result;

    constructor () public {

        cc = new Child(200);

        cc.setValue(10, 20);
        result = cc.getValue();

        assert(result == 237);

        uint age;

        age = cc.getAge();

        assert(age == 50);
    }
}
