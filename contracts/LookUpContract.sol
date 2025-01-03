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
        string tokenCreatedDate;
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

    modifier onlyOwner() { //Function provide flexibility to change listing price based on user.
        require(
            msg.sender == contractOwner,
            "Only owner of this contract can change the listing price."
        );
        _;
    }

    function createERC20Token(address _owner, string memory _tokenSupply, string memory _tokenName, string memory _tokenSymbol, string memory _tokenAddress, string memory _tokenTransactionHash, string memory _tokenCreatedDate) payable external returns (unit256, address, string memory, string memory, string memory, string memory ) {
        _tokenIndex++;
        unit256 _tokenId = _tokenIndex;
        ERCToken storage erc20Token = erc20Tokens[_tokenId];

        erc20Token.tokenID = _tokenId;
        erc20Token.owner = _owner;
        erc20Token.tokenSupply = _tokenSupply;
        erc20Token.tokenName = _tokenName;
        erc20Token.tokenSymbol = _tokenSymbol;
        erc20Token.tokenAddress = _tokenAddress;
        erc20Token.tokenTransactionHash = _tokenTransactionHash;
        erc20Token.tokenCreatedDate = _tokenCreatedDate;

        emit ERC20TokenListed(_tokenId, _owner, _tokenAddress);

        return (_tokenId, _owner, _tokenAddress, _tokenName, _tokenSymbol, _tokenAddress);
    }

    function getAllERC20TokenListed() public view returns (ERC20Token[] memory) {
        uint256 itemCount = _tokenIndex;
        uint currentyIndex = 0;

        ERC20Token[] memory items = new ERC20Token[](itemCount);

        for (unit256 i = 0; i < itemCount; i++) {
            uint256 currentId = i + 1;
            ERC20Token storage currenItem = erc20Tokens[currentId];
            items[currentyIndex] = currenItem;
            currentyIndex++;
        }

        return items;
    }

    
}