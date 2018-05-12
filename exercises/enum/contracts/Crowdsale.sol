pragma solidity 0.4.23;


contract Crowdsale {
    // define Stage enum with Presale, Open and Closed values
    enum Stage { Presale, Open, Closed }          // @remove-line

    Stage public stage = Stage.Closed;

    // require stage to be Presale or Open
    modifier whenNotClosed() {
        require(stage != Stage.Closed);            // @remove-line
        _;                                         // @remove-line
    }

    function rate() view public returns (uint) {
        // rate is 50x when presale
        if (stage == Stage.Presale) return 50;     // @remove-line
        // rate is 5x otherwise
        return 5;                                  // @remove-line
    }

    function buyTokens() view whenNotClosed public {
        // implementaton is irrelevant for this exercise
    }
}
