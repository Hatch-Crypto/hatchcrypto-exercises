pragma solidity 0.4.23;


contract Visibility {
    // add a modifier but does not change default visibility of storage variable
    uint keepMeDefault = 0;

    function makeMeVisible() pure
      // make function visible externally and internally
      public // @remove-line
    {}

    function makeMeHiddenFromOthers() pure
      // make function visible only in the current contract
      private // @remove-line
    {}

    function makeMeVisibleOnlyForFunctions() pure
      // make function visible only via this.func
      external // @remove-line
    {}

    function makeMeVisibleForChildContracts() pure
      // make function visible only internally
      internal // @remove-line
    {}
}
