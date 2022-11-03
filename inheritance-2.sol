contract Parent{ 
    uint internal sum; 
       

    function setValue(uint a, uint b) external { 
        sum = a + b;
    }

    function getValue() external view returns(uint r) { 
        return sum; 
    } 
} 

contract Child is Parent{ 

    function getValue() external view returns(uint r) { 
        return 2 * sum; 
    } 
} 

contract _MAIN_ {
    Parent cc;
    Parent pp;
    uint result;

    constructor () public {

        pp = new Parent();
        pp.setValue(10, 20);
        result = pp.getValue();

        assert(result == 30);

        cc = new Child();

        cc.setValue(10, 20);
        result = cc.getValue();

        assert(result == 60);
    }
}
