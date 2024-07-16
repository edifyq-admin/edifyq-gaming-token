// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./EdifyqGamingToken.sol";

contract EdifyqGamingVendor {
    EdifyqGamingToken gamingToken;

    address private _owner;
    uint256 public tokensPerEth = 5000;

    event BuyTokens(address buyer, uint256 amountOfEth, uint256 amountOfTokens);
    event TokenValueChange(uint256 tokensPerEth);

    constructor(address tokenAddress) {
        _owner = msg.sender;
        gamingToken = EdifyqGamingToken(tokenAddress);
    }

    function buyTokens() public payable returns (uint256 tokenAmount) {
        require(msg.value > 0, "You need to send some Eth to proceed");
        uint256 amountToBuy = msg.value * tokensPerEth / 10 ** 18;

        uint256 vendorBalance = gamingToken.balanceOf(address(this));
        require(vendorBalance >= amountToBuy, "Vendor has insufficient tokens");

        (bool sent) = gamingToken.transfer(msg.sender, amountToBuy);
        require(sent, "Failed to transfer token to user");

        emit BuyTokens(msg.sender, msg.value, amountToBuy);

        return amountToBuy;
    }

    function setTokensPerEth(uint256 value) public {
        require(msg.sender == _owner, "Must be the owner");
        require(value > 0, "The value must be greater than zero");
        require(value != tokensPerEth, "The value must be different than the current value");
        tokensPerEth = value;

        emit TokenValueChange(tokensPerEth);
    }

    function withdraw() public {
        require(msg.sender == _owner, "Must be the owner");
        uint256 ownerBalance = address(this).balance;
        require(ownerBalance > 0, "No Eth present in Vendor");

        (bool sent,) = msg.sender.call{value: address(this).balance}("");
        require(sent, "Failed to withdraw");
    }
}
