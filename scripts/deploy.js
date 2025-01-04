const hre = require("hardhat");

const tokens = (_number) => {
  return ethers.utils.parseUnits(_number.toString(), "ether");
};

async function main() {
    //ERC20TokenGenerator
    
    const _tokenName = "MONKEY TOKEN"; //Change
    const _tokenSymbol = "MNT";
    const _initialSupply = tokens(1000);
    const ERC20Generator = await hre.ethers.getContractFactory("ERC20Generator");
    const erc20Generator = await ERC20Generator.deploy( _initialSupply, _tokenName, _tokenSymbol); //Change

    await erc20Generator.deployed();
    console.log(`erc20Generator: ${erc20Generator.address}`); //Change

    //LookupContract

    const LookUpContract = await hre.ethers.getContractFactory("LookUpContract");
    const lookUpContract = await LookUpContract.deploy();

    await lookUpContract.deployed();
    console.log(` LookUpContract: ${lookUpContract.address}`); //Change
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});