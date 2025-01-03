const hre = require("hardhat");

const tokens = (_number) => {
  return ethers.utils.parseUnits(_number.toString(), "ether");
};

async function main() {
    //ERC20TokenGenerator
    
    const _tokenName = "Monkey Token";
    const _tokenSymbol = "MNT";
    const _initialSupply = tokens(10000);
    const ERC20Generator = await hre.ethers.getContractFactory("ERC20Generator");
    const erc20Generator = await ERC20Generator.deploy(_tokenName, _tokenSymbol, _initialSupply); //Change

    await erc20Generator.deployed();
    console.log("ERC20Generator deployed to:", erc20Generator.address); //Change

    //LookupContract

    const LookUpContract = await hre.ethers.getContractFactory("LookUpContract");
    const lookUpContract = await LookUpContract.deploy();

    await lookUpContract.deployed();
    console.log("LookUpContract deployed to:", lookUpContract.address); //Change
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});