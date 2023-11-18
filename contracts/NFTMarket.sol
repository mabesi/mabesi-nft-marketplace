// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTMarket {

    address payable owner;
    uint public listingPrice = 0.025 ether;

    constructor()  {
        owner = payable(msg.sender);
    }

    struct MarketItem {
        uint itemId;
        address nftContract;
        uint tokenId;
        address payable seller;
        address payable owner;
        uint price;
        bool sold;
    }

    mapping(uint => MarketItem) public marketItems; //item id => market item

    function createMarketItem(address nftContract, uint tokenId, uint price) public payable {
        require(price > 0, "Price cannot be zero");
        require(msg.value == listingPrice, "Value must be equal listing price");
    }

}
