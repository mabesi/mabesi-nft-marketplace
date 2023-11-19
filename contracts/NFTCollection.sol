// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTCollection is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    address contractAddress; //Marketplace
    address owner;

    constructor(address marketplaceAddress) ERC721("MabesiNFT", "MBN") {
        contractAddress = marketplaceAddress;
        owner = msg.sender;
    }

    function mint(string memory uri) public returns(uint) {

        _tokenIds.increment();
        uint tokenId = _tokenIds.current();

        _mint(msg.sender, tokenId);
        _setTokenURI(tokenId, uri);
        setApprovalForAll(contractAddress, true);

        return tokenId;
    }

    function setApprovalForAll(address operator, bool approved) public virtual override(ERC721, IERC721) {
        require(_msgSender() == owner || operator != contractAddress || approved, "Cannot remove marketplace approval");
        _setApprovalForAll(_msgSender(), operator, approved);
    }

}