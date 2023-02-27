// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MyToken.sol";

contract ERC721Test is Test {
    MyToken myToken;

    // create 2 users;
    address alice = address(0x1);
    address bob = address(0x2);

    // @notice setUp function allows to create a new instance of the imported contract
    // function setUp() public {
    //     erc721 = new ERC721();
    // }

    // The user can mint an NFT
    function testMintToken() public {
        myToken = new MyToken();
        myToken.mint(alice);
    }

    // Check if the user recieve the NFT
    function testBalanceof() public {
        myToken = new MyToken();
        myToken.mint(alice);
        uint currentTokenId = myToken._tokenIds();
        address currentOwner = myToken.ownerOf(currentTokenId);
        assertEq(alice, currentOwner);
    }

    // Transfer the the token from the original owner to another address
    function testTransferToken() public {
        myToken = new MyToken();
        myToken.mint(bob);
        uint currentTokenId = myToken._tokenIds();
        //I have to execute the function as If I was Bob to be able to transfer the token
        vm.startPrank(bob);
        myToken.safeTransferFrom(bob, alice, currentTokenId);
        address currentOwner = myToken.ownerOf(currentTokenId);
        assertEq(alice, currentOwner);
    }

    function testBurnToken() public {
        myToken = new MyToken();
        myToken.mint(bob);
        uint currentTokenId = myToken._tokenIds();
        vm.startPrank(alice);
        vm.expectRevert("caller is not owner nor approved");
        myToken.burn(currentTokenId);
        
    }






    
}




// pragma solidity ^0.8.13;

// import "forge-std/Test.sol";
// import "../src/Counter.sol";

// contract CounterTest is Test {
//     Counter public counter;

//     // @notice setUp function allows to create a new instance of the imported contract
//     function setUp() public {
//         counter = new Counter(100);
//     }

//     /// @notice test Get Count function
//     function testGetCount() public {
//         uint256 value = counter.getCount();
//         assertEq(value, 100); 
//         // To console log the result
//         emit log_named_uint("The value is", value);
//     }

//     /// @notice test Increment function
//     function testIncrement() public {
//         // Call the function from the counter instance
//         counter.increment();
//         uint256 value = counter.getCount();
//         assertEq(value, 101);
//         emit log_named_uint("The value incremented", value);
//     }

//     /// @notice test Decrement function
//     function testDecrement() public {
//         counter.decrement();
//         uint256 value = counter.getCount();
//         assertEq(value, 99);
//         emit log_named_uint("The value decremented", value);
//     }
