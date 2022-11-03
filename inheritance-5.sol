contract Person {
    uint internal age;

    constructor (uint ag) public {
        age = ag;
    }

    function getAge() public returns (uint r) {
        return age;
    }
}

contract Parent is Person { 
    uint internal sum;

    constructor (uint amt) public Person(amt) {
        sum = amt;
    }


    function setValue(uint a, uint b) external { 
        sum += a + b;
    }

    function getValue() external view returns(uint r) { 
        return sum; 
    } 
} 

contract Child is Parent { 
    uint internal value;

    constructor (uint amt) public Parent(amt) {
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

        assert(result == 430);

        uint age;

        age = cc.getAge();

        assert(age == 200);
    }
}
