// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract LookUpContract {

    struct ERC20 {
        uint256 tokenID;
        address owner;
        string tokenSupply;
        string tokenName;
        string tokenSymbol;
        string tokenAddress;
        string tokenTransactionHash;
        string tokenCreationDate;
    }

    struct Donation {
        uint256 donationID;
        address donor;
        uint256 fund;
    }

    address payable contractOwner = payable(0xE527F7b4339034B1De00099fa8D634D367eC0F75);

    unit256 public listingPrice = 0.025 ether;
    mapping (uint256 => ERC20Token) private erc20Tokens;
    mapping (uint256 => Donation) private donations;
    uint256 public _tokenIndex;
    uint256 public _donationIndex;

    event DonationReceived(address indexed donor, uint256 amount);
    event ERC20TokenListed(uint256 indexed id, address indexed owner, string indexed token);

    modifier  {
        
    }
}