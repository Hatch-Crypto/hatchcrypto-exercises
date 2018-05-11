pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "../contracts/UsingStringUtils.sol";


contract UsingStringUtilsTest {
    UsingStringUtils instance = new UsingStringUtils();

    function testLength() public {
        Assert.equal(instance.length("Hello, World!"), 13, "Hello, World! lenght should be 13");
        Assert.equal(instance.length("Lorem ipsum"), 11, "Lorem ipsum lenght should be 11");
    }

    function testGreetings() public {
        string memory text = instance.greetings("Vitalik");
        string memory expected = "Hello, Vitalik!";
        Assert.equal(text, expected, "returned text is different than Hello, Vitalik!");
    }
}
