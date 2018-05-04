pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "./Bookshelf.sol";


contract BookshelfTest {
    Bookshelf bookshelf = new Bookshelf();

    function testGetBook() public {
        string memory title;
        uint pages;

        (title, pages) = bookshelf.getBook(0);
        Assert.equal(title, "The Internet of Money", "title of the book is invalid");
        Assert.equal(pages, 150, "number of pages is invalid");
    }

    function testGetBookTitle() public {
        string memory title = bookshelf.getBookTitle(0);
        Assert.equal(title, "The Internet of Money", "title of the book is invalid");
    }
}
