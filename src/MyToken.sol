// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC721, Ownable {
    uint256 public _tokenIds;

    constructor() ERC721("MyToken", "MTK") {}

    function mint(address to) public onlyOwner returns (uint256) {
        _tokenIds++;
        uint256 tokenId = _tokenIds;
        _mint(to, tokenId);
        return tokenId;
    }

    function burn(uint256 tokenId) public {
        require(_isApprovedOrOwner(msg.sender, tokenId), "caller is not owner nor approved");
        _burn(tokenId);
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public override {
        require(_isApprovedOrOwner(msg.sender, tokenId), "caller is not owner nor approved");
        super.transferFrom(from, to, tokenId);
    }
}